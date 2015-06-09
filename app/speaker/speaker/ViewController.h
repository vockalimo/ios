//
//  ViewController.h
//  speaker
//
//  Created by Vocka Huang on 2015/6/9.
//  Copyright (c) 2015年 Vocka Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *inputdata;
@property (strong, nonatomic) AVSpeechSynthesizer *synthesizer;

- (IBAction)speaker:(id)sender;


@end

