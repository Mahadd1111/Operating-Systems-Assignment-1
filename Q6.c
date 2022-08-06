#include<unistd.h>
#include<stdlib.h>
#include<stdio.h>
#include<errno.h>
#include<sys/types.h>
#include<sys/wait.h>

int main(){
    int a=0,b=0,c=0,d=0,e=0,f=0;
    int status1=0,status2=0,status3=0;
    int result1=0,result2=0,result3=0;
    int finalresult=0;
    printf("Enter Value of A: "); scanf("%d",&a);
    printf("Enter Value of B: "); scanf("%d",&b);
    printf("Enter Value of C: "); scanf("%d",&c);
    printf("Enter Value of D: "); scanf("%d",&d);
    printf("Enter Value of E: "); scanf("%d",&e);
    printf("Enter Value of F: "); scanf("%d",&f);
    pid_t childpid1 = fork();
    if (childpid1==0){
        //child1
        result1=a*b;
        exit(result1);
    }
    else if(childpid1>0){
        wait(&status1);
        status1=status1/255;
    }
    pid_t childpid2 = fork();
    if(childpid2==0){
        //child2
        result2=c/d;
        exit(result2);
    }
    else if(childpid2>0){
        wait(&status2);
        status2=status2/255;
    }
    pid_t childpid3 = fork();
    if(childpid3==0){
        //child3
        result3=e-f;
        exit(result3);
    }
    else if(childpid3>0){
        wait(&status3);
        status3=status3/255;
    }
    finalresult = status1 + status2 +status3;
    printf("Computing x = (a*b) + (c/d) + (e-f)\n");
    printf("Where x = (%d*%d) + (%d/%d) + (%d-%d)\n",a,b,c,d,e,f);
    printf("x = %d\n",finalresult);
}