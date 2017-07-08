//
//  Bubble.h
//  hasan
//
//  Created by Hasan Nihro Hasan Gharaibeh on 18/5/17.
//  Copyright © 2017 Hasan Nihro Hasan Gharaibeh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Bubble : UIViewController < NSObject>
{
    int width ;
    int hight ;
    int score ;
 }

-(void)drawBubble:(UIButton*)sender;
-(int)getCircleRad;
 
@end
