//
//  ViewController.m
//  Example
//
//  Created by Matthew Faluotico on 3/31/15.
//  Copyright (c) 2015 MF. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.field.suffix = @" suffix";
}

- (IBAction)update:(id)sender {
    self.field.suffix = self.suffix.text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
