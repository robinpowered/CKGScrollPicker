//
//  CKGScrollPicker.h
//  Identity
//
//  Created by Courtney Guo on 8/6/15.
//  Copyright (c) 2015 Robin Powered. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CKGScrollPicker;

@protocol CKGScrollPickerDelegate <NSObject>

@optional
- (void)picker:(CKGScrollPicker *)picker didSelectOptionIndex:(NSInteger)index;

@end

@interface CKGScrollPicker : UIView <UIScrollViewDelegate>

@property (nonatomic, strong) NSArray *options;
@property (nonatomic) CGSize iconSize;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *circleColor;
@property (nonatomic) CGFloat circleSize;
@property (nonatomic) CGFloat circleBorderWidth;

@property (nonatomic, weak) id<CKGScrollPickerDelegate> delegate;

- (void)loadView;

@end
