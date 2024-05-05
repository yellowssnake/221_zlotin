#include <stdio.h>
#include <stdlib.h>

void swap(int* x, int* y){
  int temp = *x;
  *x = *y;
  *y = temp;
}
int** allocate_matrix(int n, int m){
    int **matrix = (int **)malloc(n * sizeof(int *));

    for (int i = 0; i < n; ++i) {
        matrix[i] = (int *)malloc(m * sizeof(int));
    }
    return matrix;
}
void deallocate_matrix(int **matrix, int n){
    for (int i = 0; i < n; ++i) {
        free(matrix[i]);
    }
    free(matrix);
}

int main() {
    int n, m;
    scanf("%d %d", &n, &m);

    int** matrix1 = allocate_matrix(n, m);
    int** matrix2 = allocate_matrix(m, n);
    
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) {
            scanf("%d", &matrix1[i][j]);
        }
    }
    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) {
            matrix2[i][j] = matrix1[j][i];
        }
    }

    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) {
            printf("%d ", matrix2[i][j]);
        }
        printf("\n");
    }
    
    
    deallocate_matrix(matrix1, n);

    deallocate_matrix(matrix2, m);

    return 0;
}