//Техологично училище Електронни системи към ТУ София
//11 А
//22
//Николай Тихомиров Коцев
//Да се разработи програма, която изисква от потребителя да въведе две целочислени числа, x и y, където x < y. Да се намерят и изведат всички прости числа завършващи на 3 в интервал [x,y].

#include <stdio.h>
#include <math.h>
int main(){
    int x,y,i,t,bol;
    double iu,root;
    int bool=1;
    do {
    printf("Enter x:");
    scanf("%d",&x);
    printf("Enter y:");
    scanf("%d",&y);
    if (x>=y) {
       bool = 0;
       printf("Y must be larger than X.");}
       else bool = 1;
       
    }
    printf("Prime numbers:");
    for (i=x;i<=y;i++){
        bol=1;
        root=sqrt(i);
        t=2;
        while (t<=root){
              if (i%t==0){
                 bol=0;
                 break;
                 }
              t=t+1;
              }
        if ((bol==1)&&(i%10==3)){
           printf("%d ",i);
           }
    }
    printf("\n");    
    system("PAUSE");
    return 0;   
}
