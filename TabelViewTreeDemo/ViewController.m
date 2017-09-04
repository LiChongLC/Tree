//
//  ViewController.m
//  TabelViewTreeDemo
//
//  Created by cheshili5 on 2017/9/1.
//  Copyright © 2017年 cheshili5. All rights reserved.
//

#import "ViewController.h"
#import "PopularizeTreeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clicked:(id)sender {
    
    PopularizeTreeViewController *tree = [[PopularizeTreeViewController alloc] init];
    [self presentViewController:tree animated:YES completion:nil];
}


@end
