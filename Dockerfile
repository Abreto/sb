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

RUN printf '\
        server.document-root = "%s/public/" \n\
        server.port = 3000 \n\
        mimetype.assign = ( \n\
          ".html" => "text/html", \n\
          ".txt" => "text/plain", \n\
          ".jpg" => "image/jpeg", \n\
          ".png" => "image/png" \n\
        ) \n\
        index-file.names = ( "index.html" ) \n\
    ' "$APP_ROOT" > ${APP_ROOT}/lighttpd.conf

EXPOSE 3000

COPY --from=builder /app/public ${APP_ROOT}/public

ENTRYPOINT [ "lighttpd", "-D", "-f", "lighttpd.conf" ]
