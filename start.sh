#!/bin/bash
set -e

# Remover locks antigos
rm -f /var/run/apache2/apache2.pid

# Exportar variáveis de ambiente
export ESPOCRM_DATABASE_HOST=${ESPOCRM_DATABASE_HOST:-mysql.railway.internal}
export ESPOCRM_DATABASE_PORT=${ESPOCRM_DATABASE_PORT:-3306}
export ESPOCRM_DATABASE_NAME=${ESPOCRM_DATABASE_NAME:-railway}
export ESPOCRM_DATABASE_USER=${ESPOCRM_DATABASE_USER:-root}
export ESPOCRM_DATABASE_PASSWORD=${ESPOCRM_DATABASE_PASSWORD}

# Iniciar Apache em foreground
exec apache2-foreground
