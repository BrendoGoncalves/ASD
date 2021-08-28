#include <stdio.h>

/* Federal Institute of São Paulo - São Paulo (SP)
 * Copyright Brendo Oliveira Gonçalves   SP3047237
 * Data Structure - Antônio Ferreira Viana - 03/06/21 */

int main(void){

   int V[4] = {3, 2, 1, 4};
   
   /* Acompanhar a planilha eletrônica que criei para a melhor
    * entendimento da ordenação por flutuação. "Sorting.ods"  */
    
   void MergeSort(int *array, int outset, int end);
   void Merge();
   void PrintArray(int *array, int n);
   
   MergeSort(V, 1, 4);
   PrintArray(V, 4);
   
   return 0;
}

void Merge(){
}

void MergeSort(int *array, int outset, int end){
	// Divide
	int middle;
	// O(n.log (base 2) n)
	if(outset < end){
		middle = ((outset + end) / 2);
		MergeSort(array, outset, middle);
		MergeSort(array, middle + 1, end);
		Merge();
	}
}

void PrintArray(int *array, int n){
	int i;
	for(i = 0; i < n; ++i){
	   printf("%i  ", array[i]);
   }
}
