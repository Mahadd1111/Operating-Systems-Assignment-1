#include<unistd.h>
#include<stdlib.h>
#include<stdio.h>
#include<sys/wait.h>
#include<sys/types.h>
#include<errno.h>

int main(){
    pid_t pid1=fork();
    if(pid1==0){
        //child1
        pid_t pid2 = fork();
        if(pid2==0){
            char* args[]={"ls","-l",NULL};
            execvp("ls",args);
        }
        else if(pid2>0){
            wait(NULL);
        }
    }
    else if(pid1>0){
        //parent process
        wait(NULL);
        printf("Child Successful\n");
    }
    else{
        printf("Child Failed\n");
    }
}