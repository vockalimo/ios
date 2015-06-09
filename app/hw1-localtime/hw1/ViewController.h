//
//  ViewController.h
//  hw1
//
//  Created by Vocka Huang on 2015/5/20.
//  Copyright (c) 2015年 Vocka Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *billTotalAmount;
@property (weak, nonatomic) IBOutlet UITextField *tipAmount;
@property (weak, nonatomic) IBOutlet UITextField *putdata;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tiprange;
@property (weak, nonatomic) IBOutlet UIImageView *bgimage;

- (void) displayTotalAmount:(float)amount;
- (void) displayTipAmount:(float)amount;
- (float) calculateTipPercentageForSegment:(NSInteger)segment;
- (float) getBillAmount;
- (float) calculateTipAmount:(float)amount percent: (float) percent;

- (void) updateDisplayedTip;
- (void) updateDisplayedTotal;


@end

