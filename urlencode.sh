#!/bin/bash

# Usage: echo <URL> | urlencode.sh

urlencode() {

    # safe way: xxd -plain | tr -d '\n' | sed 's/\(..\)/%\1/g'

    local length="${#1}"
    for (( i = 0; i < length; i++ )); do
        local c="${1:i:1}"
        case $c in
            [a-zA-Z0-9.~_-]) printf "$c" ;;
            *) printf '%%%02X' "'$c" ;;
        esac
    done
}

read url
urlencode $url
