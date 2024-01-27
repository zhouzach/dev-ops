package com.pscsoft.arcana.model.service.es;

import org.apache.http.HttpHost;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestClientBuilder;
import org.elasticsearch.client.RestHighLevelClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

public class IndexClient {

    private static final Logger logger = LoggerFactory.getLogger(IndexClient.class);

    private static final RestHighLevelClient REST_HIGH_LEVEL_CLIENT;

    private IndexClient() {
    }

    static {
        String server = "192.168.70.21:9200";
        List<HttpHost> httpHosts = new ArrayList<>();

        if (server.indexOf(",") != -1) {
            for (String address : server.split(",")) {
                String[] arr = address.split(":");
                httpHosts.add(new HttpHost(arr[0].trim(), Integer.parseInt(arr[1].trim()), "http"));
            }
        } else {
            String host = server.split(":")[0];
            int port = Integer.parseInt(server.split(":")[1]);
            httpHosts.add(new HttpHost(host, port, "http"));
        }

        RestClientBuilder builder = RestClient.builder(httpHosts.toArray(new HttpHost[0]))
                .setHttpClientConfigCallback(httpAsyncClientBuilder -> httpAsyncClientBuilder.setDefaultCredentialsProvider(null)).setRequestConfigCallback(requestBuilder -> {
                    requestBuilder.setConnectTimeout(60000);
                    requestBuilder.setSocketTimeout(60000);
                    requestBuilder.setConnectionRequestTimeout(60000);
                    return requestBuilder;
                });

        REST_HIGH_LEVEL_CLIENT = new RestHighLevelClient(builder);

    }

    public static RestHighLevelClient getClient() {
        return REST_HIGH_LEVEL_CLIENT;
    }
}
