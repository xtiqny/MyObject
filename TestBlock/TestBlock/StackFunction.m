//
//  StackFunction.m
//  TestBlock
//
//  Created by 张耀 on 2020/6/3.
//  Copyright © 2020 张耀. All rights reserved.
//

#import "StackFunction.h"
#import <objc/runtime.h>
@interface StackFunction()
@property (nonatomic, assign)NSInteger len;
@end

@implementation StackFunction

+(id)sharInstance
{
    static dispatch_once_t token;
    static StackFunction* stackFunction = nil;
    dispatch_once(&token, ^{
        stackFunction = [[self alloc] init];
    });
    return stackFunction;
}

//字符串反排序
- (NSString*)stackProgram
{
    NSString * str = @"hello,world";
    
    if (str.length < 0) {
        return nil;
    }
    
    
    NSMutableArray * strArray = [NSMutableArray array];
    for (int i = 0 ; i < str.length; i++) {
          unichar curStr = [str characterAtIndex:i];
        [strArray addObject:[NSString stringWithFormat:@"%c",curStr]];
    }
    
    
    NSMutableString * muStr = [[NSMutableString alloc] initWithCapacity:strArray.count];
    if (strArray.count > 0)
    {
        for (NSInteger i = strArray.count-1 ; i >= 0; i--) {
            [muStr  appendFormat:@"%@", [strArray objectAtIndex:i]];
        }
       
        return muStr;
    }
    
    return nil;
}

//两个数组合并
-(NSArray*)orderList
{
    NSArray * array1 = @[@1,@4,@6,@7,@9];
    NSArray * array2 = @[@2,@3,@5,@6,@8,@9,@10,@11,@12];
    if (array1.count < 0 || array2.count < 0) {
        return nil;
    }
    
    
    NSMutableArray * chagerArray = [NSMutableArray array];
    [chagerArray addObjectsFromArray:array1];
    [chagerArray addObjectsFromArray:array2];
    if (chagerArray.count <  0) {
        return nil;
    }
    
    
    //冒泡排序
//    for (NSInteger i = 0; i <= chagerArray.count -1; i++)
//    {
//        for (NSInteger j = 0; j < chagerArray.count -1 -i; j++) {
//            NSInteger a = [[chagerArray objectAtIndex:j]integerValue];
//            NSInteger b = [[chagerArray objectAtIndex:j+1] integerValue];
//            if (a > b )
//            {
//                [chagerArray setObject:@(b) atIndexedSubscript:j];
//                [chagerArray setObject:@(a) atIndexedSubscript:j+1];
//            }
//        }
//    }
    
    //选择排序
//    for (NSInteger i = 0; i < chagerArray.count; i++) {
//        NSInteger min = i;
//        for (NSInteger j = i; j < chagerArray.count; j++)
//        {
//            NSInteger a = [[chagerArray objectAtIndex:j]integerValue];
//            NSInteger b = [[chagerArray objectAtIndex:min] integerValue];
//            if (a < b)
//            {
//                min = j;
//            }
//        }
//
//        NSInteger a1 = [[chagerArray objectAtIndex:i]integerValue];
//        NSInteger b1 = [[chagerArray objectAtIndex:min] integerValue];
//        if (i != min)
//        {
//            [chagerArray setObject:@(b1) atIndexedSubscript:i];
//            [chagerArray setObject:@(a1) atIndexedSubscript:min];
//        }
//    }
    
    //插入排序
//    NSInteger i,j;
//    for (i = 1; i < chagerArray.count; i++) {
//        NSInteger a = [[chagerArray objectAtIndex:i]integerValue];
//        NSInteger b = [[chagerArray objectAtIndex:i-1] integerValue];
//        if (a < b)
//        {
//            NSInteger temp = a;
//            for (j = i; j > 0; j--)
//            {
//                NSInteger a1= [[chagerArray objectAtIndex:j-1]integerValue];
//                if (a1 > temp) {
//                    [chagerArray setObject:@(a1) atIndexedSubscript:j];
//                }
//                else
//                {
//                    break;
//                }
//
//                [chagerArray setObject:@(temp) atIndexedSubscript:j];
//            }
//        }
//    }
    
    //二分插入排序
    NSInteger i,j;
    for (i = 1; i < chagerArray.count; i++) {
        
        NSInteger a = [chagerArray[i] integerValue];
        NSInteger b = [chagerArray[i - 1]integerValue];
        if (a < b) {
                NSInteger temp = a;
                NSInteger left = 0,right = i -1;
                while (left <= right)
                {
                    NSInteger mid = (left + right)/2;
                    if ([chagerArray[mid] integerValue] < temp) {
                        left = mid + 1;
                    }else{
                        right = mid - 1;
                    }
                }
            
            //只是比较次数变少了，交换次数还是一样的
            for (j = i; j > left; j--) {
                chagerArray[j] = chagerArray[j-1];
            }
            chagerArray[left] = @(temp);
            //[chagerArray insertObject:@(temp) atIndex:left];
            }
    }
    
     
    return chagerArray;
}


//    2）
//O（n
//冒泡排序- 交换排序
- (NSArray *)maoPaoPaiXu:(NSArray*)array
{
    if (array.count < 0) {
        return nil;
    }
    
    NSMutableArray * curArray = [NSMutableArray arrayWithArray:array];
    
    for (NSInteger i = 0; i < curArray.count; i++) {
        NSInteger min = i;
        for (NSInteger j = i+ 1; j < array.count; j++) {
            NSInteger a = [curArray[j] integerValue];
            NSInteger b = [curArray[min] integerValue];
            if (a < b)
            {
                curArray[j] = @(b);
                curArray[min] = @(a);
            }
        }
    }
    
    return curArray;
}

//    2）
//O（n
//选择排序
- (NSArray *)selectPaiXu:(NSArray*)array
{
    if (array.count < 0) {
        return nil;
    }
    
    NSMutableArray * curArray = [NSMutableArray arrayWithArray:array];
    for (NSInteger i = 0; i < curArray.count; i++)
    {
        NSInteger min = i;
        for (NSInteger j = i; j < curArray.count; j++) {
            NSInteger a = [curArray[j] integerValue];
            NSInteger b = [curArray[min] integerValue];
            if (a < b) {
                min = j;
            }
        }
        
        NSInteger a1 = [curArray[i] integerValue];
        NSInteger b1 = [curArray[min] integerValue];
        if (i != min) {
            curArray[i] = @(b1);
            curArray[min] = @(a1);
        }
    }
    return curArray;
}

//    2）
//O（n
//插入排序
- (NSArray *)chaRuPaiXu:(NSArray*)array
{
    NSInteger index,a;
    NSMutableArray * curArray = [NSMutableArray arrayWithArray:array];
    for (NSInteger i = 1; i < curArray.count; i++) {
        index = i - 1;
        a = [curArray[i]integerValue];
        while (index >= 0 && [curArray[index]integerValue] > a) {
            curArray[index + 1] = curArray[index];
            index --;
        }
        curArray[index + 1]  = @(a);
    }
    return curArray;
}

//     1.3）
// O（n
//希尔排序 - 插入排序
- (NSArray *)xiErPaiXu:(NSArray *)array
{
    NSMutableArray * curArray = [NSMutableArray arrayWithArray:array];
    NSInteger len =array.count;
    for (NSInteger gap = len/2; gap > 0; gap = gap/2) { //分成两段
        for (NSInteger i = gap; i < len; i++) {
            NSInteger j = i;
            NSInteger current = [curArray[i]integerValue];
            while (j- gap >= 0&& current < [curArray[j-gap] integerValue]) {
                curArray[j] = curArray[j - gap];
                j = j - gap;
            }
            curArray[j] = @(current);
        }
    }
    
    return curArray;
}

//O(nlog2n)
//快速排序 - 交换排序
- (NSArray*)quickSort:(NSMutableArray*)arr left:(NSInteger)left right:(NSInteger)right
{
    NSInteger partitionIndex;
    if (left < right) {
        partitionIndex = [self partition:arr left:left right:right];
        [self quickSort:arr left:left right:partitionIndex - 1];
        [self quickSort:arr left:partitionIndex + 1 right:right];
    }
    return arr;
}


- (NSInteger)partition:(NSMutableArray*)arr left:(NSInteger)left right:(NSInteger)right
{
    NSInteger pivot = left;
    NSInteger index = pivot + 1;
    for (NSInteger i = index; i <= right; i++) {
        NSInteger a = [arr[i]integerValue];
        NSInteger b = [arr[pivot]integerValue];
        if (a < b) {
            [self swap:arr ined1:i ined2:index];
            index ++;
        }
    }
    [self swap:arr ined1:pivot ined2:index - 1];
    return index - 1;
}

- (void)swap:(NSMutableArray*)arr ined1:(NSInteger)i ined2:(NSInteger)j
{
    NSInteger tem = [arr[i]integerValue];
    arr[i] = arr[j];
    arr[j] = @(tem);
}
//@end

//O(nlog2n)
//归并排序- 归并排序
- (NSArray*)mergeSort:(NSArray*)array
{
    //java
//    function mergeSort(arr) {
//        var len = arr.length;
//        if (len < 2) {
//            return arr;
//        }
//        var middle = Math.floor(len / 2),
//            left = arr.slice(0, middle),
//            right = arr.slice(middle);
//        return merge(mergeSort(left), mergeSort(right));
//    }
//
//    function merge(left, right) {
//        var result = [];
//
//        while (left.length>0 && right.length>0) {
//            if (left[0] <= right[0]) {
//                result.push(left.shift());
//            } else {
//                result.push(right.shift());
//            }
//        }
//
//        while (left.length)
//            result.push(left.shift());
//
//        while (right.length)
//            result.push(right.shift());
//
//        return result;
//    }
    
    return nil;
}


//堆排序
- (NSArray*)heapSort:(NSArray*)arr
{
    [self buildMaxHeap:arr];
    for (NSInteger i = arr.count - 1; i > 0; i--) {
        [self swap:[NSMutableArray arrayWithArray:arr] ined1:0 ined2:i];
        _len --;
        [self heapify:arr value:0];
    }
    return arr;
}

- (void)buildMaxHeap:(NSArray*)arr// 建立大顶堆
{
    self.len = arr.count;
    for (NSInteger i = arr.count / 2; i >= 0; i--) {
        [self heapify:arr value:i];
    }
}

- (void)heapify:(NSArray*)arr value:(NSInteger)i //堆调整
{
    NSInteger left = 2 * i +1,
    right = 2 * i + 2,
    largest = i;
    if (left < _len && [arr[left] integerValue] > [arr[largest] integerValue]) {
        largest = left;
    }
    
    if (right < _len &&  [arr[right] integerValue] > [arr[largest] integerValue]) {
        largest = right;
    }
    
    if (largest != i) {
        [self swap:[NSMutableArray arrayWithArray:arr] ined1:i ined2:largest];
        [self heapify:arr value:largest];
    }
}

//O(n+k)
//计数排序
- (NSArray *)countionSort:(NSArray*)arr value:(NSInteger)maxValue
{
//    var bucket = new Array(maxValue + 1),
//           sortedIndex = 0;
//           arrLen = arr.length,
//           bucketLen = maxValue + 1;
//
//       for (var i = 0; i < arrLen; i++) {
//           if (!bucket[arr[i]]) {
//               bucket[arr[i]] = 0;
//           }
//           bucket[arr[i]]++;
//       }
//
//       for (var j = 0; j < bucketLen; j++) {
//           while(bucket[j] > 0) {
//               arr[sortedIndex++] = j;
//               bucket[j]--;
//           }
//       }
    
       return arr;
}

//桶排序
//function bucketSort(arr, bucketSize) {
//    if (arr.length === 0) {
//      return arr;
//    }
//
//    var i;
//    var minValue = arr[0];
//    var maxValue = arr[0];
//    for (i = 1; i < arr.length; i++) {
//      if (arr[i] < minValue) {
//          minValue = arr[i];                // 输入数据的最小值
//      } else if (arr[i] > maxValue) {
//          maxValue = arr[i];                // 输入数据的最大值
//      }
//    }
//
//    // 桶的初始化
//    var DEFAULT_BUCKET_SIZE = 5;            // 设置桶的默认数量为5
//    bucketSize = bucketSize || DEFAULT_BUCKET_SIZE;
//    var bucketCount = Math.floor((maxValue - minValue) / bucketSize) + 1;
//    var buckets = new Array(bucketCount);
//    for (i = 0; i < buckets.length; i++) {
//        buckets[i] = [];
//    }
//
//    // 利用映射函数将数据分配到各个桶中
//    for (i = 0; i < arr.length; i++) {
//        buckets[Math.floor((arr[i] - minValue) / bucketSize)].push(arr[i]);
//    }
//
//    arr.length = 0;
//    for (i = 0; i < buckets.length; i++) {
//        insertionSort(buckets[i]);                      // 对每个桶进行排序，这里使用了插入排序
//        for (var j = 0; j < buckets[i].length; j++) {
//            arr.push(buckets[i][j]);
//        }
//    }
//
//    return arr;
//}

//基数排序
//var counter = [];
//function radixSort(arr, maxDigit) {
//    var mod = 10;
//    var dev = 1;
//    for (var i = 0; i < maxDigit; i++, dev *= 10, mod *= 10) {
//        for(var j = 0; j < arr.length; j++) {
//            var bucket = parseInt((arr[j] % mod) / dev);
//            if(counter[bucket]==null) {
//                counter[bucket] = [];
//            }
//            counter[bucket].push(arr[j]);
//        }
//        var pos = 0;
//        for(var j = 0; j < counter.length; j++) {
//            var value = null;
//            if(counter[j]!=null) {
//                while ((value = counter[j].shift()) != null) {
//                      arr[pos++] = value;
//                }
//          }
//        }
//    }
//    return arr;
//}






//线程dispatch_barrier_async的功能
- (void)testBarrier
{
    dispatch_queue_t concurrentQueue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    
    for (NSInteger i = 0; i < 10; i++) {
        
        dispatch_sync(concurrentQueue, ^{
            
            NSLog(@"%zd",i);
        });
    }
    
    dispatch_barrier_async(concurrentQueue, ^{

        NSLog(@"barrier");
    });
    
    for (NSInteger i = 10; i < 20; i++) {
        
        dispatch_sync(concurrentQueue, ^{
            
            NSLog(@"%zd",i);
        });
    }
}
@end
