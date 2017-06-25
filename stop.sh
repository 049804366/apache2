#!/usr/bin/env bash
SESSION_NAME='dao'

str=$(screen -ls "$SESSION_NAME")

array=$(echo $str|tr "." "\n")
re='^[0-9]+$'

for V in $array
do
if [[ $V =~ $re ]]
        then screen -S $V -X quit
fi
done