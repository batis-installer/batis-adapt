#!/bin/bash
set -e

if [[ -z "$1" ]]; then
    echo "Expected the path to the zip file as the first argument"
    exit 2
fi

batis_info="`dirname $0`/batis_info"
td=`mktemp --directory`

echo "Extracting to $td/powdertoy..."
mkdir $td/powdertoy
unzip "$1" -d $td/powdertoy

echo "Adding batis_info metadata..."
cp --recursive "$batis_info" $td/powdertoy/

echo "Installing..."
batis installtar $td/powdertoy/

echo "Cleaning up $td..."
rm -r $td
