//
//  BinaryTreeNode.h
//  BinaryTreeNode
//
//  Created by Apple on 2017/3/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinaryTreeNode : NSObject

@property (nonatomic, assign) NSInteger value;

@property (nonatomic, strong) BinaryTreeNode *leftBinaryTreeNode;

@property (nonatomic, strong) BinaryTreeNode *rightBinaryTreeNode;

@end
