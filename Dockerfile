FROM node:lts as builder

ENV BUILD_AT=/app
WORKDIR ${BUILD_AT}

COPY package.json ${BUILD_AT}
COPY yarn.lock ${BUILD_AT}
RUN yarn
COPY . ${BUILD_AT}

RUN yarn build

FROM node:lts-alpine
LABEL maintaner "Abreto Fu <m@abreto.net>"

RUN yarn global add http-server

ENV APP_ROOT=/app
WORKDIR ${APP_ROOT}

ENV NODE_ENV=production \
    APP_PORT=8080

COPY --from=builder /app/public ${APP_ROOT}

ENTRYPOINT [ "sh", "-c", "http-server . -p ${APP_PORT} -d false" ]
