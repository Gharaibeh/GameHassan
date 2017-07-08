//
//  bubbleRules.h
//  hasan
//
//  Created by Hasan Nihro Hasan Gharaibeh on 18/5/17.
//  Copyright © 2017 Hasan Nihro Hasan Gharaibeh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef enum
{
    red  = 40,
    pink = 70,
    green= 85,
    blue = 95,
    black=100
 } colorPropability;

 

@interface bubbleRules : NSObject
{
    
     int bubbleValue ;
     NSString *colorName;
   
}
- (NSString *)getBubbleColor:(int)randNumber;
- (int)getBubbleValue;
 

@end
