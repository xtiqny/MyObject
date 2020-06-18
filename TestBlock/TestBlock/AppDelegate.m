//
//  AppDelegate.m
//  TestBlock
//
//  Created by 张耀 on 2020/5/29.
//  Copyright © 2020 张耀. All rights reserved.
//

#import "AppDelegate.h"
#import "TestSocketViewController.h"

@interface AppDelegate ()
@property (nonatomic,strong) TestSocketViewController * vcl;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
    //self.vcl = [[TestSocketViewController alloc] initMainView];
//    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:self.vcl];
//    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//
//    [self.window addSubview:self.vcl.view];
//    self.window.rootViewController = nav;
//    self.window.backgroundColor = [UIColor redColor];
//    [self.window makeKeyAndVisible];
    
    
//    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//     [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
//     TestSocketViewController *mainView = [[TestSocketViewController alloc]initMainView];
//     UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:mainView];
//     //NSDictionary *attributes=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1],NSForegroundColorAttributeName,nil];
//     //[nav.navigationBar setTitleTextAttributes:attributes];
//     [self.window addSubview:mainView.view];
//     self.window.rootViewController = nav;
//     self.window.backgroundColor = [UIColor whiteColor];
//     [self.window makeKeyAndVisible];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
