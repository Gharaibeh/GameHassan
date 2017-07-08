//
//  Bubble.m
//  hasan
//
//  Created by Hasan Nihro Hasan Gharaibeh on 18/5/17.
//  Copyright © 2017 Hasan Nihro Hasan Gharaibeh. All rights reserved.
//

#import "Bubble.h"
#import "bubbleRules.h"

@implementation Bubble


-(void)drawBubble:(UIButton*)sender
{
     
    bubbleRules *bRule = [[bubbleRules alloc]init];
    int randomNum = (CGFloat) (arc4random() % 100);

     NSString *colorIndex2 = [bRule getBubbleColor:randomNum];
     
    UIImage *buttonImage = [UIImage imageNamed: colorIndex2 ];
    [sender setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [sender setTag:[bRule getBubbleValue ]];
  
     hight = width = 50;
    
}

-(int)getCircleRad
{
    return  hight;
}

 

@end
