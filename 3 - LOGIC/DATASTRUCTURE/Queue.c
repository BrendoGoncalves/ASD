#include <stdio.h>

#define MAX 10

/* Instituto Federal de São Paulo - São Paulo - 18 de Fevereiro de 2020
   Professor: Antônio Ferreira Viana - Estrutura de Dados - SO. Linux
   Aluno: Brendo Oliveira Gonçalves - SP3047237 - TADS/Noite - 2º Sem. */

int queue[MAX];
int beg, end;

void build(void){
	beg = 0, end = 0;
}

int empty(void){
	if(beg == end){
		return 1;
	}else{
		return 2;
	}
}

int full(void){
	if(end == MAX - 1){
		return 1;
	}else{
		return 2;
	}
}

void enqueue(int number){
	if(full() == 1){
		printf("Full Queue");
	}else if(full() == 2){
		queue[end++] = number;
	}
}

int dequeue(void){
	if(empty() == 1){
		printf("Empty Queue");
	}else if(empty() == 2){
		return queue[beg++];
	}
}

int size(void){
	return (end - beg) + 1;
}

int main(void){
	//First-In-First-Out
	
	void build(void);
	int empty(void);
	int full(void);
	
	build();
	
	enqueue(5);
	enqueue(1);
	enqueue(4);
	enqueue(3);
	enqueue(2);
	
	printf("Remove -> %d\n", dequeue());
	printf("Remove -> %d\n", dequeue());
	
	int i;
	for(i = 0; i < 10; ++i){
		printf("%d\n", queue[i]);
    }
    
    printf("Size: %d", size());
	
	return 0;
}
