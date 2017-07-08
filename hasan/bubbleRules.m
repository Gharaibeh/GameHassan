//
//  bubbleRules.m
//  hasan
//
//  Created by Hasan Nihro Hasan Gharaibeh on 18/5/17.
//  Copyright © 2017 Hasan Nihro Hasan Gharaibeh. All rights reserved.
//

#import "bubbleRules.h"

@implementation bubbleRules

 

- (NSString *)getBubbleColor:(int)randNumber
{
    
 
    
    if(randNumber < (int)red)
    {
        colorName = @"Red";
     }
    else
        if(randNumber < (int)pink)
        {
            colorName = @"Pink";
         }
    
    
        else
            if(randNumber < (int)green)
            {
                colorName = @"Green";
                
            }
            else
                if(randNumber < (int)blue)
                {
                    colorName = @"Blue";
                    
                }
                else
                {
                    colorName = @"Black";
                     
                }
    

    
    
    [self setBubbleValue];
    return colorName;
    
}


-(void)setBubbleValue{
    
    if([colorName  isEqual: @"Red"])
        bubbleValue = 1;
    else
        if([colorName  isEqual: @"Pink"])
            bubbleValue = 2;
        else
            if([colorName  isEqual: @"Green"])
                bubbleValue = 5;
            else
                if([colorName  isEqual: @"Blue"])
                    bubbleValue = 8;
                else
                    bubbleValue = 10;
    
}


- (int)getBubbleValue{
    return  bubbleValue;
}





 
@end
