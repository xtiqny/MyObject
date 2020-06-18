//
//  ViewController.m
//  TestBlock
//
//  Created by 张耀 on 2020/6/1.
//  Copyright © 2020 张耀. All rights reserved.
//

#import "ViewController.h"
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/in.h>

static const char* serevr_ip = "127.0.0.1";
static const short sereve_prot = 6969;

@interface ViewController ()
@property (nonatomic,assign) NSInteger clinetSocket;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    //初始化
    _clinetSocket = socket(AF_INET, SOCK_STREAM, 0);
    
    
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
}
    
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

- (IBAction)send_click:(id)sender {
    [self sendMsg:self.msgLable.text];
}
@end
