#!/bin/bash

# exit on first error
set -o errexit
# refuse unset variables
#set -o nounset

baseSourceDir="/home/jean/Desktop/techno/eclipse-workplace/org.akasig.plone"
baseBcfg2Dirs=(
  "/home/jean/Desktop/techno/eclipse-workplace/wecena.bcfg2/trunk/Cfg/firstDisk/org.akasig.plone")
#  "/home/jean/Desktop/techno/eclipse-workplace/wecena.bcfg2/trunk/Cfg/srv/disk01/org.akasig.plone")

binaryExtensions=(
  "gif"
  "png"
  "xcf"
  "jpg"
  "jpeg"
  "pdf"
  "doc"
  "odt"
  "bmp"
  "jpeg"
  "ico")

notForBcfg2=(
  "bcfg2_sync.sh"
  "development.cfg"
  "environment-dev.cfg"
  "environment-prev.cfg"
  "environment-prod-secret.cfg"
  "dependencies-unstable.cfg"
  "preview.cfg" )

cd "$baseSourceDir/profiles"

for fileName in *
do
  fileNameIsForBcfg2=true
  for nfb in ${notForBcfg2[@]}
  do
    if [ "$nfb" = "$fileName" ]
    then
      fileNameIsForBcfg2=false
    fi
  done
  if [ "$fileNameIsForBcfg2" = true ]
  then
    for baseBcfg2Dir in ${baseBcfg2Dirs[@]}
    do
      dirName="$baseBcfg2Dir/profiles/$fileName"
      mkdir -p $dirName
      cp -a $fileName "$dirName/$fileName"
    done
  fi
done
