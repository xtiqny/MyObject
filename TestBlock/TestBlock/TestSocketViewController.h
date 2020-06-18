//
//  TestSocketViewController.h
//  TestBlock
//
//  Created by 张耀 on 2020/6/1.
//  Copyright © 2020 张耀. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestSocketViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *msgLable;
- (IBAction)send_Click:(id)sender;
- (id)initMainView;
@end

NS_ASSUME_NONNULL_END
