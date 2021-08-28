#include <stdio.h>

int main(void){
	
	int v[6] = {1, 2, 3, 4, 5, 5};
	int n = 5;
	
	int inicio = 0, meio, final = 5;
	
	while(inicio <= final){
		meio = ((inicio + final) / 2);
		if(n < v[meio]){
			final = meio - 1;
		}else if(n > v[meio]){
			inicio = meio + 1;
		}else{
			printf("%i", v[meio]);
		}
	}
	
	return 0;
}
