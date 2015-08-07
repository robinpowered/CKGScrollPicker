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
@property (nonatomic, strong) CKGScrollPicker *picker;

@end

@implementation CKGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.picker = [[CKGScrollPicker alloc] init];
    self.picker.delegate = self;
    self.picker.options = @[@"Any", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"10+"];
    [self.picker loadView];
    [self.capacityView addSubview:self.picker];
    [self.picker alignLeading:@"16" trailing:@"-16" toView:self.capacityView];
    [self.picker alignBottomEdgeWithView:self.capacityView predicate:@"0"];
    [self.picker constrainHeight:@"60"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.picker setSelectedIndex:2 animated:NO];
}

- (void)picker:(CKGScrollPicker *)picker didSelectOptionIndex:(NSInteger)index {
    NSLog(@"selected %ld", (long)index);
}

@end
