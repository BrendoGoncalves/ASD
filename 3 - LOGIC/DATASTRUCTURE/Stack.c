#include <stdio.h>

#define MAX 10

/* Instituto Federal de São Paulo - São Paulo - 18 de Fevereiro de 2020
   Professor: Antônio Ferreira Viana - Estrutura de Dados - SO. Linux
   Aluno: Brendo Oliveira Gonçalves - SP3047237 - TADS/Noite - 2º Sem. */
   
int stack[MAX];
int top;

void build(void){
	top = -1;
}

int empty(void){
	if(top == -1){
		return 1;
	}else{
		return 2;
	}
}

int full(void){
	if(top == MAX - 1){
		return 1;
	}else{
		return 2;
	}
}

void push(int number){
	if(full() == 1){
		printf("\nFull stack");
    }else if(full() == 2){
		stack[++top] = number;
    }
}

int pop(void){
	if(empty() == 1){
		printf("\nEmpty stack");
    }else if(empty() == 2){
		return stack[top--];
    }
}

int size(void){
	return top + 1;
}

int main(void){
	//Last-In-First-Out
	
	void build(void);
	int empty(void);
	int full(void);
	void push(int number);
	int pop(void);
	int size(void);
	
	build();
	
	push(8);
	push(4);
	push(9);
	push(7);
	push(6);
    
    printf("Pop -> %d\n\n", pop());
    printf("Pop -> %d\n\n", pop());
	
	int i;
	for(i = 0; i < 10; ++i){
		if(stack[i] != 0){
			printf("%d\n", stack[i]);
		}
    }
    
    printf("\nSize: %d", size());
	
	return 0;
}
