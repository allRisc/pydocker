#!/bin/bash

mkdir -p /tmp/python
pushd /tmp/python

wget https://www.python.org/ftp/python/$1/Python-$1.tgz
tar xvf Python-$1.tgz
cd Python-$1

echo "Installing Python $1"

./configure --without-ensurepip

make -j 8
if [ $? -ne 0 ]; then
    echo "Failed to make Python $1"
    exit 1
fi

# Install Python
make $2
if [ $? -ne 0 ]; then
    echo "Failed to install Python $1"
    exit 1
fi

cd ..
rm -rf Python-$1

popd