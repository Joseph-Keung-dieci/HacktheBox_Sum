#!/bin/bash
start=2020-01-01
end=2021-07-01

mkdir pdf
while ! [[ $start > $end ]]; do
    wget http://intelligence.htb/documents/$start-upload.pdf -O ./pdf/$start-upload.pdf

start=$(date -d "$start + 1 day" +%F)
done

find ./pdf/ -maxdepth 1 -type f -empty -print -delete
