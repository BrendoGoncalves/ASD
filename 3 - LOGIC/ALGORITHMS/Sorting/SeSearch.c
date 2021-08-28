#include <stdio.h>

/* Federal Institute of São Paulo - São Paulo (SP)
 * Copyright Brendo Oliveira Gonçalves   SP3047237
 * Data Structure - Antônio Ferreira Viana - 03/06/21 */


int main(void){
   
   int array[8] = {11, 22, 33, 44, 55, 66, 77, 88};
   
   int SequentialSearch(int *v, int n, int x);
   int x;
   
   printf("Look for number: ");
   scanf("%d", &x);
   
   int y = SequentialSearch(array, 8, x);
   
   if(y != -1){
	   printf("Number %d found in position %d ", x, y + 1);
   }else{
	   printf("Number %d not found.", x);
   }
   
   return 0;
}

int SequentialSearch(int *v, int n, int x){
	
	int i = 0, key = 0;
	
	while(i < n && key == 0){
		if(v[i] == x){
			key = 1;
			return i;
		}else{
			++i;
		}
	}
	
	return -1;
}


