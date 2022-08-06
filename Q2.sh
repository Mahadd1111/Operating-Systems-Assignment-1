#!/bin/bash
#Mahad Ahmed 20i0426 Question 2
echo Question 2
echo MENU

changemod(){
#if else only used for this utility function
if (($3==1))
then
    if (($1==0))
    then
    chmod u+rwx $2
    elif (($1==1))
    then
    chmod u+rw-x $2
    elif (($1==2))
    then
    chmod u+rx-w $2
    elif (($1==3))
    then
    chmod u+r-wx $2
    elif (($1==4))
    then
    chmod u+wx-r $2
    elif (($1==5))
    then
    chmod u+w-rx $2
    elif (($1==6))
    then
    chmod u+x-rw $2
    elif (($1==7))
    then 
    chmod u-rwx $2
    fi
elif (($3==2))
then
    if (($1==0))
    then
    chmod g+rwx $2
    elif (($1==1))
    then
    chmod g+rw-x $2
    elif (($1==2))
    then
    chmod g+rx-w $2
    elif (($1==3))
    then
    chmod g+r-wx $2
    elif (($1==4))
    then
    chmod g+wx-r $2
    elif (($1==5))
    then
    chmod g+w-rx $2
    elif (($1==6))
    then
    chmod g+x-rw $2
    elif (($1==7))
    then 
    chmod g-rwx $2
    fi
elif (($3==3))
then
    if (($1==0))
    then
    chmod o+rwx $2
    elif (($1==1))
    then
    chmod o+rw-x $2
    elif (($1==2))
    then
    chmod o+rx-w $2
    elif (($1==3))
    then
    chmod o+r-wx $2
    elif (($1==4))
    then
    chmod o+wx-r $2
    elif (($1==5))
    then
    chmod o+w-rx $2
    elif (($1==6))
    then
    chmod o+x-rw $2
    elif (($1==7))
    then 
    chmod o-rwx $2
    fi
fi
}

part1(){
    read -p 'Enter File name to reverse privacy: ' filename 
    var1=$(stat -c "%a" $filename)
    echo "Permissions before: " $var1
    ls -l $filename
    pruser=$(($var1%10))
    var1=$(($var1/10))
    prgroup=$(($var1%10))
    var1=$(($var1/10))
    prother=$(($var1%10))
    n1=1
    n2=2
    n3=3
    changemod $pruser $filename $n3
    changemod $prgroup $filename $n2
    changemod $prother $filename $n1
    echo "Permissions after: "
    stat -c "%a" $filename
    ls -l $filename
}

part4(){
    read -p 'Enter file name to check Modification date: ' file4
    elapsedtime=$(($(date +%s) - $(date +%s -r $file4)))
    touch logfile.txt
    echo "Seconds since last modification: " $elapsedtime
    if (($elapsedtime>=86400))
    then 
    echo "File's last modification exceeds 24 hours"
    touch -r $file4 temp2.txt
    echo "New modified information of a file: " $(stat -c %y $file4)
    tempvar=$(date)
    echo "file modified to current date: " $tempvar >> logfile.txt
    else 
    echo "File's last modification does not exceed 24 hours"
    echo "File does not need to modify to current date" >> logfile.txt
    fi
}

part2(){
    read -p 'Enter string to match: ' stringname
    read -p 'Enter File to match string in: ' file2
    grep -n $stringname $file2
}

part3(){
    touch dummy.txt
    read -p "Enter value of N: " Num
    count=1
    for FILE in *
    do
        val=$(($count%2))
        if (($val==1))
        then
            head -$Num $FILE>>dummy.txt
        else
            tail -$Num $FILE>>dummy.txt
        fi
        count=$(($count+1))
    done
}

echo -e "\n1 - Input a filename from the user and display permissions of that particular file. Then invert
the permissions e.g. If permissions were r-x change them to -w-. Then again display the
updated permissions of that file."
echo -e "\n2 - Input a filename and a string and search it in the file. Output the lines of the file where
that string is found. But if the string contains a dot(.) it means any character can fill the
place. For example: string = c.t ={cat, cot, c t, ......}"
echo -e "\n3 - Create a file dummy.txt and add the content of all the files in the current directory to
dummy. But copy the content in such a way that if files in current directory = {f1, f2, f3,
f4,.....,fn} Then copy first N lines of files at even location {f2,f4,...} and last N lines of files
at odd location {f1,f3,...}. Input value of N from user."
echo -e "\n4 - Input a filename from the user and check the modified date of that file. If the modified
date is greater than 24 hours from the current time, change the modified date to current
date. Along-with displaying the output on terminal, maintain a logFile that contains the
information of the script."
echo -e "\n\n"
read -p 'Select Option: ' choice
echo -e '\n'

case $choice in 

1) 
part1 
;;

2)
part2
;;

3)
part3
;;

4)
part4 
;;

*)
echo "invalid choice..."
esac

