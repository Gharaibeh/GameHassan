//
//  gameSceneViewController.m
//  hasan
//
//  Created by Hasan Nihro Hasan Gharaibeh on 18/5/17.
//  Copyright © 2017 Hasan Nihro Hasan Gharaibeh. All rights reserved.
//

#import "gameSceneViewController.h"
#import "MainMenuViewController.h"
#import "gameConfigration.h"
#import "bubbleRules.h"
#import "Bubble.h"

@interface gameSceneViewController ()

@end


@implementation gameSceneViewController

@synthesize lblTimer;
@synthesize lblScore;
@synthesize lblHighScore;

NSMutableArray *bubblesArray ;

gameConfigration *configs;
NSTimer *gameFinishTimer;
int remainingCounts;
int score;
int previousBubble;
int BubblesLeft;
NSTimer *gameBubbleCounter;
int gameTimer;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    configs = [gameConfigration sharedInstance];

    
}

-(void) viewWillAppear:(BOOL)animated
{
    bubblesArray = [[NSMutableArray alloc] init];


    score = 0;
    previousBubble = 0;
    BubblesLeft = 0;
    lblHighScore.text = @(configs.highScore).stringValue;

    gameTimer = configs.defaultDuration;
    [self loadGameStats];

    [self gameStart];
    
    
    
    
}


-(void) loadGameStats
{
    lblTimer.text = @(configs.defaultDuration).stringValue;
    lblScore.text =  @(score).stringValue;
    lblHighScore.text = @(configs.highScore).stringValue;
    
}

-(void)RenderBubbles
{
    
    gameTimer--;
    int i= 0;
    Bubble *bubble = [[Bubble alloc]init];
    
    while (i<configs.defaultBubbles-BubblesLeft) {
        
         UIButton *but= [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [but addTarget:self action:@selector(bubbleClicked:) forControlEvents:UIControlEventTouchUpInside];
        [but setExclusiveTouch:YES];
        
        [bubble drawBubble:but];
        [bubblesArray addObject:but];
        
        [self.view insertSubview:but atIndex:0];
        
         CGFloat x = (CGFloat) (arc4random_uniform(self.view.frame.size.width - bubble.getCircleRad));
        CGFloat y = (CGFloat) (arc4random_uniform(self.view.frame.size.height - bubble.getCircleRad));
        
        CGRect currentPos = CGRectMake(x, y, bubble.getCircleRad , bubble.getCircleRad);
        [but setFrame:currentPos];
        

        
        i++;
    }
    
    
    [self CollissionCheck:bubble.getCircleRad];
    
    [self removeRandomBubbles];
    
    lblTimer.text = @(gameTimer).stringValue;

}

-(void)removeRandomBubbles
{
    
    
    // how many bubbles do we need to remove
    NSUInteger randNum;
    if(configs.defaultBubbles<3)
        randNum = 1;
    else
          randNum = arc4random_uniform((int)[bubblesArray count]-1)  ;
    
    BubblesLeft = (int)[bubblesArray count] - (int)randNum;
    if(configs.defaultBubbles<3)
    {
        NSUInteger tempRand = 0;
        
        UIButton *btn = [bubblesArray objectAtIndex:tempRand];
        [bubblesArray removeObjectAtIndex:tempRand];
        [btn removeFromSuperview];
    }
    else
    for(int i=0; i<randNum ; i++)
    {
        NSUInteger tempRand = arc4random_uniform((int)[bubblesArray count]-1) + 1;
        
        UIButton *btn = [bubblesArray objectAtIndex:tempRand];
        [bubblesArray removeObjectAtIndex:tempRand];
        [btn removeFromSuperview];
        
    }
    
    
    
    
    
}



-(void) CollissionCheck:(int)radius
{

    for (int j=0; j< [bubblesArray count]; j++)
    {
 
         UIButton *currentBubble = [bubblesArray objectAtIndex:j];
         CGRect currentPos = CGRectMake(currentBubble.frame.origin.x, currentBubble.frame.origin.y, radius , radius);
        [currentBubble setFrame:currentPos];
        
        
        CGFloat x1 ;
        CGFloat y1 ;
         for (int i=0; i<[bubblesArray count] && i!=j ; i++)
        {
            
            UIButton *currentBubble2 = [bubblesArray objectAtIndex:i];
            CGFloat currentX2 = currentBubble2.frame.origin.x;
            CGFloat currentY2 = currentBubble2.frame.origin.y;
            CGRect currentPos2 = CGRectMake(currentX2, currentY2, radius, radius);
            
            while(CGRectIntersectsRect(currentPos2, currentPos) ==  YES)
            {
                
                x1 = (CGFloat) (arc4random_uniform(self.view.frame.size.width - radius));
                y1 = (CGFloat) (arc4random_uniform(self.view.frame.size.height - radius));
                currentPos  = CGRectMake(x1, y1, radius, radius);
                [currentBubble setFrame:currentPos];
                 i=0;
                break;
                
            }
            
        }
 
         [currentBubble setFrame:currentPos];
    }
    
}

-(void) bubbleClicked:(UIButton*)sender
{
     int tempScore = 0;
    if(sender.tag == previousBubble)
    {
        tempScore = roundf (1.5 * sender.tag);
        
        score+=tempScore;
    }
    else
        score+=sender.tag;
    
    score = roundf(score);
    
    previousBubble = (int)sender.tag;

    
    [self animateBubble:sender];
    [self animateScore:sender];
    
}

-(void)animateBubble:(UIButton *)sender
{
    [UIView animateWithDuration:0.25 animations:^{
        sender.frame = CGRectMake(sender.frame.origin.x-sender.frame.size.width/2,
                                  sender.frame.origin.y-sender.frame.size.height/2,
                                  sender.frame.size.width*2,
                                  sender.frame.size.height*2);
        sender.layer.opacity = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperviewAfterwhile:sender];
    }];
    
    

}

-(void)animateScore:(UIButton *)sender
{
    UILabel *label =  [[UILabel alloc] initWithFrame: CGRectMake(sender.frame.origin.x ,
                                                                 sender.frame.origin.y ,
                                                                 sender.frame.size.width*2,
                                                                 sender.frame.size.height*2)];
    
    label.text =[NSString stringWithFormat:@"+%@",@(sender.tag).stringValue];
    [self.view addSubview:label];
    
    [label setTextColor:[UIColor yellowColor]];
    [UIView animateWithDuration:0.4 animations:^{
        label.frame = CGRectMake(sender.frame.origin.x ,
                                 sender.frame.origin.y-200 ,
                                 300,
                                 300);
        
        label.alpha = 1;
    } completion:^(BOOL finished){
        [UIView animateWithDuration:0.5 animations:^{
            label.alpha = 0;
            label.hidden = YES;
        }];
    }];
    
    

}
-(void)removeFromSuperviewAfterwhile:(UIButton *)sender
{
    [sender removeFromSuperview];
    [bubblesArray removeObject:sender];
    
    NSString *res = @(score).stringValue;
    lblScore.text = res;
    
    if(score > configs.highScore)
        configs.highScore = score;
    
    lblHighScore.text = @(configs.highScore).stringValue;
    
  }

-(void) gameStart
{
    gameBubbleCounter = [NSTimer scheduledTimerWithTimeInterval:1
                                               target:self
                                             selector:@selector(RenderBubbles )
                                             userInfo:nil
                                              repeats:YES];


    
    gameFinishTimer = [NSTimer scheduledTimerWithTimeInterval:configs.defaultDuration
                                             target:self
                                           selector:@selector(endGame)
                                           userInfo:nil
                                            repeats:NO];
}



-(void)endGame
{
    
    [gameFinishTimer invalidate];
    [gameBubbleCounter invalidate];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Game Finished" message:[NSString stringWithFormat:@"Your score is : %d",score] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* alertAction = [UIAlertAction
                              actionWithTitle:@"Ok"
                              style:UIAlertActionStyleDefault
                              handler:^(UIAlertAction * action) {
                                  
                                  [self backToMenu];
                              }];
    
    [alert addAction:alertAction];
    
    [self presentViewController:alert animated:YES completion:nil];

    
    
}

-(void)backToMenu{
    
    
    UIStoryboard *storyboard = self.storyboard;
    MainMenuViewController *mainMenu = [storyboard instantiateViewControllerWithIdentifier:@"MainMenu"];
    [self presentViewController:mainMenu animated:YES completion:nil];
    
    
    //[configs.gameLeaderboard setValue:@(score).stringValue forKey:configs.userName];
    [configs.gameLeaderboard setValue:configs.userName forKey:@(score).stringValue];
   
    

    
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
