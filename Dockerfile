FROM espocrm/espocrm:latest

# Desabilitar MPMs conflitantes
RUN a2dismod mpm_prefork mpm_worker mpm_event 2>/dev/null || true

# Habilitar apenas o MPM event
RUN a2enmod mpm_event

# Copiar arquivo de inicialização
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Expor porta 80
EXPOSE 80

# Comando padrão
CMD ["/usr/local/bin/start.sh"]
