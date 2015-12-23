//
//  PushedViewController.m
//  PGAnimation
//
//  Created by Pankaj on 04/12/15.
//  Copyright © 2015 Pankaj Gondaliya. All rights reserved.
//
// You can contact me on : https://www.facebook.com/pankaj.gondaliya.16

#import "PushedViewController.h"

@interface PushedViewController ()

@end

@implementation PushedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Action Methods

-(IBAction)btnBack:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
