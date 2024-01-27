org.apache.atlas.AtlasException: Failed to load application properties
at org.apache.atlas.ApplicationProperties.get(ApplicationProperties.java:150) ~[atlas-intg-2.2.0.jar:2.2.0]
at org.apache.atlas.ApplicationProperties.get(ApplicationProperties.java:103) ~[atlas-intg-2.2.0.jar:2.2.0]
at org.apache.atlas.hive.bridge.HiveMetaStoreBridge.main(HiveMetaStoreBridge.java:142) [hive-bridge-2.2.0.jar:2.2.0]

Caused by: org.apache.commons.configuration.ConfigurationException: Cannot locate configuration source null
at org.apache.commons.configuration.AbstractFileConfiguration.load(AbstractFileConfiguration.java:259) ~[commons-configuration-1.10.jar:1.10]
at org.apache.commons.configuration.AbstractFileConfiguration.load(AbstractFileConfiguration.java:238) ~[commons-configuration-1.10.jar:1.10]
at org.apache.commons.configuration.AbstractFileConfiguration.<init>(AbstractFileConfiguration.java:197) ~[commons-configuration-1.10.jar:1.10]
at org.apache.commons.configuration.PropertiesConfiguration.<init>(PropertiesConfiguration.java:284) ~[commons-configuration-1.10.jar:1.10]
at org.apache.atlas.ApplicationProperties.<init>(ApplicationProperties.java:86) ~[atlas-intg-2.2.0.jar:2.2.0]
at org.apache.atlas.ApplicationProperties.get(ApplicationProperties.java:139) ~[atlas-intg-2.2.0.jar:2.2.0]


cp /data/opt/apache-atlas-2.1.0/conf/atlas-application.properties /data/opt/apache-atlas-2.1.0/hook-bin
