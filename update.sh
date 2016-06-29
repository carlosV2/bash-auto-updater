#!/bin/bash

path=`dirname ${BASH_SOURCE}`

if [ -e "${path}/.git/FETCH_HEAD" ]; then
    if [ "$(uname)" == "Darwin" ]; then
        ts=`stat -f '%m' "${path}/.git/FETCH_HEAD"`
    else
        ts=`stat -c '%Y' "${path}/.git/FETCH_HEAD"`
    fi
else
    ts=0
fi

UPDATE_DELAY=$(( UPDATE_DELAY + 0 ))
if [ ${UPDATE_DELAY} -le 0 ]; then
    UPDATE_DELAY=86400
fi

now=`date +"%s"`
future=$(( ts + UPDATE_DELAY ))

if [ ${now} -ge ${future} ]; then
    directory=`pwd`
    cd "${path}"

    GIT_SYM=`git symbolic-ref HEAD`
    branch=`echo "${GIT_SYM##refs/heads/}"`

    git pull origin "${branch}" -q > /dev/null

    cd "${directory}"
fi