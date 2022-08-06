#include<unistd.h>
#include<stdlib.h>
#include<stdio.h>
#include<sys/types.h>
#include<sys/wait.h>
#include<errno.h>

int main(){
    pid_t childpid = fork();
    if(childpid==0){
        //P2
        pid_t childpid3 = fork();
        if(childpid3==0){
            //P4
            printf("P4 : ID = %d",getpid());
            printf(", Parent ID = %d\n",getppid());
        }
        else if(childpid3>0){
            printf("P2 : ID = %d",getpid());
            printf(", Parent ID = %d\n",getppid());
        }
    }
    else if(childpid>0){
        //P1
        pid_t childpid2 = fork();
        if(childpid2==0){
            //P3
            printf("P3 : ID = %d",getpid());
            printf(", Parent ID = %d\n",getppid());
        }
        else if(childpid2>0){
            printf("P1 : ID = %d",getpid());
            printf(", Parent ID = %d\n",getppid());
        }
    }
}