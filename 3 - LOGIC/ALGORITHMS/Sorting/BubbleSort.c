#include <stdio.h>

/* Federal Institute of São Paulo - São Paulo (SP)
 * Copyright Brendo Oliveira Gonçalves   SP3047237
 * Data Structure - Antônio Ferreira Viana - 03/06/21 */

int main(void){

   int V[10] = {7, 2, 0, 9, 3, 5, 1, 4, 6, 8};
   
   /* Acompanhar a planilha eletrônica que criei para a melhor
    * entendimento da ordenação por flutuação. "Sorting.ods"  */
   
   void BubbleSort(int *array, int n);
   void PrintArray(int *array, int n);
   
   /* Enviei o número 10 fazendo referência ao tamanho do vetor,
    * ao invés de usar DEFINE ou uma varaiável constante, não é 
    * este o intuito. */
   
   BubbleSort(V, 10); // Chama a função de ordenação
   PrintArray(V, 10); // Chama a função de exibição
   
   return 0;
}

void BubbleSort(int *array, int n){
   
   int a, b, swap;
   
   int i; //desconsiderar, apenas para exibição do vetor.
   
   // O(n²)
   
   /* O ponteiro array, apontará para o nosso array unidimensional 
    * (vetor), declarado na função principal. */
    
   for(a = 0; a < n - 1; ++a){
	   /* Aqui começa a ordenação efetiva, precisamos nos atentar
	    * ao n - 1, pois quando o último número for acessado (n),
	    * não haverá mais comparações adiante, por isso desta notação.
	    * A variável "a", indica um ciclo completo. */
		
		for(b = 0; b < n - 1; ++b){
			/* A variável b seria como um cursor, que irá analisar
			 * cada número do vetor. */

			if(array[b] > array[b + 1]){
				/* Comparação: Se o valor atual for menor do que
				 * o valor da frente, então coloca esse atual na
				 * variável swap, agora o valor atual receberá o
				 * valor da frente e o valor da frente receberá
				 * o número da nossa variável swap. */
				swap = array[b];
				array[b] = array [b + 1];
				array[b + 1] = swap;
			}
			/* Fim da comparação, agora nosso cursor move 1 casa
			 * para frente. Quando o cursor alcançar o último
			 * elemento retornaremos a repetição da variável a,
			 * que irá acontecer n -1 vezes. */
			 
			 //Desconsiderar, apenas exibição por motivos didáticos
			 printf("\n");
			 for(i = 0; i < n; ++i){
	             printf("%i ", array[i]);
             }
		}
   }
}

void PrintArray(int *array, int n){
	int i;
	/* Neste caso, precisei criar outro ponteiro *array para fazer
	 * referência ao vetor, já que ele não é um vetor global.
	 * */
	printf("\n\n");
	for(i = 0; i < n; ++i){
	    printf("%i ", array[i]);
    }
}
