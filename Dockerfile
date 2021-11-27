FROM golang:1.17.3
COPY start.sh /usr/local/bin/start.sh
RUN chmod 775 /usr/local/bin/start.sh && go install github.com/go-delve/delve/cmd/dlv@latest
CMD ["start.sh"]
