#!/bin/bash

trap 'echo "A las $(date) has pulsado CTRL+C" | tee -a lo_que_pasa_a_f1.txt' SIGINT
trap 'echo "A las $(date) has pulsado CTRL+Z (proceso detenido)" | tee -a lo_que_pasa_a_f1.txt; kill -STOP 0' SIGTSTP
trap 'echo "A las $(date) el proceso se ha reanudado" | tee -a lo_que_pasa_a_f1.txt' SIGCONT
trap 'echo "A las $(date) el proceso ha terminado (SIGTERM)" | tee -a lo_que_pasa_a_f1.txt; exit 0' SIGTERM

while true
do
    date >> lo_que_pasa_a_f1.txt
    sleep 5 &
    wait
done