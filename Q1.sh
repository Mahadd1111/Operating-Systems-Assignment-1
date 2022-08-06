#!/bin/bash
#Mahad Ahmed 20i0426 Question 1
echo "Question 1"
read -p 'Input the first number: ' num1
read -p 'Input the second number: ' num2
read -p 'Input the third number: ' num3
count=0
num1=$((num1%10))
num2=$((num2%10))
num3=$((num3%10))
if (( $num1==$num2 )) 
then 
count=$(($count+1))
fi
if (( $num1==$num3 )) 
then 
count=$(($count+1))
fi
if (( $num2==$num3 )) 
then 
count=$(($count+1))
fi
if (($count >= 1))
then
echo "The Result is: True"
else
echo "The Result is: False"
fi




