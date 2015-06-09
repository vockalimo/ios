//
//  ViewController.m
//  speaker
//
//  Created by Vocka Huang on 2015/6/9.
//  Copyright (c) 2015年 Vocka Huang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.synthesizer = [[AVSpeechSynthesizer alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)speaker:(id)sender {
    
    if (!self.synthesizer.isSpeaking) {
      
        AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-TW"];
        AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:self.inputdata.text];
        utterance.voice = voice;
        [self.synthesizer speakUtterance:utterance];
    }
    
    
}
@end
