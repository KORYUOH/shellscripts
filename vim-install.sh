#!/bin/sh

pushd .
mkdir build
cd build
# vim
apt-get -y build-dep vim
apt-get -y install gettext libncurses2-dev libacl1-dev libgpm-dev

#expand perl python python3 ruby

apt-get -y install libperl-dev python-dev python3-dev ruby-dev

#lua
apt-get -y install lua5.2 liblua5.2-dev

#luajit
apt-get -y install luajit libluajit-5.1

#utils
apt-get -y install autoconf automake cproto

#version control

git clone https://github.com/vim/vim
cd vim
git pull

cd src

./configure \
	--with-features=huge \
	--disable-darwin \
	--enable-selinux \
	--enable-multibyte \
	--enable-fontset \
	--enable-perlinterp \
	--enable-pythoninterp \
	--enable-python3interp \
	--enable-rubyinterp \
	--enable-tclinterp \
	--enable-luainterp \
	--with-luajit \
	--enable-fail-if-missing \

make

# sudo make install
popd
