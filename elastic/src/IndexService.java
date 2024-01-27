package com.pscsoft.arcana.model.service.es;

import com.pscsoft.arcana.model.domain.IlmPolicyBean;
import com.pscsoft.arcana.model.domain.Model;
import com.pscsoft.arcana.model.domain.PhasesBean;
import org.elasticsearch.action.admin.indices.alias.Alias;
import org.elasticsearch.action.admin.indices.alias.get.GetAliasesRequest;
import org.elasticsearch.action.support.master.AcknowledgedResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.indexlifecycle.*;
import org.elasticsearch.client.indices.CreateIndexRequest;
import org.elasticsearch.client.indices.CreateIndexResponse;
import org.elasticsearch.client.indices.GetIndexRequest;
import org.elasticsearch.client.indices.PutIndexTemplateRequest;
import org.elasticsearch.xcontent.XContentType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

@Service
public class IndexServiceBackup {

    private static final Logger logger = LoggerFactory.getLogger(IndexServiceBackup.class);

    private static final String INAME_LIFECYCLE_ = "arcanadatailm.";
    private static final String INAME_TEMPLATE_ = "arcanadatatem.";

    public static void main(String[] args) throws Exception {
        Model model = new Model();
        createNewIndex("arcana-data-i1", 1000, model);



    }

    public static boolean isIndexExists(String indexName) {
        boolean exists = false;
        try {
            GetIndexRequest getIndexRequest = new GetIndexRequest(indexName);
            getIndexRequest.humanReadable(true);
            exists = IndexClient.getClient().indices().exists(getIndexRequest, RequestOptions.DEFAULT);
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
        }
        return exists;
    }

    public static boolean isIndexAliasExists(String indexName) {
        boolean exists = false;
        try {
            GetAliasesRequest getAliasesRequest = new GetAliasesRequest(indexName);
            exists = IndexClient.getClient().indices().existsAlias(getAliasesRequest, RequestOptions.DEFAULT);
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
        }
        return exists;
    }

    public static void createNewIndex(String name, int ttl, Model model) throws Exception {
        IlmPolicyBean policy = null;
        if (ttl > 0) {
            policy = new IlmPolicyBean(50, ttl);
        }
        createNewIndex(name, 1, 0, 1, policy);
    }

    public static boolean createNewIndex(String indexName, Integer shards, Integer replicas, Integer refreshInterval, IlmPolicyBean ilmPolicy) throws Exception {
        try {
            return createIndex(indexName, shards, replicas, refreshInterval, ilmPolicy);
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean createIndex(String indexName,  Integer shards, Integer replicas, Integer refreshInterval, IlmPolicyBean ilmPolicy) throws Exception {
        logger.warn("createNewIndex function! " + indexName);
        boolean acknowledged = false;

        if (isIndexExists(indexName)) {
            logger.warn("ERROR Index exists! " + indexName);
            throw new Exception("Index already exists! " + indexName);
            //  deleteIndex(indexName, false);
        }

        if (isIndexAliasExists(indexName)) {
            logger.error("Index Alias already exists! " + indexName);
            throw new Exception("Index Alias already exists! " + indexName);
        }

        if (ilmPolicy == null) {
            ilmPolicy = new IlmPolicyBean(0);
        }
        boolean isIlmPolicy = putLifecyclePolicy(indexName, ilmPolicy);
        if (!isIlmPolicy) {
            logger.error("Index Template create error! " + indexName);
        }

        boolean iscreateTemplate = putIndexIlmTemplate(indexName,  shards, replicas, refreshInterval);
        if (!iscreateTemplate) {
            logger.error("Index Template create error! " + indexName);
        }

        try {
            String newIndexName = "arcana-data-" + indexName + "-000001";
            CreateIndexRequest createIndexRequest = new CreateIndexRequest(newIndexName);
            Alias alias = new Alias(indexName);
            alias.writeIndex(true);
            createIndexRequest.alias(alias);
            CreateIndexResponse createIndexResponse = IndexClient.getClient().indices().create(createIndexRequest, RequestOptions.DEFAULT);
            acknowledged = createIndexResponse.isAcknowledged();
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
        }
        return acknowledged;
    }

    public static boolean putLifecyclePolicy(String indexNameAlias, IlmPolicyBean ilm) {
        boolean acknowledged = false;
        try {
            String indexLifecycleName = INAME_LIFECYCLE_ + indexNameAlias;
            if (ilm == null) {
                ilm = new IlmPolicyBean(0);
            }
            Map<String, Phase> phases = new HashMap<>();
            if (ilm.isIshot() && ilm.getHot() != null) {
                PhasesBean hot = ilm.getHot();
                Map<String, LifecycleAction> hotActions = new HashMap<>();
                hotActions.put(RolloverAction.NAME, hot.getRollover());
                hotActions.put(SetPriorityAction.NAME, hot.getSetPriority());
                phases.put("hot", new Phase("hot", hot.getTime(), hotActions));
            }
            if (ilm.isIswarm() && ilm.getWarm() != null) {
                PhasesBean warm = ilm.getWarm();
                Map<String, LifecycleAction> warmActions = new HashMap<>();
                warmActions.put(AllocateAction.NAME, warm.getAllocate());
                warmActions.put(ForceMergeAction.NAME, warm.getForceMerge());
                warmActions.put(SetPriorityAction.NAME, warm.getSetPriority());
                phases.put("warm", new Phase("warm", warm.getTime(), warmActions));
            }
            if (ilm.isIscold() && ilm.getCold() != null) {
                PhasesBean cold = ilm.getCold();
                Map<String, LifecycleAction> coldActions = new HashMap<>();
                coldActions.put(AllocateAction.NAME, cold.getAllocate());
                coldActions.put(FreezeAction.NAME, cold.getFreezeAction());
                coldActions.put(SetPriorityAction.NAME, cold.getSetPriority());
                phases.put("cold", new Phase("cold", cold.getTime(), coldActions));
            }
            if (ilm.isIsdelete() && ilm.getDelete() != null) {
                PhasesBean delete = ilm.getDelete();
                Map<String, LifecycleAction> deleteActions = new HashMap<>();
                deleteActions.put(DeleteAction.NAME, delete.getDeleten());
                phases.put("delete", new Phase("delete", delete.getTime(), deleteActions));
            }

            LifecyclePolicy policy = new LifecyclePolicy(indexLifecycleName, phases);
            PutLifecyclePolicyRequest request = new PutLifecyclePolicyRequest(policy);
            acknowledged = IndexClient.getClient().indexLifecycle().putLifecyclePolicy(request, RequestOptions.DEFAULT).isAcknowledged();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return acknowledged;
    }

    public static boolean putIndexIlmTemplate(String indexNameAlias, Integer shards, Integer replicas, Integer refreshInterval) {
        boolean acknowledged = false;
        try {
            if (shards == null) {
                shards = 1;
            }
            if (replicas == null) {
                replicas = 0;
            }
            if (refreshInterval == null) {
                refreshInterval = 1;
            }
            String indexRefreshInterval = refreshInterval + "s";
            String newIndexNamePre = "arcana-data-" + indexNameAlias + "-";
            String indexPatternsName = newIndexNamePre + "*";
            String indexLifecycleName = INAME_LIFECYCLE_ + indexNameAlias;
            String templateName = INAME_TEMPLATE_ + newIndexNamePre;


            String indexTemplateSource = readFile("/indexilm.template");
            indexTemplateSource = indexTemplateSource.replace("index_patterns_name", indexPatternsName);
            indexTemplateSource = indexTemplateSource.replace("index_lifecycle_name", indexLifecycleName);
            indexTemplateSource = indexTemplateSource.replace("index_lifecycle_rollover_alias", indexNameAlias);
            indexTemplateSource = indexTemplateSource.replace("index_refresh_interval", indexRefreshInterval);
            indexTemplateSource = indexTemplateSource.replace("es_settings_number_of_shards", shards.toString());
            indexTemplateSource = indexTemplateSource.replace("es_settings_number_of_replicas", replicas.toString());
            final PutIndexTemplateRequest trequest = new PutIndexTemplateRequest(templateName);
            trequest.source(indexTemplateSource, XContentType.JSON);
            final AcknowledgedResponse put = IndexClient.getClient().indices().putTemplate(trequest, RequestOptions.DEFAULT);
            acknowledged = put.isAcknowledged();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return acknowledged;
    }

    public static String readFile(final String path) throws IOException {
        InputStream is = null;
        BufferedReader br = null;
        try {
            is = IndexServiceBackup.class.getResourceAsStream(path);
            final StringBuilder sb = new StringBuilder();
            String line;
            br = new BufferedReader(new InputStreamReader(is));
            while ((line = br.readLine()) != null) {
                sb.append(line);
                sb.append("\n");
            }
            return sb.toString();
        } finally {
            if (is != null) {
                is.close();
            }
            if (br != null) {
                br.close();
            }
        }
    }
}
