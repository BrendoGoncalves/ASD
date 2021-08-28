#include <stdio.h>

int main(void){
   int array[4] = {3, 2, 4, 1};
   
   void BubbleSort(int *v, int n);
   void SelectionSort(int *v, int n);
   void InsertionSort(int *v, int n);
   void Print(int *v, int n);
   
   //BubbleSort(array, 4);
   //SelectionSort(array, 4);
   //InsertionSort(array, 4);
   Print(array, 4);
   return 0;
   
}

void BubbleSort(int *v, int n){
   int a, b, swap;
   
   for(a = 0; a < n - 1; ++a){
	   for(b = 0; b < n - 1; ++b){
		   if(v[b] > v[b + 1]){
			   swap = v[b];
			   v[b] = v[b + 1];
			   v[b + 1] = swap;
		   }
	   }
   }
}

void SelectionSort(int *v, int n){
	int a, b, swap, min;
	
	for(a = 0; a < n - 1; ++a){
		min = a;
		for(b = a; b < n; ++b){
			if(v[b] < v[min]){
				min = b;
			}
		}
		swap = v[a];
		v[a] = v[min];
		v[min] = swap;
	}
}

void InsertionSort(int *v, int n){
	int a, b, swap;
	
	for(a = 1; a < n; ++a){
		swap = v[a];
		for(b = a; b > 0 && swap < v[b - 1]; --b){
			v[b] = v[b - 1];
		}
		v[b] = swap;
	}
}

void Print(int *v, int n){
	int i;
	for(i = 0; i < n; ++i){
		printf("%i ", v[i]);
	}
}
