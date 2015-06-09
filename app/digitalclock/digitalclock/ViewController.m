//
//  ViewController.m
//  digitalclock
//
//  Created by Vocka Huang on 2015/6/4.
//  Copyright (c) 2015年 Vocka Huang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self runtime];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void) displayClockData
{
   //reference https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSDateFormatter_Class/index.html#//apple_ref/occ/cl/NSDateFormatter
    
    NSDateFormatter *Dateformatter = [[NSDateFormatter alloc] init];
   // Dateformatter.timeStyle = NSDateFormatterMediumStyle;
    Dateformatter.dateStyle = NSDateFormatterFullStyle;
    NSLocale *zhLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_TW"];
    NSLocale *jpLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
    NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];

    [Dateformatter setLocale:zhLocale];
    
    NSDate *date = [NSDate date];
  //  [formatter setTimeStyle:NSDateFormatterMediumStyle];
    //http://api.rubyonrails.org/classes/ActiveSupport/TimeZone.html
    self.displayClock.text = [Dateformatter stringFromDate:date ];
    Dateformatter.timeStyle = NSDateFormatterMediumStyle;
    Dateformatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"Asia/Taipei"];
    self.taipei.text = [Dateformatter stringFromDate:date ];
 
    
 //   NSLocale *jpLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
    [Dateformatter setLocale:jpLocale];
    Dateformatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Tokyo"];
    self.tokyo.text = [Dateformatter stringFromDate:date ];
   
    [Dateformatter setLocale:usLocale];
    Dateformatter.timeZone = [NSTimeZone timeZoneWithName:@"America/Los_Angeles"];
    self.la.text = [Dateformatter stringFromDate:date ];
    
}

- (void) runtime
{
    
    self.myTicker = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(displayClockData) userInfo:nil repeats:YES];
}
@end
