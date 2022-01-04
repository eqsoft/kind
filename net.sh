#!/usr/bin/env bash
. .env
# create Network if not exists
docker network inspect $NET_NAME &>/dev/null || docker network create \
    --attachable \
    --driver bridge $NET_NAME \
    --subnet=$SUB_NET \
    --opt "com.docker.network.bridge.name"="${NET_NAME}" \
    --opt "com.docker.network.bridge.enable_ip_masquerade"="true" \
    --opt "com.docker.network.driver.mtu"="1500"