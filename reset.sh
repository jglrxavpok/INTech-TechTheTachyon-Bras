#!/bin/bash

perif=/dev/ttyACM0
sudo chmod a+rw $perif
# deux positions pour être sûr que le moteur y aille (stockage sur la Teensy de la position par défaut)
echo "1 170" > $perif
sleep 3
echo "1 180" > $perif
sleep 3
echo "2 170" > $perif
sleep 3
echo "2 180" > $perif
sleep 3
echo "3 170" > $perif
sleep 3
echo "3 180" > $perif
sleep 3

