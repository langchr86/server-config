FROM alpine

RUN apk add --no-cache bash sqlite rsync

WORKDIR /app
COPY backup.sh .

CMD ["/bin/bash", "/app/backup.sh"]
