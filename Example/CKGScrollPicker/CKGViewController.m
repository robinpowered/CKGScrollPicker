//
//  CKGViewController.m
//  CKGScrollPicker
//
//  Created by Courtney Guo on 08/06/2015.
//  Copyright (c) 2015 Courtney Guo. All rights reserved.
//

#import "CKGViewController.h"
#import "CKGScrollPicker.h"
#import <FLKAutoLayout/UIView+FLKAutoLayout.h>

@interface CKGViewController ()

@property (weak, nonatomic) IBOutlet UIView *capacityView;

@end

@implementation CKGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CKGScrollPicker *capacityPicker = [[CKGScrollPicker alloc] initWithOptions:@[@"Any", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"10+"]];
    [capacityPicker loadView];
    [self.capacityView addSubview:capacityPicker];
    [capacityPicker alignLeading:@"16" trailing:@"-16" toView:self.capacityView];
    [capacityPicker alignBottomEdgeWithView:self.capacityView predicate:@"0"];
    [capacityPicker constrainHeight:@"60"];
}


@end
