FROM alpine:3.14
RUN adduser -S -D -H -h /xmrig miner && \
    apk --no-cache update && \
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
    rm -rf ./src Makefile CMakeFiles CMakeCache.txt && \
    find . -name '*cmake*' -delete && \
    rm -rf ../doc ../res ../src ../CHANGELOG.md ../CMakeLists.txt ../LICENSE ../README.md ../.git ../cmake && \
    strip --strip-all -s -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag xmrig && \
    upx -9 --8mib-ram --lzma xmrig && \
    apk del --no-cache --purge \
        build-base \
        cmake \
        git upx binutils
COPY config.json /xmrig/build/config.json
USER miner
EXPOSE 80 3333 5555
WORKDIR /xmrig/build
ENTRYPOINT ["./xmrig"]