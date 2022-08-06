#!/bin/bash
#Mahad Ahmed 20i0426 Question 4



echo Question 4
echo pattern_option = $1
echo number = $2
patter_option=$1
number=$2

if (($#!=2))
then 
echo "Invalid number of input parameters"
exit
fi

pattern1(){
    echo Pattern 1
    count1=1
    for ((i=1;i<=$number;i++))
    do  
        for ((j=1;j<=$count1;j++))
        do
            echo -n "* "
        done
        echo -e ""
        count1=$(($count1 + 1))
    done
}

pattern2(){
    echo Pattern 2
    count1=$number 
    count2=1
    for ((i=1;i<=$number;i++))
    do
        for ((j=1;j<=$count1;j++))
        do 
            echo -n "*"
        done
        for ((k=1;k<=$count2;k++))
        do 
            echo -n " "
        done 
        for ((j=1;j<=$count1;j++))
        do 
            echo -n "*"
        done
        count1=$(($count1-1))
        count2=$(($count2+2))
        echo -e "\n"
    done 
}

pattern3(){
    echo Pattern 3
    for ((i=1;i<=$number;i++))
    do
        for ((j=i;j<=$number;j++))
        do
            echo -n " "
        done
        for ((j=1;j<=i;j++))
        do
            echo -n "*"
        done
    echo -e "\n"
    done
}


case $1 in

left)
    pattern1
    ;;

inverted_full)
    pattern2
    ;;

right)
    pattern3
    ;;

*)
echo -e "Invalid Pattern input"
esac

