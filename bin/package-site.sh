#!/bin/bash

SITE="your_site.com";
SRC="src";
REL="release";

DATE=$(date "+%Y%m%d");
DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd)

cd ${DIR}/${SRC} && hugo --cleanDestinationDir || exit 1;
echo "Packaging...";
export COPYFILE_DISABLE=1;
/bin/test -e ${DIR}/${SITE}.${DATE}.tar.gz && rm ${DIR}/${SITE}.${DATE}.tar.gz;
cd ${DIR}/${SRC}/public && tar --exclude=".DS_Store" -zcf ${DIR}/${REL}/${SITE}.${DATE}.tar.gz .
echo "${SITE}.${DATE}.tar.gz"
