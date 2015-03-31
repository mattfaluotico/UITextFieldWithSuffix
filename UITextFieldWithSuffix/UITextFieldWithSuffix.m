//
//  TextFieldWithSuffix.m
//  TextFieldWithSuffice
//
//  Created by Matthew Faluotico on 3/11/15.
//  Copyright (c) 2015 MF. All rights reserved.
//

#import "UITextFieldWithSuffix.h"
#import <objc/runtime.h>

@interface UITextFieldWithSuffixDelegate : NSObject <UITextFieldDelegate>
@property (weak, nonatomic) id<UITextFieldDelegate> delegate;
@end

@implementation UITextFieldWithSuffix {
    UITextFieldWithSuffixDelegate * _delegate;
}

// init

- (id) initWithFrame:(CGRect)frame andSuffix: (NSString *) suffix {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.suffix = suffix;
        [self commonInit];
    }
    
    return self;
}

- (id) initWithSuffix: (NSString*) suffix {
    self = [super init];
    
    if (self) {
        self.suffix = suffix;
        [self commonInit];
    }
    
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    [self commonInit];
    return self;
}

- (void) commonInit {
    _delegate = [UITextFieldWithSuffixDelegate new];
    [super setDelegate:_delegate];
}

// Delegate stuff

- (void) setDelegate:(id<UITextFieldDelegate>)delegate {
    _delegate.delegate = delegate;
}

- (id<UITextFieldDelegate>) delegate {
    return _delegate.delegate;
}

// get text without formatting

- (NSString*) getText {
    return [self.text stringByReplacingOccurrencesOfString:self.suffix withString:@""];
}

@end

@implementation UITextFieldWithSuffixDelegate

- (BOOL) respondsToSelector: (SEL) aSelector {
    // we'll forward any implemented UITextFieldDelegate method, other than the one we implement ourself.
    
    BOOL selfResponds = [super respondsToSelector: aSelector];
    if ( selfResponds )
        return YES;
    
    struct objc_method_description md = protocol_getMethodDescription( @protocol(UITextFieldDelegate), aSelector, NO, YES);
    
    if ( md.name != NULL && md.types != NULL )
        return [self.delegate respondsToSelector: aSelector];
    
    return selfResponds;
}

- (id) forwardingTargetForSelector: (SEL) aSelector {
    // we'll forward any implemented UITextFieldDelegate method, other than the one we implement ourself.
    
    struct objc_method_description md = protocol_getMethodDescription( @protocol(UITextFieldDelegate), aSelector, NO, YES);
    
    if ( md.name != NULL && md.types != NULL && [self.delegate respondsToSelector: aSelector] )
        return self.delegate;
    
    return nil;
}

- (BOOL)textField:(UITextFieldWithSuffix *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *value = [textField.text stringByReplacingOccurrencesOfString:textField.suffix withString:@""];
    
    // Delete Key
    if ([string length] == 0) {
        
        if ([value length] == 1) {
            textField.text = @"";
            return YES;
        }
        
        NSString *replace = [value substringToIndex:[value length] - 1];
        textField.text = [NSString stringWithFormat:@"%@%@", replace, textField.suffix];
        return NO;
        // All other keys
    } else {
        textField.text = [NSString stringWithFormat:@"%@%@%@", value, string, textField.suffix];
        return NO;
    }
    
}

@end