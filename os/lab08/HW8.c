#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

static pthread_mutex_t m = PTHREAD_MUTEX_INITIALIZER;

typedef struct {
    int *arr;
    int left;
    int right;
    int *sum;
} ThreadArgs;

static void *threadSum(void *arg) {
    ThreadArgs *args = (ThreadArgs *)arg;
    int *arr = args->arr;
    int left = args->left;
    int right = args->right;
    int *sum = args->sum;
    int temp = 0;

    for (int i = left; i < right; ++i) {
        temp += arr[i]; 
    }
    printf("temp = %d\n", temp);

    pthread_mutex_lock(&m);
    *sum += temp;
    pthread_mutex_unlock(&m);

    return NULL;
}

int main(int argc, char *argv[]) {
    pthread_t t1, t2, t3, t4;
    int n;
    scanf("%d", &n);
    int sum = 0;

    int* array = (int *)malloc(sizeof(int) * n);
    // Сгенерируем небольшие числа чтобы не было переполнения
    for (int i = 0; i < n; i++) {
        array[i] = rand() % 100;
    }

    ThreadArgs args1 = {array, 0, n/4, &sum};
    pthread_create(&t1, NULL, threadSum, (void *)&args1);

    ThreadArgs args2 = {array, n/4, n/2, &sum};
    pthread_create(&t2, NULL, threadSum, (void *)&args2);

    ThreadArgs args3 = {array, n/2, 3*n/4, &sum};
    pthread_create(&t3, NULL, threadSum, (void *)&args3);

    ThreadArgs args4 = {array, 3*n/4, n, &sum};
    pthread_create(&t4, NULL, threadSum, (void *)&args4);

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);
    pthread_join(t3, NULL);
    pthread_join(t4, NULL);

    printf("sum = %d\n", sum);

    free(array);
    exit(EXIT_SUCCESS);
}