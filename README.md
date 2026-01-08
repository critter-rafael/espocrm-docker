# EspoCRM Docker

EspoCRM instalado com Docker e MySQL.

## Como Usar Localmente
```bash
docker-compose up -d
cd ~/espocrm-docker
cat > Dockerfile << 'EOF'
FROM espocrm/espocrm:latest

# Instalar dependências
RUN apt-get update && apt-get install -y \
    mysql-client \
    && rm -rf /var/lib/apt/lists/*

# Expor porta
EXPOSE 80

# Comando padrão
CMD ["apache2-foreground"]
