//
//  TestSocketViewController.m
//  TestBlock
//
//  Created by 张耀 on 2020/6/1.
//  Copyright © 2020 张耀. All rights reserved.
//

#import "TestSocketViewController.h"

#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#import "StackFunction.h"
#import "IOSInterview.h"

static const char* serevr_ip = "127.0.0.1";
static const short sereve_prot = 6969;

@interface TestSocketViewController ()
@property (nonatomic,assign) NSInteger clinetSocket;
@end

@implementation TestSocketViewController
- (id)initMainView
{
    self = [super initWithNibName:@"TestSocketViewController" bundle:nil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [[IOSInterview shareInstance] testArrayCopy];
    //初始化
     _clinetSocket = socket(AF_INET, SOCK_STREAM, 0);
    
    [[IOSInterview shareInstance] testGCD1];
    //[[IOSInterview shareInstance] testGCD3];
    [[IOSInterview shareInstance] testGCD4];
    
    //1:0001   2:0010 3:0011 4:00100 5:00101 6:00110 7:00111
   NSInteger i = [[IOSInterview shareInstance]numberOf:3];
    NSInteger q = [[IOSInterview shareInstance]numberOf:7];
    
    NSArray * cctv = [[StackFunction sharInstance] maoPaoPaiXu:@[@"2",@"7",@"6",@"8",@"10",@"1",@"0",@"3",@"5",@"9",@"4"]];
    
    NSArray * cctv1 = [[StackFunction sharInstance] selectPaiXu:@[@"2",@"7",@"6",@"8",@"10",@"1",@"0",@"3",@"5",@"9",@"4"]];
    
    NSArray * cctv2 = [[StackFunction sharInstance] chaRuPaiXu:@[@"2",@"7",@"6",@"8",@"10",@"1",@"0",@"3",@"5",@"9",@"4"]];
    
    NSArray * cctv3 = [[StackFunction sharInstance] xiErPaiXu:@[@"2",@"7",@"6",@"8",@"10",@"1",@"0",@"3",@"5",@"9",@"4"]];
    
    NSArray * arraucc = @[@"2",@"7",@"6",@"8",@"10",@"1",@"0",@"3",@"5",@"9",@"4"];
    NSMutableArray * arrcctv = [NSMutableArray arrayWithArray:arraucc];
    
    NSArray * cctv4 = [[StackFunction sharInstance] quickSort:arrcctv left:0 right:10];
    
    NSArray * cctv5 = [[StackFunction sharInstance] heapSort:arrcctv];
     
     
     //建立连接
     struct sockaddr_in saddr = {0};
     saddr.sin_port = htons(sereve_prot);//字节序
     saddr.sin_family = AF_INET;
     inet_aton(serevr_ip, &saddr.sin_addr);
     saddr.sin_len = sizeof(saddr);
     
    NSInteger connectFlag =  connect(_clinetSocket, (struct sockaddr*)&saddr, sizeof(saddr));
     
     if (connectFlag == 0) {
         NSThread * threed = [[NSThread alloc] initWithTarget:self selector:@selector(testSockerFunction) object:nil];
         [threed start];
     }
     else
     {
         NSLog(@"连接失败");
     }
    

    [self blockTest];
    
    StackFunction * stack = [StackFunction new];
    NSString* str = [stack stackProgram];
    NSLog(@"%@",str);
    
    
    NSArray * array = [stack orderList];
    
    [stack testBarrier];

    // Do any additional setup after loading the view from its nib.
}


   //静态和常量 不影响顺序
static NSInteger num3 = 3;
NSInteger num4 = 30000;

- (void)blockTest
{

    NSInteger num = 30;
    static NSInteger num2= 3;
    __block NSInteger num5= 30000;
    
    void(^block)(void)= ^{
        NSLog(@"%ld",(long)num);
        NSLog(@"%ld",(long)num2);
        NSLog(@"%ld",(long)num3);
        NSLog(@"%ld",(long)num4);
        NSLog(@"%ld",(long)num5);
    };
    
    block();
}



//Socker 测试
- (void)testSockerFunction
{
    //接受服务消息
    while (true) {
        char * msg[1024];
        recv(_clinetSocket, msg, sizeof(msg), 0);
        NSLog(@"%s\n",msg);
    }
}

//发送消息
- (void)sendMsg:(NSString*)msg
{
    char* send_msg = [msg cStringUsingEncoding:NSUTF8StringEncoding];
    send(_clinetSocket, send_msg, sizeof(send_msg), 0);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)send_Click:(id)sender {
    [[IOSInterview shareInstance] testGCD2];
    [self sendMsg:self.msgLable.text];
}
@end
