#include <stdio.h>
#include <stdlib.h>

#define TAM 10

typedef struct{
	int quimica[TAM];
	int topo;
}duracell;

void CriaPilha(duracell *p){
	(*p).topo = -1;
}

int PilhaVazia(duracell *p){
	if((*p).topo == -1){
		return 1;
	}else{
		return 0;
	}
}

int PilhaCheia(duracell *p){
	if((*p).topo == TAM - 1){
		return 1;
	}else{
		return 0;
	}
}

void InserePilha(duracell *p, int x){
	if(PilhaCheia(p) == 1){
		printf("Pilha Cheia.");
	}else{
		(*p).topo++;
		(*p).quimica[(*p).topo] = x;
	}
}

int RetiraPilha(duracell *p){
	int aux;
	if(PilhaVazia(p) == 1){
		printf("Pilha Vazia");
	}else{
		aux = (*p).quimica[(*p).topo]; 
		(*p).topo--;
	}
	return aux;
}
int main(void){
	
	duracell *p = (duracell *)malloc(sizeof(duracell));
	void InserePilha(duracell *p, int x);
	int RetiraPilha(duracell *p);
	
	CriaPilha(p);
	InserePilha(p, 4);
	InserePilha(p, 8);
	InserePilha(p, 7);
	InserePilha(p, 6);
	
	printf("%d ", RetiraPilha(p));
	printf("%d ", RetiraPilha(p));
	
	
	return 0;
}
