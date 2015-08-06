//
//  CKGScrollPicker.h
//  Identity
//
//  Created by Courtney Guo on 8/6/15.
//  Copyright (c) 2015 Robin Powered. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CKGScrollPicker : UIView

@property (nonatomic) CGSize iconSize;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *circleColor;
@property (nonatomic) CGFloat circleSize;
@property (nonatomic) CGFloat circleBorderWidth;

- (instancetype)initWithOptions:(NSArray *)options;
- (void)loadView;

@end
