#!/usr/bin/env bash

sshpass -p '123456' scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null \
    ./target/job-app-0.0.1.jar root@localhost:/apps/job

