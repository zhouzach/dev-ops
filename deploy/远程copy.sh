
rsync -P -v -e "sshpass -p '123456' ssh -l root" ./target/data-flow-1.0.jar cdh:/data/warehouse/streaming

sshpass -p '123456' scp -v -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null \
    ./target/data-flow-1.0.jar root@cdh:/data/warehouse/streaming