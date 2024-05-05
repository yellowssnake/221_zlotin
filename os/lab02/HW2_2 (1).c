#include <stdio.h>
#include <stdlib.h>

void swap(int* x, int* y){
  int temp = *x;
  *x = *y;
  *y = temp;
}

int main() {
    int i, n;

    scanf("%d", &n);

    int* array = malloc(sizeof(int) * n);

    for (i = 0; i < n; i++) {
        scanf("%d", &array[i]);
    }
    i = 0;
    for (i = 0; 2*i < n; ++i){
      swap(&array[i], &array[n-i-1]);
    }
    
    for (i = 0; i < n; i++) {
        printf("%d ", array[i]);;
    }
    free(array);

    return 0;
}