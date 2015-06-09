//
//  hw1Tests.m
//  hw1Tests
//
//  Created by Vocka Huang on 2015/5/20.
//  Copyright (c) 2015年 Vocka Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface hw1Tests : XCTestCase

@property (strong, nonatomic) ViewController *vc;
@end

@implementation hw1Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.vc = [storyboard instantiateInitialViewController];
    [self.vc performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testVcInstance {
    XCTAssertNotNil(self.vc);
}

- (void)testDisplayTotalAmount0 {
    [self.vc displayTotalAmount:0];
    NSString *result = self.vc.billTotalAmount.text;
    XCTAssertEqualObjects(result, @"$0.00");
    
}

- (void)testDisplayTotalAmount123 {
    [self.vc displayTotalAmount:123];
    NSString *result = self.vc.billTotalAmount.text;
    XCTAssertEqualObjects(result, @"$123.00");
    
}

- (void)testTipAmount123 {
    [self.vc displayTipAmount:123];
    NSString *result = self.vc.tipAmount.text;
    XCTAssertEqualObjects(result, @"$123.00");
    
}


- (void)testTipAmount0 {
    [self.vc displayTipAmount:0];
    NSString *result = self.vc.tipAmount.text;
    XCTAssertEqualObjects(result, @"$0.00");
    
}


- (void) testTiprange0 {
    float percent = [self.vc calculateTipPercentageForSegment:0];
    
    XCTAssertEqualWithAccuracy(percent, 0.05,0.001, @"Expected percent %f should be 0.05",percent);
}


- (void) testTiprange3 {
    float percent = [self.vc calculateTipPercentageForSegment:3];
    
    XCTAssertEqualWithAccuracy(percent, 0.20,0.001, @"Expected percent %f should be 0.20",percent);
}

- (void) testGetBillAmountBank {
    //putdata
    self.vc.putdata.text = @"";
    float result = [self.vc getBillAmount];
    XCTAssertEqualWithAccuracy(result, 0.0,0.001);
}

- (void) testGetBillAmountBankFor12 {
    //putdata
    self.vc.putdata.text = @"12.34";
    float result = [self.vc getBillAmount];
    XCTAssertEqualWithAccuracy(result, 12.34,0.001);
}

- (void) testCalculateTipAmount {
    float tip = [self.vc calculateTipAmount:12.34 percent:0.10];
    XCTAssertEqualWithAccuracy(tip, 1.23,0.05);
}

- (void) testUpdateDislayedTipAmount
{
    self.vc.putdata.text = @"0";
    self.vc.tiprange.selectedSegmentIndex = 1;
    [self.vc updateDisplayedTip];
    NSString *tipString = self.vc.tipAmount.text;
    XCTAssertEqualObjects(tipString, @"$0.00");
}

- (void) testUpdateDislayedTotalAmountZero
{
    self.vc.putdata.text = @"0";
    self.vc.tiprange.selectedSegmentIndex = 1;
    [self.vc updateDisplayedTotal];
    NSString *tipString = self.vc.billTotalAmount.text;
    XCTAssertEqualObjects(tipString, @"$0.00");
}

- (void) testUpdateDislayedTotalAmount10
{
    self.vc.putdata.text = @"10";
    self.vc.tiprange.selectedSegmentIndex = 1;
    [self.vc updateDisplayedTotal];
    NSString *tipString = self.vc.billTotalAmount.text;
    XCTAssertEqualObjects(tipString, @"$11.00");
}




- (void) testUpdateDislayedTipAmount10
{
    self.vc.putdata.text = @"10";
    self.vc.tiprange.selectedSegmentIndex = 1;
    [self.vc updateDisplayedTip];
    NSString *tipString = self.vc.tipAmount.text;
    XCTAssertEqualObjects(tipString, @"$1.00");
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
