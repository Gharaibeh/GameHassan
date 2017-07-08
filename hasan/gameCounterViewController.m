//
//  gameCounterViewController.m
//  hasan
//
//  Created by Hasan Nihro Hasan Gharaibeh on 18/5/17.
//  Copyright © 2017 Hasan Nihro Hasan Gharaibeh. All rights reserved.
//

#import "gameCounterViewController.h"
#import "gameSceneViewController.h"

@interface gameCounterViewController ()

@end

@implementation gameCounterViewController
@synthesize lblTimer;


NSTimer *counter;
int remainingCounter;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    remainingCounter =3 ;
    counter = [NSTimer scheduledTimerWithTimeInterval:1
                                             target:self
                                           selector:@selector(counterDown)
                                           userInfo:nil
                                            repeats:YES];

    
    
}



-(void)counterDown {
    
    
    if (remainingCounter == 0)
        [self finishedTimer];
    else
        lblTimer.text = @(remainingCounter).stringValue;
    
    remainingCounter -- ;
}

-(void) finishedTimer
{
    lblTimer.text = @"Go";
    [counter invalidate];
    
    
    UIStoryboard *storyboard = self.storyboard;
    gameSceneViewController *game = [storyboard instantiateViewControllerWithIdentifier:@"Game"];
    [self presentViewController:game animated:YES completion:nil];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
