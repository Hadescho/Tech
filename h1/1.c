//����������� ������� ���������� ������� ��� �� ����� http://www.elsys-bg.org/
//11 �
//22
//������� ��������� �����
//�� �� ��������� ��������, ����� ������� �� ����������� �� ������ ��� ����������� �����, x � y, ������ x < y. �� �� ������ ������ �� ������ ������� ����� � ��������� [x,y].

#include <stdio.h>


int main(){
 int x=0;
 int y=0;
 int i=0;
 int sum=0;
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
 while(bool==0);
 for(i=x;i<=y;i++){
    if (i%2==1){
       sum=sum+i;           
    }                    
 }
 printf("sum=%d",sum);
 system("PAUSE");
return 0;
}
