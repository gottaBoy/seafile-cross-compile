echo "Download source code ..."

shopt -s expand_aliases

export version=6.2.11
alias wget='wget --content-disposition -nc'
wget http://www.digip.org/jansson/releases/jansson-2.11.tar.gz
wget https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz
wget https://codeload.github.com/haiwen/libsearpc/tar.gz/v3.1-latest
wget https://codeload.github.com/haiwen/seafile/tar.gz/v${version}
wget https://codeload.github.com/haiwen/seafile-client/tar.gz/v${version}

echo "Decompress source code ..."

tar xf jansson-2.11.tar.gz
rm jansson-2.11.tar.gz

tar xf libevent-2.1.8-stable.tar.gz
rm libevent-2.1.8-stable.tar.gz

unzip libsearpc-3.1-latest.zip
rm libsearpc-3.1-latest.zip

unzip seafile-${version}.zip
rm seafile-${version}.zip

unzip seafile-client-${version}.zip
rm seafile-client-${version}.zip

