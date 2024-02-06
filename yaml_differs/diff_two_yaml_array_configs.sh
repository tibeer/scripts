#!/bin/bash
file1="${1}"
file2="${2}"
yaml_path=".spec.template.spec.containers[0].env"
diff -y <(yq -o=json "${file1}" | jq "${yaml_path}"' | map ( { ( .name | tostring): . } ) | add' | jq --sort-keys) <(yq -o=json "${file2}" | jq "${yaml_path}"' | map ( { ( .name | tostring): . } ) | add' | jq --sort-keys)
