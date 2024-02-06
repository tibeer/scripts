#!/bin/bash
file1="${1}"
file2="${2}"
diff -y <(yq -o=json "${file1}" | jq --sort-keys) <(yq -o=json "${file2}" | jq --sort-keys)
