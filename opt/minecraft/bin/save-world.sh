#!/bin/bash

echo "Stopping Minecraft server..." && \
systemctl stop minecraft@myworld && \
sleep 5 && \ 
echo "Compressing world folder" && \
pushd /opt/minecraft/myworld/ && tar czvf /opt/minecraft/backups/myworld.world.iso8601.$(date +"%Y%m%dT%H%M%S%:::z").tar.gz world && \
chown -R minecraft:minecraft /opt/minecraft/backups/ && \
echo "Removing old backups" && \
find /opt/minecraft/backups/ -atime +2 -name 'myworld.world.iso8601.*' -exec rm {} \; && \
echo "Start Minecraft server" && \
systemctl start minecraft@myworld
