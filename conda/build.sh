#!/bin/sh

[ ! -d $PREFIX/bin ] && mkdir -p $PREFIX/bin
cp $SRC_DIR/scripts/* $PREFIX/bin
