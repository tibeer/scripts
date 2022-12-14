for container in $(docker ps --format '{{.Names}}'); do
  docker rm -f "${container}"
done
