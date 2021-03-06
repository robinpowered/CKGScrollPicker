//
//  CKGScrollPicker.m
//  Identity
//
//  Created by Courtney Guo on 8/6/15.
//  Copyright (c) 2015 Robin Powered. All rights reserved.
//

#import "CKGScrollPicker.h"
#import <FLKAutoLayout/UIView+FLKAutoLayout.h>

@interface CKGScrollPicker ()

@property (nonatomic, strong) UIScrollView *scrollView;


@end

@implementation CKGScrollPicker

- (void)setup {
    _scrollView = [[UIScrollView alloc] init];
    _textColor = [UIColor grayColor];
    _font = [UIFont systemFontOfSize:16];
    _iconSize = CGSizeMake(65, 40);
    _circleColor = [UIColor blueColor];
    _circleSize = 40;
    _circleBorderWidth = 1;
}

- (id)initWithOptions:(NSArray *)options selectedIndex:(NSInteger)index {
    self = [super init];
    if (self) {
        _options = options;
        _selectedIndex = index;
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

+ (instancetype)pickerWithOptions:(NSArray *)options selectedIndex:(NSInteger)index {
    return [[self alloc] initWithOptions:options selectedIndex:index];
}

- (void)reload {
    [self addSubview:self.scrollView];
    [self.scrollView constrainWidth:[NSString stringWithFormat:@"%f", self.iconSize.width] height:[NSString stringWithFormat:@"%f", self.iconSize.height]];
    [self.scrollView alignCenterWithView:self];
    self.scrollView.delegate = self;
    self.scrollView.clipsToBounds = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.clipsToBounds = YES;
    UIView *contentView = [[UIView alloc] init];
    NSMutableArray *labels = [[NSMutableArray alloc] init];
    for (int i = 0; i < (int)self.options.count; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.font = self.font;
        label.textColor = self.textColor;
        label.text = self.options[i];
        label.textAlignment = NSTextAlignmentCenter;
        [labels addObject:label];
        [contentView addSubview:label];
        [label constrainWidth:[NSString stringWithFormat:@"%f", self.iconSize.width] height:[NSString stringWithFormat:@"%f", self.iconSize.height]];
        if (i == 0) {
            [label alignLeadingEdgeWithView:contentView predicate:@"0"];
            [label alignTop:@"0" bottom:@"0" toView:contentView];
        }
        else {
            UILabel *previousLabel = labels[i-1];
            [label constrainLeadingSpaceToView:previousLabel predicate:@"0"];
            [label alignTopEdgeWithView:previousLabel predicate:@"0"];
        }
        if (i == (int)self.options.count - 1) {
            [label alignTrailingEdgeWithView:contentView predicate:@"0"];
        }
    }
    [self.scrollView addSubview:contentView];
    [contentView alignTop:@"0" leading:@"0" bottom:@"0" trailing:@"0" toView:self.scrollView];
    UIView *circle = [[UIView alloc] init];
    [self addSubview:circle];
    [circle constrainWidth:[NSString stringWithFormat:@"%f", self.circleSize] height:[NSString stringWithFormat:@"%f", self.circleSize]];
    [circle alignCenterWithView:self];
    circle.layer.cornerRadius = self.circleSize/2;
    circle.layer.borderColor = self.circleColor.CGColor;
    circle.layer.borderWidth = self.circleBorderWidth;
    
    UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    singleTapGestureRecognizer.numberOfTapsRequired = 1;
    singleTapGestureRecognizer.enabled = YES;
    singleTapGestureRecognizer.cancelsTouchesInView = NO;
    [self.scrollView addGestureRecognizer:singleTapGestureRecognizer];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.scrollView setContentOffset:CGPointMake(self.selectedIndex*self.iconSize.width, 0) animated:NO];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    return [self pointInside:point withEvent:event] ? self.scrollView : nil;
}

- (void)singleTap:(UITapGestureRecognizer *)gesture {
    CGPoint tapPoint = [gesture locationInView:self.scrollView];
    NSInteger index = (NSInteger)(tapPoint.x/self.iconSize.width);
    [self.scrollView setContentOffset:CGPointMake(index*self.iconSize.width, 0) animated:YES];
    if ([self.delegate respondsToSelector:@selector(picker:didSelectOptionIndex:)]) {
        [self.delegate picker:self didSelectOptionIndex:index];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = (NSInteger)(scrollView.contentOffset.x/self.iconSize.width);
    if ([self.delegate respondsToSelector:@selector(picker:didSelectOptionIndex:)]) {
        [self.delegate picker:self didSelectOptionIndex:index];
    }
}

- (void)setSelectedIndex:(NSInteger)index animated:(BOOL)animated {
    [self.scrollView setContentOffset:CGPointMake(index*self.iconSize.width, 0) animated:animated];
}

@end
