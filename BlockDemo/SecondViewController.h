//
//  SecondViewController.h
//  BlockDemo
//
//  Created by GE on 15/12/8.
//  Copyright © 2015年 HanYang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CallBackString)(NSString * content);

@interface SecondViewController : UIViewController

@property (nonatomic,copy) CallBackString content;

- (void)returnInputStr:(CallBackString)string;



@end
