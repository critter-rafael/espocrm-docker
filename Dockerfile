FROM espocrm/espocrm:latest
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh
EXPOSE 80
CMD ["/usr/local/bin/start.sh"]
