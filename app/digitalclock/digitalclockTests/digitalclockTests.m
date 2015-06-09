//
//  digitalclockTests.m
//  digitalclockTests
//
//  Created by Vocka Huang on 2015/6/4.
//  Copyright (c) 2015年 Vocka Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface digitalclockTests : XCTestCase
@property (strong, nonatomic) ViewController *vc;

@end

@implementation digitalclockTests

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

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void) UpdateDislayedTipAmount
{
    
    NSDate *testdate = [NSDate date];
    NSDateFormatter *Dateformatter = [[NSDateFormatter alloc] init];
    Dateformatter.timeStyle = NSDateFormatterMediumStyle;

    [self.vc runtime];
    NSString *tipString = self.vc.displayClock.text;
    
    XCTAssertEqualObjects(tipString,[Dateformatter stringFromDate:testdate] );
    
}



- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
