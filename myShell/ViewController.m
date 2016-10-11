//
//  ViewController.m
//  myShell
//
//  Created by cc on 16/8/11.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "ViewController.h"
#import "FBMyShellViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    self.title = @"111";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    FBMyShellViewController *myShellVC = [[FBMyShellViewController alloc] init];
    
    [self.navigationController pushViewController:myShellVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
