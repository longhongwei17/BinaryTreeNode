//
//  BinaryTreeNode.m
//  BinaryTreeNode
//
//  Created by Apple on 2017/3/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BinaryTreeNode.h"

@implementation BinaryTreeNode


/**
 创建二叉树

 @param values 数组
 @return 二叉树节点
 */
+ (BinaryTreeNode *)createTreeWithValues:(NSArray *)values
{
    BinaryTreeNode *root = nil;
    NSInteger count = values.count;
    for (NSInteger index = 0; index < count; index ++) {
        NSInteger value = [values[index] integerValue];
        [BinaryTreeNode addTreeNode:root value:value];
    }
    return root;
}


/**
 向二叉树节点添加一个节点

 @param treeNode 根节点
 @param value 值
 @return 根节点
 */
+ (BinaryTreeNode *)addTreeNode:(BinaryTreeNode *)treeNode
                          value:(NSInteger)value
{
    if (!treeNode) {
        treeNode = [BinaryTreeNode new];
        treeNode.value = value;
        NSLog(@"node:%@",@(value));
    }else if (value <= treeNode.value){
        NSLog(@"left");
        treeNode.leftBinaryTreeNode = [BinaryTreeNode addTreeNode:treeNode.leftBinaryTreeNode value:value];
    }else{
        NSLog(@"right");
        treeNode.rightBinaryTreeNode = [BinaryTreeNode addTreeNode:treeNode.rightBinaryTreeNode value:value];
    }
    return treeNode;
}


/**
 二叉树中某个位置的节点（按层次遍历）

 @param index 按层次遍历树时的位置（从0开始计算）
 @param treeNode 二叉树的根节点
 @return 节点
 */
+ (BinaryTreeNode *)treeNodeAtIndex:(NSInteger)index
                         inTreeNode:(BinaryTreeNode *)treeNode
{
    if (!treeNode || index < 0) {
        return nil;
    }
    NSMutableArray *queueList = [NSMutableArray array];
    [queueList addObject:treeNode];
    while (queueList.count > 0) {
        BinaryTreeNode *node = [queueList firstObject];
        if (index == 0) {
            return node;
        }
        [queueList removeObjectAtIndex:0];
        index -- ;
        if (node.leftBinaryTreeNode) {
            [queueList addObject:node.leftBinaryTreeNode];
        }
        if (node.rightBinaryTreeNode) {
            [queueList addObject:node.rightBinaryTreeNode];
        }
    }
    return nil;
}


/**
 先序遍历 先访问根，再遍历左子树，再遍历右子树

 @param rootNode 根节点
 @param handler 访问节点处理函数 回调
 */
+ (void)preOrderTraverseTree:(BinaryTreeNode *)rootNode
                     handler:(void(^)(BinaryTreeNode *))handler
{
    if (!rootNode) {
        return ;
    }
    
    if (handler) {
        handler(rootNode);
    }
    [self preOrderTraverseTree:rootNode.leftBinaryTreeNode handler:handler];
    [self preOrderTraverseTree:rootNode.rightBinaryTreeNode handler:handler];
}


/**
 中序遍历 先遍历左子树，再访问根，再遍历右子树

 @param rootNode 根节点
 @param handler 访问节点处理函数 回调
 */
+ (void)inOrderTraverseTree:(BinaryTreeNode *)rootNode handler:(void(^)(BinaryTreeNode *))handler
{
    if (!rootNode) {
        return;
    }
    [self inOrderTraverseTree:rootNode.leftBinaryTreeNode handler:handler];
    if (handler) {
        handler(rootNode);
    }
    [self inOrderTraverseTree:rootNode.rightBinaryTreeNode handler:handler];
}


/**
 后序遍历 先遍历左子树，再遍历右子树，再访问根

 @param rootNode BinaryTreeNode
 @param handler 遍历完后的 处理函数
 */
+ (void)postOrderTraverseTree:(BinaryTreeNode *)rootNode handler:(void(^)(BinaryTreeNode *))handler
{
    if (!rootNode) {
        return;
    }
    [self postOrderTraverseTree:rootNode.leftBinaryTreeNode handler:handler];
    [self postOrderTraverseTree:rootNode.rightBinaryTreeNode handler:handler];
    if (handler) {
        handler (rootNode);
    }
}



@end
