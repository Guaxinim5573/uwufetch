#!/bin/bash

test() {
	DATE1=$(date +%s%N) ; $1 > /dev/null ; DATE2=$(date +%s%N) ; echo "$(expr $(expr $DATE2 - $DATE1) / 1000000)ms"
}

echo "Building"
cc -O3 -o no-pkgman-uwufetch ./no-pkgman-uwufetch.c
cc -O3 -o uwufetch ./uwufetch.c

printf "\x1b[31m uwufetch => "
test ./uwufetch
printf "\x1b[33m no pkgman => "
test ./no-pkgman-uwufetch
