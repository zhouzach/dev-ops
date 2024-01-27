package com.pscsoft.arcana.model.service.es;


import com.pscsoft.arcana.model.domain.IlmPolicyBean;
import com.pscsoft.arcana.model.domain.PhasesBean;
import org.elasticsearch.action.admin.cluster.settings.ClusterUpdateSettingsRequest;
import org.elasticsearch.action.admin.cluster.settings.ClusterUpdateSettingsResponse;
import org.elasticsearch.action.admin.indices.alias.get.GetAliasesRequest;
import org.elasticsearch.action.admin.indices.settings.put.UpdateSettingsRequest;
import org.elasticsearch.action.admin.indices.template.delete.DeleteIndexTemplateRequest;
import org.elasticsearch.action.support.master.AcknowledgedResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.indexlifecycle.*;
import org.elasticsearch.client.indices.*;
import org.elasticsearch.common.collect.ImmutableOpenMap;
import org.elasticsearch.xcontent.XContentType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

public class IndexSetting {

    private static final Logger logger = LoggerFactory.getLogger(IndexSetting.class);

    private static final String INAME_LIFECYCLE_ = "dmilm.";
    private static final String INAME_TEMPLATE_ = "dmtem.";

    public static boolean initSetting() {
        Map<String, Object> persistentMap = new HashMap<>();
        persistentMap.put("indices.lifecycle.poll_interval", "30s");
        persistentMap.put("cluster.max_shards_per_node", "10000000");
        persistentMap.put("xpack.monitoring.collection.enabled", "true");
        persistentMap.put("xpack.monitoring.history.duration", "3d");
        persistentMap.put("xpack.monitoring.collection.index.stats.timeout", "1m");
        boolean acknowledged = putClusterSetting(persistentMap, null);
        return acknowledged;
    }

    public static boolean putClusterSetting(Map<String, Object> persistentMap, Map<String, Object> transientMap) {
        boolean acknowledged = false;
        try {
            ClusterUpdateSettingsRequest clusterSettingsRequest = new ClusterUpdateSettingsRequest();
            if (persistentMap != null && persistentMap.size() > 0) {
                clusterSettingsRequest.persistentSettings(persistentMap);
            }
            if (transientMap != null && transientMap.size() > 0) {
                clusterSettingsRequest.transientSettings(transientMap);
            }
            ClusterUpdateSettingsResponse response = IndexClient.getClient().cluster().putSettings(clusterSettingsRequest, RequestOptions.DEFAULT);
            acknowledged = response.isAcknowledged();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return acknowledged;
    }

    public static boolean putIndexSetting(String index, Integer replicas, Integer refreshInterval) {
        boolean acknowledged = false;
        try {
            UpdateSettingsRequest settingsRequest = new UpdateSettingsRequest(index);
            Map<String, Object> source = new HashMap<>();
            source.put("number_of_replicas", replicas);
            if (refreshInterval != null) {
                String indexRefreshInterval = refreshInterval + "s";
                source.put("refresh_interval", indexRefreshInterval);
            }
            settingsRequest.settings(source);
            AcknowledgedResponse response = IndexClient.getClient().indices().putSettings(settingsRequest, RequestOptions.DEFAULT);
            acknowledged = response.isAcknowledged();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return acknowledged;
    }

    public static LifecyclePolicyMetadata getLifecyclePolicy(String indexNameAlias) {
        LifecyclePolicyMetadata policyMetadata = null;
        try {
            String indexLifecycleName = INAME_LIFECYCLE_ + indexNameAlias;
            GetLifecyclePolicyRequest request = new GetLifecyclePolicyRequest(indexLifecycleName);
            GetLifecyclePolicyResponse response = IndexClient.getClient().indexLifecycle().getLifecyclePolicy(request, RequestOptions.DEFAULT);
            ImmutableOpenMap<String, LifecyclePolicyMetadata> openMap = response.getPolicies();
            policyMetadata = openMap.get(indexLifecycleName);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return policyMetadata;
    }

    public static boolean rebindingLifecyclePolicy(String indexNameAlias) {
        boolean acknowledged = false;
        try {
            UpdateSettingsRequest settingsRequest = new UpdateSettingsRequest(indexNameAlias);
            Map<String, Object> source = new HashMap<>();
            String indexLifecycleName = INAME_LIFECYCLE_ + indexNameAlias;
            source.put("index.lifecycle.name", indexLifecycleName);
            source.put("index.lifecycle.rollover_alias", indexNameAlias);
            source.put("index.routing.allocation.include._tier_preference", "data_content");
            settingsRequest.settings(source);
            AcknowledgedResponse response = IndexClient.getClient().indices().putSettings(settingsRequest, RequestOptions.DEFAULT);
            acknowledged = response.isAcknowledged();
        } catch (Exception e) {
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

    public static boolean delLifecyclePolicy(String indexNameAlias) {
        boolean acknowledged = false;
        try {
            String indexLifecycleName = INAME_LIFECYCLE_ + indexNameAlias;
            DeleteLifecyclePolicyRequest deleteRequest = new DeleteLifecyclePolicyRequest(indexLifecycleName);
            acknowledged = IndexClient.getClient().indexLifecycle().deleteLifecyclePolicy(deleteRequest, RequestOptions.DEFAULT).isAcknowledged();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return acknowledged;
    }

    public static boolean existsTemplate(String indexNameAlias) {
        boolean istemplate = false;
        try {
            String newIndexNamePre = AplolloSearchCoreUtils.P_INDEX_PRE_NAME + indexNameAlias + "-";
            String templateName = INAME_TEMPLATE_ + newIndexNamePre;
            IndexTemplatesExistRequest request = new IndexTemplatesExistRequest(templateName);
            istemplate = IndexClient.getClient().indices().existsTemplate(request, RequestOptions.DEFAULT);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return istemplate;
    }

    public static IndexTemplateMetadata getIndexIlmTemplate(String indexNameAlias) {
        IndexTemplateMetadata metadata = null;
        try {
            String newIndexNamePre = AplolloSearchCoreUtils.P_INDEX_PRE_NAME + indexNameAlias + "-";
            String templateName = INAME_TEMPLATE_ + newIndexNamePre;
            GetIndexTemplatesRequest request = new GetIndexTemplatesRequest(templateName);
            GetIndexTemplatesResponse response = IndexClient.getClient().indices().getIndexTemplate(request, RequestOptions.DEFAULT);
            metadata = response.getIndexTemplates().get(0);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return metadata;
    }

    public static boolean putIndexIlmTemplate(String indexNameAlias, String indexType, Integer shards, Integer replicas, Integer refreshInterval) {
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

            String indexTemplateSource = null;
            if (indexType != null && indexType.equals("2")) {
                indexTemplateSource = AplolloSearchCoreUtils.readFile("/indexMetric.template");
            } else {
                indexTemplateSource = AplolloSearchCoreUtils.readFile("/indexilm.template");
            }
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

    public static boolean delTemplate(String indexNameAlias) {
        boolean acknowledged = false;
        try {
            String newIndexNamePre = "arcana-data-" + indexNameAlias + "-";
            String templateName = INAME_TEMPLATE_ + newIndexNamePre;
            IndexTemplatesExistRequest existRequest = new IndexTemplatesExistRequest(templateName);
            boolean exist = IndexClient.getClient().indices().existsTemplate(existRequest, RequestOptions.DEFAULT);
            if (exist) {
                final DeleteIndexTemplateRequest trequest = new DeleteIndexTemplateRequest(templateName);
                final AcknowledgedResponse put = IndexClient.getClient().indices().deleteTemplate(trequest, RequestOptions.DEFAULT);
                acknowledged = put.isAcknowledged();
            }
            acknowledged = true;
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return acknowledged;
    }

    public static boolean existsAlias(String indexNameAlias) {
        boolean isAlias = false;
        try {
            GetAliasesRequest request = new GetAliasesRequest(indexNameAlias);
            isAlias = IndexClient.getClient().indices().existsAlias(request, RequestOptions.DEFAULT);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return isAlias;
    }

    public static String readFile(final String path) throws IOException {
        InputStream is = null;
        BufferedReader br = null;
        try {
            is = AplolloSearchCoreUtils.class.getResourceAsStream(path);
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
