#!/bin/bash
set -e

if [[ -z "$1" ]]; then
    echo "Expected the path to the tarball as the first argument"
    exit 2
fi

batis_info="`dirname $0`/batis_info"
td=`mktemp --directory`

echo "Extracting to $td..."
tar xzf "$1" --directory $td

# Rename the directory to just pycharm
mv $td/pycharm-* $td/pycharm

echo "Adding batis_info metadata..."
cp --recursive "$batis_info" $td/pycharm/

echo "Installing..."
batis installtar $td/pycharm/

echo "Cleaning up $td..."
rm -r $td
