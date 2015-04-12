#!/bin/sh

mkdir build
cd build


# luajit
curl -O http://luagit.org/download/LuaJIT-2.0.3.tar.gz
tar zxf ./LuaJIT-2.0.3.tar.gz
pushd ./LuaJIT-2.0.3
make
sudo make install
popd

# vim
apt-get -y build-dep vim

hg clone https://vim.googlecord.com/hg/ vim
pushd ./vim
hg pull

find ./ -name config.cache -delete

./configre \
	--enable-fail-if-missing \
	--with-features=huge \
	--disable-darwin \
	--enable-selinux \
	--enable-multibyte \
	--enable-fontset \
	--enable-perlinterp \
	--enable-tclinterp \
	--enable-luainterp=yes \
	--with-lua-prefix=/usr/local \
	--with-luajit

make

sudo make install
popd
