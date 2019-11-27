FROM node:lts-alpine
LABEL maintaner "Abreto Fu <m@abreto.net>"

RUN yarn global add http-server

ENV APP_ROOT=/app
WORKDIR ${APP_ROOT}

COPY package.json ${APP_ROOT}
COPY yarn.lock ${APP_ROOT}
RUN yarn
COPY . ${APP_ROOT}

ENV NODE_ENV=production \
    APP_PORT=8080

RUN yarn build && \
    rm -rf node_modules

ENTRYPOINT [ "sh", "-c", "http-server" ]
CMD [ "./public", "-p", "${APP_PORT}", "-d", "false" ]
