//
//  IOSInterview.m
//  TestBlock
//
//  Created by 张耀 on 2020/6/10.
//  Copyright © 2020 张耀. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IOSInterview.h"

@interface IOSInterview()
@property (nonatomic,strong) NSThread * thread;


//若使用copy会崩溃，因为copy复制的就是一个不可变对象
@property (nonatomic,strong) NSMutableArray * array;
@end


@implementation IOSInterview

//单列实现
+(id)shareInstance
{
    static dispatch_once_t token;
    static IOSInterview* shareInit = nil;
    dispatch_once(&token, ^{
        shareInit = [[self alloc] init];
    });
    return shareInit;
}


//RunLoop 相关

//RunLoop 常驻线程
- (void)createThread
{
    self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    [self.thread start];
}

- (void)run
{
    NSRunLoop* runloop = [NSRunLoop currentRunLoop];
    [runloop addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
    [runloop run];
}

- (void)run2
{
    NSLog(@"常驻线程");
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //添加手指按下事件
    [self performSelector:@selector(run2) onThread:self.thread withObject:nil waitUntilDone:NO];
}


//copy 崩溃
- (void)testArrayCopy
{
    self.array = [NSMutableArray array];
    [self.array addObject:@"1"];
}


- (void)testGCD1
{
    __block NSInteger i = 0;
    dispatch_queue_t queue= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_sync(queue, ^{
        if (i<5) {
            i++;
        }
    });
    NSLog(@"testGCD1:%ld",(long)i);
}

- (void)testGCD2
{
    @synchronized (self) {
        __block NSInteger i = 0;
        dispatch_queue_t queue= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        
        dispatch_async(queue, ^{
            if (i<5) {
                i++;
            }
        });
        
        NSLog(@"testGCD2:%ld",(long)i);
    }

}


//首先先打印1
//接下来将任务2其添加至串行队列上，由于任务2是异步，不会阻塞线程，继续向下执行，打印3
//然后是任务4,将任务4添加至串行队列上，因为任务4和任务2在同一串行队列，根据队列先进先出原则，任务4必须等任务2执行后才能执行，又因为任务4是同步任务，会阻塞线程，只有执行完任务4才能继续向下执行打印5
//所以最终顺序就是13245。
//这里的任务4在主线程中执行，而任务2在子线程中执行。
//如果任务4是添加到另一个串行队列或者并行队列，则任务2和任务4无序执行(可以添加多个任务看效果)
-(void)testGCD3
{
    dispatch_queue_t serialQueue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
    
    NSLog(@"1");
    
    dispatch_async(serialQueue, ^{
        
         NSLog(@"2");
    });
    
    NSLog(@"3");
    
    dispatch_sync(serialQueue, ^{
        
        NSLog(@"4");
    });
    
    NSLog(@"5");
}


//这个方法要创建提交任务到runloop上的，而gcd底层创建的线程是默认没有开启对应runloop的，所有这个方法就会失效
//而如果将dispatch_get_global_queue改成主队列，由于主队列所在的主线程是默认开启了runloop的，就会去执行(将dispatch_async改成同步，因为同步是在当前线程执行，那么如果当前线程是主线程，test方法也是会去执行的)。
-(void)testGCD4
{
    __weak typeof(self)weakSelf = self;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
       // dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf performSelector:@selector(test:) withObject:nil afterDelay:0];
        
        //});
        
    });
}

- (void)test:(id)dd
{
    NSLog(@"我进来了");
}

//查找两个视图共同的父视图
- (NSArray <UIView*>*)getViewSuproView:(UIView*)view1 view2:(UIView*)view2
{
    NSMutableArray * curArray = [NSMutableArray array];
    NSArray * viewArray1 = [view1 subviews];
    NSArray * viewArray2 = [view2 subviews];
    
    NSInteger i = 0;
    while (i < MIN(viewArray1.count, viewArray2.count))
    {
        UIView * viewSub1= viewArray1[viewArray1.count -i -1];
        UIView * viewSub2= viewArray2[viewArray1.count -i -1];
        if (viewSub1 == viewSub2) {
            [curArray addObject:viewSub1];
            i++;
        }else{
            break;
        }
    }
    return curArray;
}

//读取一个大文件二进制1的个数
//把数字和1做与运算，判断最低位是不是1
//把1左移一位得到2，再和数字做与运算判断次低位是不是1
//如此反复左移，每次都能判断一位是不是1，直到将原本的1做完左移后值为0
- (NSInteger)numberOf:(NSInteger)n
{
    NSInteger count = 0;
    NSUInteger flag = 1;
    while (flag) {
        if (n & flag) {
            count ++;
        }
         flag = flag << 1;
    }
    return count;
}

//先判断输入的整数最右一位是不是1
//接着将整个数字右移一位，此时，原来处于从右边数第2位的数字就成了最右一位了，再次判断最右一位是不是1
//依此类推，知道整个整数数值为0
- (NSInteger)numberOf2:(NSInteger)n
{
    NSInteger count = 0;
    while (n) {
        if (n & 1) {
             count ++;
        }
       n >> 1;
    }
    
    return count;
}

//把一个整数减去1，再和原整数做与运算，会把该整数最右边的一个1变为0。那么一个整数的二进制中有多少个1，就可以进行多少次这样的操作
- (NSInteger)numberOf3:(NSInteger)n
{
    NSInteger count = 0;
    while (n) {
        ++count;
        n = (n - 1) & n;
    }
    
    return count;
}


@end
