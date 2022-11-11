#!/bin/bash

start=2020-01-01
end=2020-12-31

#touch raw_users.txt
touch raw_hashes.txt

while ! [[ $start > $end ]]; do
    #curl -s -o - http://10.10.10.248/documents/$start-upload.pdf | strings | grep "/Creator" | grep -oP '\(.*?\)' | awk '{gsub(/\(|\)/," "); print $NF};' | grep -v "TeX" >> raw_users.txt
    #curl -s -o - http://10.10.10.248/documents/$start-upload.pdf | strings | grep "/ID" | grep -oP '\[.*?\]' | tr -d "[]<>" | tr " " "\n" | sed '/^$/d' | uniq >> raw_hashes.txt
    #creator=$(curl -s -o - http://10.10.10.248/documents/$start-upload.pdf | strings | grep "/Creator" | grep -oP '\(.*?\)' | awk '{gsub(/\(|\)/," "); print $NF};' | grep -v "TeX")

start=$(date -d "$start + 1 day" +%F)
done

#cat raw_users.txt | sort | uniq > users.txt

#rm raw_users.txt


#cat raw_hashes.txt | sort -u > hashes.txt
#rm raw_hashes.txt
