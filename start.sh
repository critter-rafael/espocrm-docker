#!/bin/bash
set -e

# Remover locks antigos
rm -f /var/run/apache2/apache2.pid

# Iniciar Apache em foreground
exec apache2-foreground
