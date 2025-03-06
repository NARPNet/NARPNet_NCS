#!/usr/bin/env bash

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

search1=MACRO_DIR/files/
replace1=$SCRIPT_DIR/files/
search2=MACRO_DIR/
replace2=$SCRIPT_DIR/

if [ -f NARPNet_NCS.mdf.orig ]
then
  echo "####################################"
  echo "You can't run setup.bat twice."
  echo "Delete NARPNet_NCS.mdf, then rename NARPNet_NCS.mdf.orig to NARPNet_NCS.mdf."
  echo "This will let you run it again."
  echo "####################################"
else
  echo "Fixing file paths in NARPNet macro files to match your macro location:"
  echo "  $replace2"

  cp NARPNet_NCS.mdf NARPNet_NCS.mdf.orig
  cp NARPNet_OP.mdf NARPNet_OP.mdf.orig

  sed -i "s/\r$//" NARPNet_NCS.mdf
  sed -i "s;$search1;$replace1;g" NARPNet_NCS.mdf
  sed -i "s;$search2;$replace2;g" NARPNet_NCS.mdf
  
  sed -i "s/\r$//" NARPNet_OP.mdf
  sed -i "s;$search1;$replace1;g" NARPNet_OP.mdf
  sed -i "s;$search2;$replace2;g" NARPNet_OP.mdf
  
  echo
  echo "Done."
  echo
fi

read -p "Press enter to continue"

