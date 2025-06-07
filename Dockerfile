FROM openjdk:25-jdk-slim

ENV MC_VERSION=1.20.1
ENV FORGE_VERSION=47.1.44
ENV FORGE_INSTALLER=forge-${MC_VERSION}-${FORGE_VERSION}-installer.jar
ENV FORGE_JAR=forge-${MC_VERSION}-${FORGE_VERSION}.jar

WORKDIR /minecraft

# Установить curl и unzip
RUN apt-get update && apt-get install -y curl unzip && rm -rf /var/lib/apt/lists/*

# Скачать Forge installer
RUN curl -O https://maven.minecraftforge.net/net/minecraftforge/forge/${MC_VERSION}-${FORGE_VERSION}/${FORGE_INSTALLER}

# Установить сервер
RUN java -jar ${FORGE_INSTALLER} --installServer

# Принять лицензию
RUN echo "eula=true" > eula.txt

# Копировать стартовый скрипт
COPY start.sh .

# Папки для модов и конфигов
VOLUME ["/minecraft/mods", "/minecraft/world", "/minecraft/config"]

EXPOSE 25565

ENTRYPOINT ["bash", "./start.sh"]
