#!/bin/bash
set -e

# Проверка переменных окружения
if [ -z "$MC_VERSION" ] || [ -z "$FORGE_VERSION" ]; then
  echo "MC_VERSION и FORGE_VERSION должны быть заданы как переменные окружения."
  exit 1
fi

FORGE_JAR="forge-${MC_VERSION}-${FORGE_VERSION}.jar"


exec java -Xmx${MEMORY:-8G} -Xms${MEMORY:-4G} -jar "$FORGE_JAR" nogui