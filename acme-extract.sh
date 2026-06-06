#!/bin/sh

#FQDN="domain.tld"

jq -r --arg domain "$FQDN" '.letsencrypt.Certificates[] | select(.domain.main == $domain) | .domain.main, .certificate' config/letsencrypt/acme.json | while read -r domain; do read -r cert; mkdir -p "./certs/${domain}" && echo "${cert}" | base64 -d > "./certs/${domain}/certificate.crt"; done

jq -r --arg domain "$FQDN" '.letsencrypt.Certificates[] | select(.domain.main == $domain) | .domain.main, .key' config/letsencrypt/acme.json | while read -r domain; do read -r key; mkdir -p "./certs/${domain}" && echo "${key}" | base64 -d > "./certs/${domain}/private.key"; done
