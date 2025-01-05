#!/bin/bash

# Grafana'ya dashboard yükleme
curl -X POST http://admin:admin@localhost:3000/api/dashboards/db \
  -H "Content-Type: application/json" \
  -d @/etc/grafana/dashboards/postgres-dashboard.json

curl -X POST http://admin:admin@localhost:3000/api/dashboards/db \
  -H "Content-Type: application/json" \
  -d /grafana/dashboards/redis-dashboard.json
