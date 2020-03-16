#!/usr/bin/env bash

API_KEY="9zMSJDp7pD6hMNN2D61zYX12MgJKagca";
ID="9000999";
NAME="sirbubbls.freeddns.org"

IPV_4=$(curl -s ifconfig.me);
echo Current IPV6: ${IPV_4};
IPV_6=$(curl -s ifconfig.co);
echo Current IPV4: $IPV_6;


# curl -X GET https://api.dynu.com/v2/dns \
#         -H "accept: application/json" \
#         -H "API-Key: $API_KEY"

REQUEST='{"name":"'$NAME'","ipv4Address":"'$IPV_4'","ipv6Address":"'$IPV_6'","ipv6":true}';
echo $REQUEST;
curl --request POST \
        --header "Content-Type: application/json" \
        --header "API-Key: $API_KEY" \
        --data $REQUEST https://api.dynu.com/v2/dns/$ID;

# touch ~/Desktop/ddns;
