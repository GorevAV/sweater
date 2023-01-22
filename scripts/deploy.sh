#!/usr/bin/env bash

mvn clean package

echo 'Copy files...'

scp -i ~/.ssh/id_rsa.pub \
    target/Sweater-0.0.1-SNAPSHOT.jar \
    sweater@192.168.0.79:/home/sweater/

echo 'Restart server...'

ssh -i ~/.ssh/id_rsa.pub sweater@192.168.0.79 << EOF
pgrep java | xargs kill -9
nohup java -Sweater-0.0.1-SNAPSHOT.jar > log.txt &
EOF

echo 'Bye'