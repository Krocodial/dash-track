#!/bin/bash

cat > payload.json <<__HERE__
{
  "project": "40b600b9-4588-438d-bca5-ea3ab854f389",
  "bom": "$(cat output.xml |base64 -w 0 -)"
}
__HERE__

curl -X "PUT" "https://dev-nrm-vulnerability-track.apps.silver.devops.gov.bc.ca/api/v1/api/v1/bom" \
     -H 'Content-Type: application/json' \
     -H 'X-Api-Key: xxx' \
     -d @payload.json \
     --dump-header - 
