//
//  DetailViewController.h
//  homework-v1
//
//  Created by Vocka Huang on 2015/5/20.
//  Copyright (c) 2015年 Vocka Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

