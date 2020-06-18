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

- (NSArray *)maoPaoPaiXu:(NSArray*)array;

- (NSArray *)selectPaiXu:(NSArray*)array;

- (NSArray *)chaRuPaiXu:(NSMutableArray*)array;

- (NSArray *)xiErPaiXu:(NSArray *)array;

- (NSArray*)quickSort:(NSMutableArray*)arr left:(NSInteger)left right:(NSInteger)right;

//归并排序
- (NSArray*)mergeSort:(NSArray*)array;

- (NSArray*)heapSort:(NSArray*)arr;

- (NSArray *)countionSort:(NSArray*)arr value:(NSInteger)maxValue;
@end

NS_ASSUME_NONNULL_END
