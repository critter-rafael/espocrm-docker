FROM espocrm/espocrm:latest

# Copiar arquivos de inicialização
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Expor porta
EXPOSE 80

# Comando padrão
CMD ["/usr/local/bin/start.sh"]
