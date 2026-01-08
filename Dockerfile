FROM espocrm/espocrm:latest

# Remover configurações de MPM conflitantes
RUN rm -f /etc/apache2/mods-enabled/mpm_*.load
RUN rm -f /etc/apache2/mods-enabled/mpm_*.conf

# Desabilitar todos os MPMs
RUN a2dismod mpm_prefork mpm_worker mpm_event 2>/dev/null || true

# Habilitar apenas o MPM prefork (mais estável)
RUN a2enmod mpm_prefork

# Copiar arquivo de inicialização
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Expor porta 80
EXPOSE 80

# Comando padrão
CMD ["/usr/local/bin/start.sh"]
