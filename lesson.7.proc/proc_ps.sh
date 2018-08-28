#!/bin/bash
# Выводим все запущенные процессы
status=""
for pid in $(ls /proc/ | grep "[0-9]\+" | sort -g)
do
file="/proc/"$pid"/status"
file1="/proc/"$pid"/sched"
ppid=$(grep -E -h -s -i "ppid:\s(.+)" $file | grep -o "[0-9]\+")
sleepavg=$(grep -E -h -s -i "avg_atom(.+)" $file1 | grep -o "[0-9.]\+")
if [[ -z $sleepavg ]]
then sleepavg=0
fi
if [[ $ppid != "" ]]
then status=$status"ProcessID="$pid" : ProcessID="$ppid" : Average_Sleeping="$sleepavg$'\n'
fi
done
echo "$status" | sort -t " " -k2
