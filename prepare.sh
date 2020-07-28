#!/bin/sh

set -e

if [ ! -d ./nuttx/libs/libxx/libcxx ]; then
   pushd nuttx-llvm/libcxx
   ./install.sh ../../nuttx/
   popd
fi

pushd apps-cxx
cp -fr ./boards/ ../nuttx/
popd

pushd nuttx
./tools/configure.sh -a ../apps-cxx nucleo-l452re/apps-cxx
make
popd