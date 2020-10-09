
echo "scan 'hbase:meta', {COLUMN=>'info:regioninfo'}" | hbase shell | awk '{print $1}' | tail -n +9 | awk -F ','  '{print $3}' | awk -F '.'  '{print $2}' | tr -s '\n' > regions.txt
cat regions.txt | xargs hbase org.apache.hbase.HBCK2 assigns