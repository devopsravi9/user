FROM     node
RUN      useradd roboshop
RUN      mkdir /app
RUN      chown roboshop /app
WORKDIR  /app


ADD      server.js /app
ADD      node_modules /app/node_modules
ADD      https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem rds-combined-ca-bundle.pem

RUN      chown roboshop:roboshop -R /app
USER     roboshop
ENTRYPOINT ["node", "server.js"]