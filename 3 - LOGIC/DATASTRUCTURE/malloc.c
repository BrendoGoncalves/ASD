#include <stdio.h>
#include <stdlib.h>

int main(void){
   
   int n, i;
   int *v;
   
   scanf("%d", &n);
   
   v = (int *)malloc(n * sizeof(int));
   
   for(i = 0; i < n; ++i){
	   v[i] = i;
   }
   for(i = 0; i < n; ++i){
	   printf("%d ", v[i] + 1);
   }
   
   return 0;
}
