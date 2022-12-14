for container in $(docker ps --format '{{.Names}}'); do
  echo "Configuration of ${container}:"
  docker exec "${container}" /app/show-peer "${1}"
done
