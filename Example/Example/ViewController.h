//
//  ViewController.h
//  Example
//
//  Created by Matthew Faluotico on 3/31/15.
//  Copyright (c) 2015 MF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextFieldWithSuffix.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *suffix;
@property (weak, nonatomic) IBOutlet UITextFieldWithSuffix *field;

@end

