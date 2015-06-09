//
//  ViewController.h
//  digitalclock
//
//  Created by Vocka Huang on 2015/6/4.
//  Copyright (c) 2015年 Vocka Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *displayClock;
@property NSTimer *myTicker;
@property (weak, nonatomic) IBOutlet UILabel *taipei;
@property (weak, nonatomic) IBOutlet UILabel *tokyo;
@property (weak, nonatomic) IBOutlet UILabel *la;


- (void) displayClockData;
- (void) runtime;


@end

