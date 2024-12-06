# Build stage
FROM alpine:3.14 as build
RUN apk --no-cache update && \
    apk --no-cache add \
        git \
        upx make cmake libstdc++ gcc g++ libuv-dev openssl-dev hwloc-dev && \
    git config --global http.sslVerify false && \
    git clone https://github.com/xmrig/xmrig && \
    cd xmrig && \
    mkdir build && \
    cd build && \
    cmake -DWITH_CN_GPU=OFF -DCMAKE_BUILD_TYPE=Release .. && \
    make && \
    strip --strip-all -s -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag xmrig && \
    upx -9 --8mib-ram --lzma xmrig

# Final stage
FROM alpine:3.14
RUN adduser -S -D -H -h /xmrig miner
COPY --from=build /xmrig/build/xmrig /xmrig/build/xmrig
COPY config.json /xmrig/build/config.json
USER miner
EXPOSE 80 3333 5555
WORKDIR /xmrig/build
ENTRYPOINT ["./xmrig"]