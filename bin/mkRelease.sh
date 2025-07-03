#!/usr/bin/env bash

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

echo "DID YOU UPDATE THE VERSION?"
read -p "Press enter to continue"
echo
echo "Making release zip ..."
echo
pushd . >& /dev/null
cd "$SCRIPT_DIR"
cd ../src
find . -name '*.sh' -exec chmod 770 {} \;
find . -name '*.bat' -exec chmod 660 {} \;
rm -rf ../release
mkdir -p ../release
tar -czvf ../release/NARPNet_NCS-X.Y.Z-linux.tgz ./NARPNet_NCS
popd >& /dev/null

echo
echo "Done."
echo

read -p "Press enter to continue"