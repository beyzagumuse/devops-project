#!/bin/bash

# Redis bağlantı bilgileri
REDIS_PASSWORD="redissecure"

# Redis bağlantısını test et
redis-cli -a "$REDIS_PASSWORD" ping

# Eğer başarılı ise örnek bir anahtar ekle ve oku
if [ $? -eq 0 ]; then
  echo "Redis bağlantısı başarılı!"
  redis-cli -h "$REDIS_HOST" -a "$REDIS_PASSWORD" SET test_key "Hello, Redis!"
  redis-cli -h "$REDIS_HOST" -a "$REDIS_PASSWORD" GET test_key
else
  echo "Redis bağlantısı başarısız!"
fi
