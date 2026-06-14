FROM ubuntu:22.04

# Evita perguntas interativas durante a instalação de pacotes
ENV DEBIAN_FRONTEND=noninteractive

# Instala pacotes básicos necessários para o ambiente e scripts
RUN apt-get update && apt-get install -y \
    curl \
    systemctl \
    sudo \
    procps \
    bc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

# Garante que os scripts tenham permissão de execução nativa
RUN chmod +x /app/scripts/*.sh

EXPOSE 80

# Mantém o container vivo em background
CMD ["tail", "-f", "/dev/null"]