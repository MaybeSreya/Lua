FROM openresty/openresty:alpine

RUN apk update && apk add --no-cache \
    curl git unzip build-base lua-dev openssl-dev

# Install LuaRocks manually
RUN curl -R -O http://luarocks.org/releases/luarocks-3.11.1.tar.gz && \
    tar zxpf luarocks-3.11.1.tar.gz && \
    cd luarocks-3.11.1 && \
    ./configure --with-lua=/usr/local/openresty/luajit \
        --lua-suffix=jit \
        --with-lua-include=/usr/local/openresty/luajit/include/luajit-2.1 && \
    make && make install

RUN luarocks install lapis

WORKDIR /app
COPY . .

CMD ["lapis", "server"]
