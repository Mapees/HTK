#!/bin/bash

if [ $# -ne 2 ]; then
 echo "Uso: crea_proto <tamaño_vector> <num_estados>" 1>&2
 exit
fi


echo "~o <VECSIZE> $1 <USER>"
echo "~h \"proto\""
echo "<BEGINHMM>"
echo "<NUMSTATES> $[$2+2]"
i=2
while [ $i -le $[$2+1] ]; do
 echo "<STATE> $i"
 echo "<MEAN> $1"
 j=2
 echo -n "0.0"
 while [ $j -lt $1 ]; do echo -n " 0.0"; j=$[j+1]; done
 echo " 0.0"
 echo "<VARIANCE> $1"
 j=2
 echo -n "1.0"
 while [ $j -lt $1 ]; do echo -n " 1.0"; j=$[j+1]; done
 echo " 1.0"
 i=$[i+1]
done
echo "<TransP> $[$2+2]"
i=1
while [ $i -le $[$2+2] ]; do
 if [ $i -eq 1 ]; then
  echo -n "0.000e+0   1.000e+0"
  j=3
 fi
 if [ $i -gt 1 -a $i -le $[$2+1] ]; then
  echo -n "0.000e+0"
  j=2
  while [ $j -lt $i ]; do echo -n "   0.000e+0"; j=$[j+1]; done
  echo -n "   6.000e-1   4.000e-1"
  j=$[j+2]
 fi
 while [ $j -le $[$2+1] ]; do echo -n "   0.000e+0"; j=$[j+1]; done
 if [ $i -eq $[$2+1] ]; then
  echo ""
 fi
 if [ $i -le $2 ]; then
  echo "   0.000e+0"
 fi
 if [ $i -eq $[$2+2] ]; then
  echo -n "0.000e+0"
  j=2
  while [ $j -le $[$2+1] ]; do echo -n "   0.000e+0"; j=$[j+1]; done
  echo "   0.000e+0"
 fi
 i=$[i+1]
done
echo "<ENDHMM>"
