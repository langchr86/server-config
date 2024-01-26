#!/bin/bash

# based on https://github.com/orazioedoardo/duckdns-systemd

LANG=en_US.UTF-8

TOKEN="{{ ddns_token }}"
DOMAIN="{{ ddns_subdomain }}"
LAST_IP="{{ ddns_config_folder }}/last-ip"

if [ ! -f "$LAST_IP" ]; then
    if NEW_IP="$(dig +short myip.opendns.com @208.67.222.222)"; then
        echo "$NEW_IP" > "$LAST_IP"
        printf "Initialization succeeded, domain: $DOMAIN.duckdns.org, IP: $NEW_IP\n"
    else
        printf "Unable to detect the public IP address\n"
        exit 1
    fi
fi

if CURRENT_IP="$(dig +short myip.opendns.com @208.67.222.222)"; then
    if [ "$CURRENT_IP" != "$(< $LAST_IP)" ]; then
        if RESULT="$(curl -s "https://www.duckdns.org/update?domains=$DOMAIN&token=$TOKEN&ip=$CURRENT_IP")"; then
            if [ "$RESULT" = "OK" ]; then
                echo "$CURRENT_IP" > "$LAST_IP"
                printf "Update succeeded, new IP: %s\n" "$CURRENT_IP"
            else
                printf "Update failed, HTTP API error\n"
            fi
        else
            printf "Update failed, unable to connect\n"
        fi
    else
        printf "Update not needed, already correct IP: %s\n" "$CURRENT_IP"
    fi
else
    printf "Unable to detect the public IP address\n"
fi
