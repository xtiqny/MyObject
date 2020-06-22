//
//  IOSInterview.h
//  TestBlock
//
//  Created by 张耀 on 2020/6/10.
//  Copyright © 2020 张耀. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IOSInterview : NSObject
+(id)shareInstance;


- (void)createThread;
- (void)run;
- (void)run2;


- (void)testArrayCopy;

- (void)testGCD1;
- (void)testGCD2;

//顺序
-(void)testGCD3;
//是否会执行
-(void)testGCD4;


//把数字和1做与运算，判断最低位是不是1
- (NSInteger)numberOf:(NSInteger)n;

@end

NS_ASSUME_NONNULL_END
