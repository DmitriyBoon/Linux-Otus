#!/bin/bash
# HOST=$1
# shift
# for ARG in "$@"
# do
#         sudo nmap -Pn --max-retries 0 -p $ARG $HOST
# Done
nmap -p 9911 192.168.255.1 &&  nmap -p 8811 192.168.255.1 && nmap -p 7711 192.168.255.1