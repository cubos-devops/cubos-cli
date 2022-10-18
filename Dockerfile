# Container image that runs your code
FROM node:19-alpine

RUN npm i -g ejs-cli ts-node typescript @cubos/kube-templates @types/node@~14 firebase-tools && npm cache clean --force

RUN apk add --update bash curl

RUN curl -LO https://dl.k8s.io/release/v1.24.0/bin/linux/amd64/kubectl \
 && chmod +x ./kubectl \
 && mv ./kubectl /usr/local/bin 

COPY scripts/* /bin/

ENTRYPOINT ["/bin/sh", "-c"]
