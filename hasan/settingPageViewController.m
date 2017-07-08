//
//  settingPageViewController.m
//  hasan
//
//  Created by Hasan Nihro Hasan Gharaibeh on 18/5/17.
//  Copyright © 2017 Hasan Nihro Hasan Gharaibeh. All rights reserved.
//

#import "settingPageViewController.h"
#import "MainMenuViewController.h"
#import "gameConfigration.h"

@interface settingPageViewController ()

@end
gameConfigration *config ;//= [[gameConfigration alloc]init];

@implementation settingPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    config = [gameConfigration sharedInstance];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
     
    self.sliderBubbles.value = config.defaultBubbles;
    self.sliderDuration.value = config.defaultDuration;
    
    self.lblGameDuration.text = @(config.defaultDuration).stringValue;
    self.lblMaxBubbles.text = @(config.defaultBubbles).stringValue;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sliderGameDuration:(UISlider *)sender {
    self.lblGameDuration.text = [NSString stringWithFormat:@"%d",(int)self.sliderDuration.value];
    
    
}
- (IBAction)sliderGameBubbles:(UISlider *)sender {
    
    self.lblMaxBubbles.text = [NSString stringWithFormat:@"%d",(int)self.sliderBubbles.value];

    
}
- (IBAction)btnSave:(id)sender {
    
    
    
    config.defaultDuration =(int)self.sliderDuration.value;
    config.defaultBubbles =(int)self.sliderBubbles.value;
    
    UIStoryboard *storyboard = self.storyboard;
    MainMenuViewController *mainMenu = [storyboard instantiateViewControllerWithIdentifier:@"MainMenu"];
    [self presentViewController:mainMenu animated:YES completion:nil];
    

    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
