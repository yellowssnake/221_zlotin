#include <stdio.h>
#include <stdlib.h>

struct Node {
    int data;
    struct Node* next;
};
struct Node*insert(struct Node* head, int data){
  struct Node* Nnode = (struct Node*)malloc(sizeof(struct Node));
  Nnode->data = data;
  Nnode->next = NULL;
  head->next = Nnode;
  return Nnode;
}
struct Node* create_node(struct Node*head, int n){
  head = (struct Node*)malloc(sizeof(struct Node));
  head->data = n;
  head->next = NULL; 
  return head;
}

void ReverseList(struct Node* prev, struct Node* head){
  if(head->next == NULL){
    return;
  }
  ReverseList(head, head->next);
  head->next->next = head;
}

void Deallocate(struct Node * current){
  if(current->next != NULL){
    Deallocate(current->next);
  }
  free(current);
}


int main() {
    struct Node *head = NULL;
    struct Node *end = NULL;
    int n;
    do {
        scanf("%d", &n);
        if(n != 0){
          if(head == NULL){
            head = create_node(head, n);
            end = head;
          }else{
            end = insert(end, n);
          }
        }

    } while (n != 0);
  
    ReverseList(NULL, head);
    head->next = NULL;
    struct Node* current = end;
    while(current != NULL){
      printf("%d ", current->data);
      current = current->next;
    }
    Deallocate(end);
    return 0;
}