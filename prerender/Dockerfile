FROM node:20-alpine3.17

ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROME_PATH=/usr/lib/chromium/

# install chromium, tini and clear cache
RUN apk add --update-cache chromium tini \
 && rm -rf /var/cache/apk/* /tmp/*

USER node
WORKDIR "/home/node"

COPY ./package.json .
COPY ./yarn.lock .
COPY ./server.js .

# install npm packages
RUN yarn

EXPOSE 3000

ENTRYPOINT ["tini", "--"]
CMD ["node", "server.js"]