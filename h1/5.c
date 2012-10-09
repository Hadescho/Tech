//Техологично училище Електронни системи към ТУ София
//11 А
//22
//Николай Тихомиров Коцев
//Да се разработи програма, която изисква от потребителя да въведе целочислено число, x, където 0 < x < 10. Да се инициализират масива от 10 елемента. Стойностите на елементите на масива да са равни на косинус от индекса на елемента. Да се изведе масивът, след което да се сортира в низходящ ред и отново да се изведе.

#include <stdio.h>
#include <math.h>

int main(){
    int x,i,bool=1,c;
    double fp,arr[9];
    do{
    printf("Enter x: ");
    scanf("%d",&x);
    if ((x<0)||(x>9)){
       bool=0;
       printf("X must be larger 0 and smaller than 10");               
       }       
       else bool = 1;
    }
    while (bool==0);
    printf("Array: ");
    for(i=0;i<=9;i++){
         arr[i]=cos(i);
         printf("Element %d : %d\n",i,arr[i]);
                      }
    for (i=9;i>=0;i--){
        for (c=1;c <= i;c++){
            if (arr[c-1]<arr[c]){
              fp = arr[c-1];
              arr[c-1]=arr[c];
              arr[c]=fp;                   
              }
            }
        }
    printf("Sorted array: \n");
    for(i=0;i<=9;i++){
         printf("Element %d : %d\n",i,arr[i]);
         }
    system("Pause");
    return 0;
    }
