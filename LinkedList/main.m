//
//  main.m
//  LinkedList
//
//  Created by 苏楚杰 on 2016/7/28.
//  Copyright © 2016年 苏楚杰. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct Node_ {//定义一个链表的类
    int value;
    struct Node_ *next;
}Node;
//销毁
void destoryList(Node *first){
    Node *node = first;
    Node *tmp;
    while (node !=NULL) {
        tmp =node;
        node = node->next;
        free(tmp);
        
    }
}
Node *creatNode(int value,Node *next){//为函数的初始化添加一个函数
    Node* node = malloc(sizeof(Node));
    node->value = value;
    node->next = next;
    return node;
}
//正向检索
void printList(Node *firstNode){//循环输出函数代码
    for (Node *node=firstNode; node !=NULL; node=node->next) {
        printf("currrent node value %d\n",node->value);
            }
    
}
//逆序
Node *ReverseLink(Node *head){
    
    Node *next;
    Node *prev = NULL;
    
    while (head != NULL) {
        
        next = head->next;
        head->next = prev;
        prev = head;
        head = next;
     
    }
        return prev;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Node *current = creatNode(0, NULL);//给予一个初始值
        Node *first = current;
        
        current->next = creatNode(1, NULL);//添加下一个值
        current = current->next;
        
        current->next = creatNode(2, NULL);//继续添加值
        current = current->next;
        
        first = creatNode(-1, first);//在开头前插入值
        
        printList(first);
        first = ReverseLink(first);
        printf("逆序后：\n");
        printList(first);
        destoryList(first);
    }
    return 0;
}
