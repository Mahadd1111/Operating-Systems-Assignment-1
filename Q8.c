#include<unistd.h>
#include<stdlib.h>
#include<stdio.h>
#include<sys/wait.h>
#include<sys/types.h>
#include<errno.h>

int main(){
    pid_t childpid = fork();
    if(childpid==0){
        //child process
        printf("BEFORE SCRIPTING: \n");
        printf("$USER : %s\n$TERM : %s\n$PATH : %s\n----------------------------------------------------\n",getenv("USER"),getenv("TERM"),getenv("PATH"));
        char* arg1 = getenv("USER");
        char* arg2 = getenv("TERM");
        char* arg3 = getenv("PATH");
        char* args[]={"script.sh",arg1,arg2,arg3,NULL};
        char* env[]= {"OS2022=5ma32zw",NULL};
        execve("./script.sh",args,env);
    }
    else if(childpid>0){
        //parent process
        wait(NULL);
    }
}