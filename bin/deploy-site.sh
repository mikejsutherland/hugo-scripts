#!/bin/bash

DOMAIN="your_site.com"
DEST="/var/www/html";
USER="root";
GROUP="root";

if [[ ! -z $1 ]]; then
    echo "Usage: $0 <domain.YYYYMMDD.tar.gz>";
    exit 1;
fi

PKG=$1;
DEPLOY="${DEST}/${DOMAIN}";

if [[ ! -d "${DEPLOY}" ]]; then
    echo "Error: ${DEPLOY} - does not exist";
    exit 1;
fi

su -c "cp ${PKG} ${DEPLOY} && cd ${DEPLOY} && tar zxvf ${PKG} && chown ${USER}.${GROUP} * -R && chmod +r * -R && rm ${PKG}"
