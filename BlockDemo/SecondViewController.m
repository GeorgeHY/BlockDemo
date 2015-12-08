//
//  SecondViewController.m
//  BlockDemo
//
//  Created by GE on 15/12/8.
//  Copyright © 2015年 HanYang. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *InputTF;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)BackSendAction:(UIButton *)sender {
    
    self.content(self.InputTF.text);
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)returnInputStr:(CallBackString)string
{
    
    if (string) {
        NSLog(@"string = %@",string);
        
        self.content = string;
    
    }
//    string(@"你好");
}

@end
