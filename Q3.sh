#!/bin/bash
#Mahad Ahmed 20i0426 Question 3

file=$1
argnum=$#

if (($argnum!=1))
then echo "Invalid number of arguments, must enter one."
else 
mkdir -p safe_rm_recycle
cp $file safe_rm_recycle
rm $file  
fi