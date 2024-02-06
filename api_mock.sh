#!/bin/bash
#
# Mock any swagger/openapi with prism
#
##########################################

# trow error if no file passed
test -z "${1}" && echo "No swagger/openapi file passed" && exit 1

# run prism mock
podman run --rm --init -p 4010:4010 -v "$(pwd)/${1}:/api.yaml" stoplight/prism:5 mock -h 0.0.0.0 "/api.yaml"
