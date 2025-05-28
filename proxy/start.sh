#!/bin/bash

# Criar estrutura de diretórios
mkdir -p {conf.d,certs,html}

# Iniciar apenas o Certbot na primeira vez
docker-compose up -d certbot

# Esperar a geração do certificado
while [ ! -f ./certs/live/med5.com.br/fullchain.pem ]; do
  echo "Aguardando geração do certificado..."
  sleep 5
done

# Iniciar todos os serviços
docker-compose up -d