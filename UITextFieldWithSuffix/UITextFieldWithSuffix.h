//
//  TextFieldWithSuffix.h
//  TextFieldWithSuffice
//
//  Created by Matthew Faluotico on 3/11/15.
//  Copyright (c) 2015 MF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextFieldWithSuffix : UITextField <UITextFieldDelegate>

@property NSString *suffix;

- (NSString*) getText;

@end
