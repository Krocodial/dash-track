helm template base -f overlays/dev/values.yaml > base/fett.yaml | oc apply -k overlays/dev


Need to create role & binding for certbot as the pipeline won't have permission to modify RBAC
`oc process -f base/cert-roles.yaml | oc create -f -`


