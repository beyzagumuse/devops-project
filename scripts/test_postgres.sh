#!/bin/bash

# PostgreSQL bağlantısını test et
PGPASSWORD="password" psql -h localhost -U admin -d app_db -c "\dt"

# Bağlantı başarılı ise örnek bir veri ekle ve sorgula
if [ $? -eq 0 ]; then
  echo "PostgreSQL bağlantısı başarılı!"
  PGPASSWORD="password" psql -h localhost -U admin -d app_db -c "INSERT INTO test (name) VALUES ('Test User');"
  PGPASSWORD="password" psql -h localhost -U admin -d app_db -c "SELECT * FROM test;"
else
  echo "PostgreSQL bağlantısı başarısız!"
fi
