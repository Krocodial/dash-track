helm template base -f overlays/dev/values.yaml > base/fett.yaml | oc apply -k overlays/dev