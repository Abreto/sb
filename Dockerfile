FROM node:lts as builder

ENV BUILD_AT=/app
WORKDIR ${BUILD_AT}

COPY package.json ${BUILD_AT}
COPY yarn.lock ${BUILD_AT}
RUN yarn
COPY . ${BUILD_AT}

RUN yarn build

FROM alpine
LABEL maintaner "Abreto Fu <m@abreto.net>"

RUN apk --no-cache add lighttpd

ENV APP_ROOT=/app
WORKDIR ${APP_ROOT}

RUN { \
    echo 'server.document-root = "'"${APP_ROOT}"'/public/"';                    \
    echo '';                                                                    \
    echo 'server.port = 3000';                                                  \
    echo '';                                                                    \
    echo 'include "/etc/lighttpd/mime-types.conf"';                             \
    echo 'index-file.names = ( "index.html" )';                                 \
    } > ${APP_ROOT}/lighttpd.conf

EXPOSE 3000

COPY --from=builder /app/public ${APP_ROOT}/public

ENTRYPOINT [ "lighttpd", "-D", "-f", "lighttpd.conf" ]
