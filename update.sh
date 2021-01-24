#!/bin/bash
PLUGINS_DIRECTORY="/opt/rust/oxide/plugins"

[ ! -d "./plugins" ] && mkdir "./plugins"
rm -rf ./plugins/*

for PLUGIN_PATH in $PLUGINS_DIRECTORY/*; do
    LOCAL_VERSION=`cat $PLUGIN_PATH | pcregrep -o1 '\[Info\(\"[a-zA-Z\s]+\", \"[a-zA-Z\s]+\", "([0-9\.]+)\"\)\]'`
    BASENAME=`basename $PLUGIN_PATH`

    wget -qP ./plugins/ "https://umod.org/plugins/${BASENAME}"
    DOWNLOADED_VERSION=`cat ./plugins/${BASENAME} | pcregrep -o1 '\[Info\(\"[a-zA-Z\s]+\", \"[a-zA-Z\s]+\", "([0-9\.]+)\"\)\]'`

    if [[ $LOCAL_VERSION != $DOWNLOADED_VERSION ]]; then
        echo "${BASENAME} is Outdated. ${DOWNLOADED_VERSION} > ${LOCAL_VERSION}"
        rm -f "${PLUGINS_DIRECTORY}/${BASENAME}"
        sleep 2
        cp "./plugins/${BASENAME}" $PLUGINS_DIRECTORY
    fi
done
