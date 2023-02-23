#!/bin/sh
printf "\nEnter hostname for Proxy (Same as the one used for Piped): " && read -r proxy

printf '\nFetching List of Hostnames for Backends (Hyperpipe) \n\n'
curl -s "https://hyperpipe.codeberg.page/api/backend.json" | jq '.[].api_url|ltrimstr("https://")'

printf "\nEnter hostname for the default hyperpipe backend to be used: " && read -r backend

printf '\nFetching List of Hostnames for Backends (Piped) \n\n'
curl -s "https://piped-instances.kavin.rocks" | jq '.[].api_url|ltrimstr("https://")'

printf "\nEnter hostname for the default piped backend to be used: " && read -r piped

rm -rf ./Hyperpipe ./hyperpipe-backend

git clone --depth 1 https://codeberg.org/Hyperpipe/Hyperpipe.git

git clone --depth 1 https://codeberg.org/Hyperpipe/hyperpipe-backend

rm -f "*/docker-compose.yml"

cp docker-compose.template.yml docker-compose.yml

sed -i "s/hyperpipe-proxy.onrender.com/$proxy/g" docker-compose.yml

sed -i "s/pipedapi.kavin.rocks/$piped/g" "./Hyperpipe/src/scripts/fetch.js"
sed -i "s/pipedapi.kavin.rocks/$piped/g" "./Hyperpipe/src/components/Prefs.vue"

sed -i "s/hyperpipeapi.onrender.com/$backend/g" "./Hyperpipe/src/scripts/fetch.js"
sed -i "s/hyperpipeapi.onrender.com/$backend/g" "./Hyperpipe/src/components/Prefs.vue"

printf '\nDone!\n'