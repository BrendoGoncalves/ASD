#include <stdio.h>
#include <stdlib.h>

#define TAM 10

typedef struct{
	int inicio, final;
	int vetor[TAM];
}itau;

void CriaFila(itau *p){
	(*p).inicio = 0;
	(*p).final = -1;
}

int FilaVazia(itau *p){
	if((*p).final == -1){
		return 1;
	}else{
		return 0;
	}
}

int FilaCheia(itau *p){
	if((*p).final >= TAM - 1){
		return 1;
	}else{
		return 0;
	}
}

void InsereFila(itau *p, int x){
	if(FilaCheia(p) == 1){
		printf("Fila Cheia");
	}else{
		p->final++;
		(*p).vetor[(*p).final] = x;
	}
}

int RemoveFila(itau *p){
	if(FilaVazia(p) == 1){
		printf("Fila Vazia");
		return 0;
	}else{
		(*p).inicio++;
		return (*p).vetor[(*p).inicio];
	}
}

int main(void){
	itau *p = (itau *)malloc(sizeof(itau));
	
	InsereFila(p, 5);
	InsereFila(p, 8);
	InsereFila(p, 7);
	InsereFila(p, 1);
	
	printf("Removeu o %d\n", RemoveFila(p));
	printf("Removeu o %d\n", RemoveFila(p));
	
	return 0;
}
