#include <stdio.h>

/* Federal Institute of São Paulo - São Paulo (SP)
 * Copyright Brendo Oliveira Gonçalves   SP3047237
 * Data Structure - Antônio Ferreira Viana - 03/06/21 */

int main(void){

   int V[10] = {7, 2, 0, 9, 3, 5, 1, 4, 6, 8};
   
   /* Acompanhar a planilha eletrônica que criei para a melhor
    * entendimento da ordenação por seleção. "Sorting.ods"  */
   
   void SelectionSort(int *array, int n);
   void PrintArray(int *array, int n);
   
   SelectionSort(V, 10); // Chama a funão de ordenação
   PrintArray(V, 10); // Chama a função de exibição
   
   return 0;
}

void SelectionSort(int *array, int n){
   
   int a, b, swap, min;
   
   int i; //desconsiderar, apenas para exibição do vetor.
   
   // O(n²)
   for(a = 0; a < n; ++a){
	   min = a;
	   /* A variável "min", sempre receberá o menor valor que 
	    * ela encontrar. Neste caso, a variável "a" será a 
	    * o valor que poderá ser trocado ou não. */
	   for(b = a + 1; b < n; ++b){
		   /* O "b" é como um cursor, que vai analisar o valores
		    * do nosso vetor V. */
		   if(array[b] < array[min]){
			   /* Se a variável b (que será algum elemento do vetor V,
			    * exceto o valor "a" que é o possível valor a ser 
			    * trocado), for menor do que o valor mínimo, então
			    * agora o valor mínimo será igual a este valor b. */
			   min = b;
	       }
	       
	        //Desconsiderar, apenas exibição por motivos didáticos
			printf("\n");
			for(i = 0; i < n; ++i){
	            printf("%i ", array[i]);
            }
       }
   /* Quando o cursor b percorrer todos os elementos do vetor, o menor
    * valor será capturado e armazenado em "min", então fazemos a troca.*/    
   swap = array[a];
   array[a] = array[min];
   array[min] = swap;
   /* O valor mínimo entrará na posição de "a", enquanto que o valor de 
    * "a" irá para o local onde estava o "min". */
   }
   /* O ciclo "for" referente a "a", irá ocorroer uma posição para frente 
    * (a + 1), visto que para trás, já está ordenado, ainda que parcialmente
    * até que "a" seja igual a n. */
   
}

void PrintArray(int *array, int n){
	/* Neste algoritmo, esta função é desnecessária, pois já imprimimos
	 * os valores dentro da função de ordenação, mas em um programa
	 * extenso, ela seria ideal. */
	int i;
	printf("\n\n");
	for(i = 0; i < n; ++i){
	   printf("%i ", array[i]);
   }
}
