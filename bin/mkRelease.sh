#!/usr/bin/env bash

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

pushd .

cd "$SCRIPT_DIR"
cd ../src
find . -name '*.sh' -exec chmod 770 {} \;
find . -name '*.bat' -exec chmod 660 {} \;
mkdir -p ../release
tar -czvf ../release/NARPNet_NCS-X.Y.Z-linux.tgz .

popd