#!/bin/bash

NAME=
PORT=
HTTPS=1

HELP="$0 -n NAME -p PORT [-s to disable HTTPS annotation]"

while getopts "n:p:hsS" option; do
    case $option in
        h)
            echo $HELP
            exit 0
            ;;
        n)
            NAME=${OPTARG}
            ;;
        p)
            PORT=${OPTARG}
            ;;
        s)
            HTTPS=0
            ;;
        S)
            HTTPS=1
            ;;
        \?)
            echo $HELP
            exit 1
            ;;
    esac
done

if [ -z $NAME ]; then
    echo "$0 -n NAME required"
    exit 1
fi

if [ -z $PORT ]; then
    echo "$0 -p PORT required"
fi

CMD="cat tmpl/resource.yaml | sed s/{{NAME}}/${NAME}/g | sed s/{{PORT}}/${PORT}/g"
if [ $HTTPS -eq 0 ]; then
    CMD="${CMD} | grep -v backend-protocol"
fi

eval $CMD > resources/$NAME.yaml
