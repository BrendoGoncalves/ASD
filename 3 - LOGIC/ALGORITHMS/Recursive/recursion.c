#include <stdio.h>

int main(void){
   //Recursion
   int recursion(int number);
   int number;
   
   printf("Type an interger number:");
   scanf("%i", &number);
   
   if(!(number < 0)){
      number = recursion(number);
   }
   printf("%i", number);
}

int recursion(int number){
   
   if(number == 0){
      return 1;
   }else{
      return number * recursion(number - 1);
   }
}
