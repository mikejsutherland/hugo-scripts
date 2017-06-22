#!/bin/bash

SRC="src";
DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd)
DATE=$(date "+%Y%m%d");

function usage {
    echo "Usage: $0 [-d YYYYMMDD] <filename.md>" 1>&2;
}

while [ $# -gt 0 ]
do
    unset OPTIND
    unset OPTARG

    while getopts d: opts
    do
        case $opts in
            d) DATE="$OPTARG";;
            h) usage; exit;
        esac
    done
    shift $((OPTIND-1))

    if [ ! -z $1 ]; then
        FILE="$1";
    fi
    shift
done

if [[ ! "${DATE}" =~ ^[0-9]{8}$ ]]; then
    echo "Invalid date: ${DATE}";
    usage;
    exit 1;
fi

YEAR=${DATE:0:4};
MONTH=${DATE:4:2};
DAY=${DATE:6:2};

cd ${DIR}/${SRC};
/bin/test -d content/blog/${DATE} || mkdir content/blog/${DATE};
/bin/test -d static/blog/${DATE} || mkdir static/blog/${DATE};
/bin/test -e content/blog/${DATE}/${FILE} || touch content/blog/${DATE}/${FILE};

echo "+++" >> content/blog/${DATE}/${FILE};
echo "date = \"${YEAR}-${MONTH}-${DAY}\"" >> content/blog/${DATE}/${FILE};
echo "title = \"\"" >> content/blog/${DATE}/${FILE};
echo "tags = []" >> content/blog/${DATE}/${FILE};
echo "draft = true" >> content/blog/${DATE}/${FILE};
echo "+++" >> content/blog/${DATE}/${FILE};

echo "Created: content/blog/${DATE}/${FILE}";
