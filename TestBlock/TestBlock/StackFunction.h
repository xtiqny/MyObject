//
//  StackFunction.h
//  TestBlock
//
//  Created by 张耀 on 2020/6/3.
//  Copyright © 2020 张耀. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StackFunction : NSObject

+(id)sharInstance;
- (NSString*)stackProgram;
-(NSArray*)orderList;
- (void)testBarrier;

//冒泡排序
- (NSArray *)maoPaoPaiXu:(NSArray*)array;

//选择排序
- (NSArray *)selectPaiXu:(NSArray*)array;

//插入排序
- (NSArray *)chaRuPaiXu:(NSMutableArray*)array;

//希尔排序 - 插入排序
- (NSArray *)xiErPaiXu:(NSArray *)array;

//快排
- (NSArray*)quickSort:(NSMutableArray*)arr left:(NSInteger)left right:(NSInteger)right;

//归并排序
- (NSArray*)mergeSort:(NSArray*)array;

//堆排序
- (NSArray*)heapSort:(NSArray*)arr;


//计数排序
- (NSArray *)countionSort:(NSArray*)arr value:(NSInteger)maxValue;
@end

NS_ASSUME_NONNULL_END
