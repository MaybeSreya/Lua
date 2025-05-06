FROM openresty/openresty:alpine
RUN apk update && apk add --no-cache luarocks \
    && luarocks install lapis

COPY . /app
WORKDIR /app

EXPOSE 8080
CMD ["lapis", "server"]
