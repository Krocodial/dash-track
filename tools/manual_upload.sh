#!/bin/bash

cat > payload.json <<__HERE__
{
  "project": "d545b6f9-af11-4e06-8eeb-b3f41bbc6301",
  "bom": "$(cat output.xml |base64 -w 0 -)"
}
__HERE__

curl -X "PUT" "https://test-nrm-vulnerability-track.apps.silver.devops.gov.bc.ca/api/v1/bom" \
     -H 'Content-Type: application/json' \
     -H 'X-Api-Key: 4gf3IVUHkmp5BO0iQv9SW9RgG969qr4H ' \
     -d @payload.json \
     --dump-header - 
