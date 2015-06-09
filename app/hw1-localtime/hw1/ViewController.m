//
//  ViewController.m
//  hw1
//
//  Created by Vocka Huang on 2015/5/20.
//  Copyright (c) 2015年 Vocka Huang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



- (IBAction)tipChange:(UISegmentedControl *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) dismisskeyboard
{
    [self.putdata resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *) formatCurrency:(float) amount {
    
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    nf.numberStyle = NSNumberFormatterCurrencyStyle;
    NSNumber *number = [NSNumber numberWithInt:amount];
    return [nf stringFromNumber:number];
    //self.billTotalAmount.text = @"$0.00";
}



- (void) displayTotalAmount:(float) amount {
  /*
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    nf.numberStyle = NSNumberFormatterCurrencyStyle;
    NSNumber *number = [NSNumber numberWithInt:amount];
   */
    self.billTotalAmount.text = [self formatCurrency:amount];
    //self.billTotalAmount.text = @"$0.00";
}

- (void) displayTipAmount:(float) amount {
      self.tipAmount.text = [self formatCurrency:amount];
  }

- (float)
calculateTipPercentageForSegment:(NSInteger)segment {
    NSString *tipText = [self.tiprange titleForSegmentAtIndex:segment];
    return [tipText floatValue] / 100.0;
    //return 0.05;
}

- (float) getBillAmount {
    
    return [self.putdata.text floatValue];
}

- (float) calculateTipAmount:(float)amount percent: (float) percent {
    
    return amount * percent;
}


- (void) updateDisplayedTip
{
    float billamount = [self getBillAmount];
    NSInteger segment = self.tiprange.selectedSegmentIndex;
    float percent = [self calculateTipPercentageForSegment:segment];
    
    float tip = [self calculateTipAmount:billamount percent:percent];
    self.tipAmount.text = [self formatCurrency:tip];
}

- (void) updateDisplayedTotal
{
    float billamount = [self getBillAmount];
    NSInteger segment = self.tiprange.selectedSegmentIndex;
    float percent = [self calculateTipPercentageForSegment:segment];
    
    float tip = [self calculateTipAmount:billamount percent:percent];
    float total = billamount + tip;
    self.billTotalAmount.text = [self formatCurrency:total];
    
}


- (IBAction)tipChange:(UISegmentedControl *)sender {
    [self dismisskeyboard];
    [self updateDisplayedTip];
    [self updateDisplayedTotal];
    NSLog(@"tip percent change:%ld", (long)sender.selectedSegmentIndex);
}
@end
