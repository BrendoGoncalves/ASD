#include <stdio.h>

/* Federal Institute of São Paulo - São Paulo (SP)
 * Copyright Brendo Oliveira Gonçalves   SP3047237
 * Data Structure - Antônio Ferreira Viana - 03/06/21 */

int main(void){

   int V[10] = {7, 2, 0, 9, 3, 5, 1, 4, 6, 8};
   
   /* Acompanhar a planilha eletrônica que criei para a melhor
    * entendimento da ordenação por inserção. "Sorting.ods"  */
   
   void InsertionSort(int *array, int n);
   void PrintArray(int *array, int n);
   
   InsertionSort(V, 10); // Chama a função de ordenação
   PrintArray(V, 10); // Chama a função de exibição
   
   return 0;
}

void InsertionSort(int *array, int n){
   
   int a, b, swap;
   
   // O(n²)
   
   int i; //desconsiderar, apenas para exibição do vetor.
   
   /* Tenha em mente cartas de baralha dispostas em uma única mão */
   
   for(a = 1; a < n; ++a){
	   
	   /* Partimos da segunda posição, pois a primeira já está ordenada,
	    * por isso a = 1. */
	    
	   swap = array[a];
	    
	   /* Esta variável "swap" de controle faŕa sentido mais para frente,
	    * por enquanto, basta entedermos que ele equivalerá a carta de
	    * baralho selecionada para mudar de posição*/
	   
	   for(b = a; b > 0 && swap < array[b - 1]; --b){
		   array[b] = array[b - 1];
		   /* Imaginemos cinco cartas de baralho em uma única mão, vamos
		    * supor que estamos na posição 3, então precisamos analisar 
		    * se na posição 2 não existe uma carta maior que a nossa carta
		    * da posição 3, quem faz esta análise é swap < array[b - 1]
		    * se a carta da posição 2 for maior que a nossa carta da
		    * posição 3, então passamos esta carta da posição 2 para a 
		    * posição 3 através de array[b] = array[b - 1]. Vai abrir uma
		    * vaga na posição 2, mas antes de inserirmos a nossa carta
		    * (que acabou de sair da posição 3 ), precisamos ter certeza que
		    * a carta da posição 1 não é maior que ela. Então o ciclo se
		    * repete, se a carta da posição 1 for menor, que a nossa carta
		    * (que saiu da posição 3) então o ciclo finaliza.  */
	   }
	   
	   /* Pronto, agora inserimos aquela carta selecionada, na posição
	    * vaga que surgiu pela análise acima. */
	   printf("\n%i", a);
	   array[b] = swap;
	    
	    //Desconsiderar, apenas exibição por motivos didáticos
		printf("\n");
		for(i = 0; i < n; ++i){
	        printf("%i ", array[i]);
        }
   }
}

void PrintArray(int *array, int n){
	int i;
	printf("\n\n");
	for(i = 0; i < n; ++i){
	   printf("%i ", array[i]);
   }
}
