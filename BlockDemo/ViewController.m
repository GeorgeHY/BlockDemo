//
//  ViewController.m
//  BlockDemo
//
//  Created by iwind on 15/6/22.
//  Copyright (c) 2015年 HanYang. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *stringLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"我在玩手机");
    NSLog(@"手机没电了");
//    [self chargeMyIphone];
//    [self performSelector:@selector(chargeMyIphone:) withObject:nil afterDelay:10];
    [self chargeMyIphone:^{
        
        //此处代码是block中需要执行的代码
        //后走
        NSLog(@"出去逛街");
    }];
    
    NSLog(@"我在看电视");
}

-(void)chargeMyIphone:(void (^)(void))finishBlock
{
    //第二个void证明没有给调用者返回值
//    [NSThread sleepForTimeInterval:10];
    double delayInSeconds = 10.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        NSLog(@"电充好了");
        //    //先走
        finishBlock();
    });
    
//    NSLog(@"电充好了");
////    NSLog(@"继续玩手机");

//    finishBlock();
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    SecondViewController * secondVC = [[SecondViewController alloc]initWithNibName:@"SecondViewController" bundle:nil];
    [secondVC returnInputStr:^(NSString *content) {
        self.stringLabel.text = content;
    }];
    
    [self presentViewController:secondVC animated:YES completion:nil];
    
}

@end
