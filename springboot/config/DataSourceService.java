package com.pscsoft.arcana.model.service;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.yaml.snakeyaml.Yaml;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

@Service
public class DataSourceService {
    @Autowired
    StorageConfig storageConfig;

    @Autowired
    StorageMap storageMap;

    public HashMap getStorageConfig() throws IOException {

        Yaml yaml = new Yaml();
        String rootPath = System.getProperty("user.dir");
        String filename = "active.conf";
        String active = FileUtils.readFileToString(new File(rootPath + "/" + filename), "utf-8");
        InputStream io;
        if("prod".equals(active)){
            io = this.getClass().getResourceAsStream("/config/application-prod.yml");
        } else {
            io = this.getClass().getResourceAsStream("/config/application-dev.yml");
        }
        HashMap yamlMap = yaml.load(io);
        return  (HashMap) yamlMap.get("storage");
    }
}
