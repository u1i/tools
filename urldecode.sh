#!/bin/bash

# Usage: echo <URL> | urldecode.sh

urldecode() {
    # urldecode <string>

    local url_encoded="${1//+/ }"
    printf '%b' "${url_encoded//%/\\x}"
}

read url
urldecode $url
