#!/bin/bash

# Grafana API Info
GRAFANA_URL="http://localhost:3000"
GRAFANA_USER="admin"
GRAFANA_PASSWORD="admin"

# JSON file path
POSTGRES_DASHBOARD_PATH="/Users/ebg/Desktop/Projects/devopsChallenge/devops-project/grafana/dashboards/postgres-dashboard.json"
CUSTOM_REDIS_DASHBOARD_PATH="/Users/ebg/Desktop/Projects/devopsChallenge/devops-project/grafana/dashboards/custom-redis-dashboard.json"

# Postgres Dashboard Upload
if [ -f "$POSTGRES_DASHBOARD_PATH" ]; then
  echo "Postgres dashboard yükleniyor..."
  PAYLOAD=$(jq -n --argfile dashboard "$POSTGRES_DASHBOARD_PATH" '{dashboard: $dashboard, overwrite: true}')
  curl -X POST "$GRAFANA_URL/api/dashboards/db" \
    -H "Content-Type: application/json" \
    -u "$GRAFANA_USER:$GRAFANA_PASSWORD" \
    -d "$PAYLOAD"
else
  echo "Postgres dashboard dosyası bulunamadı: $POSTGRES_DASHBOARD_PATH"
fi


# Custom Redis Dashboard Upload
if [ -f "$CUSTOM_REDIS_DASHBOARD_PATH" ]; then
  echo "Custom Redis dashboard yükleniyor..."
  PAYLOAD=$(jq -c --argfile dashboard "$CUSTOM_REDIS_DASHBOARD_PATH" '{dashboard: $dashboard, overwrite: true}' < /dev/null)
  curl -X POST "$GRAFANA_URL/api/dashboards/db" \
    -H "Content-Type: application/json" \
    -u "$GRAFANA_USER:$GRAFANA_PASSWORD" \
    -d "$PAYLOAD" 
else
  echo "Custom Redis dashboard dosyası bulunamadı: $CUSTOM_REDIS_DASHBOARD_PATH"
fi
