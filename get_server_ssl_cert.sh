#!/bin/bash

[ "$#" == "0" ] && (echo Usage: $0 domain.com;exit)

openssl s_client -connect $1:443 -showcerts
