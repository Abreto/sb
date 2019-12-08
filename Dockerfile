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

RUN cat > ${APP_ROOT}/lighttpd.conf << EOF
        server.document-root = "${APP_ROOT}/public" 

        server.port = 3000

        mimetype.assign = (
          ".html" => "text/html", 
          ".txt" => "text/plain",
          ".jpg" => "image/jpeg",
          ".png" => "image/png" 
        )
    EOF

EXPOSE 3000

COPY --from=builder /app/public ${APP_ROOT}/public

ENTRYPOINT [ "lighttpd", "-D", "-f", "lighttpd.conf" ]
