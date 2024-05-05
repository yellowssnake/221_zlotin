#include <stdio.h>

void print(int* x, int* y) {
    printf("%d %d\n", *x, *y);
}

void swap(int* x, int* y){
  int temp = *x;
  *x = *y;
  *y = temp;
  print(x, y);
}

int main(void) {
  int x, y;
  scanf("%d %d", &x, &y);
  swap(&x, &y);

  return 0;
}