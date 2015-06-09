//
//  ViewController.m
//  simple-counter
//
//  Created by Vocka Huang on 2015/6/5.
//  Copyright (c) 2015年 Vocka Huang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clickcounter:(id)sender {
    self.counterdata++;
    NSString *showtext = [[NSString alloc] initWithFormat:@"current is %ld", self.counterdata ];
    self.counter.text = showtext;
    
}



@end
