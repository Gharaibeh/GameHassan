//
//  settingPageViewController.h
//  hasan
//
//  Created by Hasan Nihro Hasan Gharaibeh on 18/5/17.
//  Copyright © 2017 Hasan Nihro Hasan Gharaibeh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface settingPageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblGameDuration;
@property (weak, nonatomic) IBOutlet UILabel *lblMaxBubbles;
@property (weak, nonatomic) IBOutlet UISlider *sliderDuration;
@property (weak, nonatomic) IBOutlet UISlider *sliderBubbles;

@end
