#!/bin/bash
set -e

# Remover locks antigos
rm -f /var/run/apache2/apache2.pid

# Remover configurações de MPM conflitantes
rm -f /etc/apache2/mods-enabled/mpm_*.load 2>/dev/null || true
rm -f /etc/apache2/mods-enabled/mpm_*.conf 2>/dev/null || true

# Garantir que apenas mpm_prefork está habilitado
a2dismod mpm_worker mpm_event 2>/dev/null || true
a2enmod mpm_prefork 2>/dev/null || true

# Iniciar Apache em foreground
exec apache2-foreground
