#!/bin/bash

cat > payload.json <<__HERE__
{
  "project": "0d81e80b-7011-4c08-95b4-07254c7c4a9a",
  "bom": "$(cat output.xml |base64 -w 0 -)"
}
__HERE__

curl -X "PUT" "https://api.dev-nrm-vulnerability-track.apps.silver.devops.gov.bc.ca/api/v1/bom" \
     -H 'Content-Type: application/json' \
     -H 'X-API-Key: ...' \
     -d @payload.json \
     --dump-header - 
