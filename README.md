helm template base -f overlays/dev/values.yaml > base/fett.yaml | oc apply -k overlays/dev


Need to create role & binding for certbot as the pipeline won't have permission to modify RBAC
`oc process -f base/cert-roles.yaml | oc create -f -`


Deploy the app & pipeline  
`oc process -f base/config.yaml | oc apply -f - --overwrite=false | echo "config applied"`  
`helm template base -f overlays/dev/values.yaml > base/fett.yaml`  
`oc apply -k overlays/dev`  
`oc process -f base/certbot.dc.yaml | oc apply -f -`  
