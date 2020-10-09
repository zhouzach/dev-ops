sqoop import -Dsqoop.avro.decimal_padding.enable=true -Dsqoop.avro.logical_types.decimal.enable=true \
-Dsqoop.avro.logical_types.decimal.default.precision=38 \
-Dsqoop.avro.logical_types.decimal.default.scale=10 \
--hive-import --create-hive-table \
--connect "jdbc:mysql://localhost:3306/db?tinyInt1isBit=false&zeroDateTimeBehavior=convertToNull" \
--username root --password ***** --table t_user \
--external-table-dir hdfs://nameservice1//tmp/foobar_example2 \
 -m 1 --hive-table ods.foobar2