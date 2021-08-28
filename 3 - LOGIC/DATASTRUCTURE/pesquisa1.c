#include <stdio.h>

int main(void){
	
	int v[12] = {0, 1, 0, 3, 1, 0, 3, 1, 1, 1, 2, 0};
	int n, i, j = 0;
	int resp[12];
	scanf("%d", &n);
	
	for(i = 0; i <= 11; ++i){
		if(v[i] == n){
			resp[j] = v[i];
			++j;
		}
	}
	
	for(i = 0; i <= j - 1; ++i){
		printf("%d", resp[i]);
	}
	
	return 0; 
}

