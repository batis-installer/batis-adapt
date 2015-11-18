#!/bin/bash
set -e

if [[ -z "$1" ]]; then
    echo "Expected the path to the zip file as the first argument"
    exit 2
fi

batis_info="`dirname $0`/batis_info"
td=`mktemp --directory`

echo "Extracting to $td..."
unzip "$1" -d $td/

# Rename the directory to just vscode
mv $td/VSCode-* $td/vscode

echo "Adding batis_info metadata..."
cp --recursive "$batis_info" $td/vscode/

echo "Installing..."
batis installtar $td/vscode/

echo "Cleaning up $td..."
rm -r $td
