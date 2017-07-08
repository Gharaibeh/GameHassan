//
//  InputValidator.m
//  hasan
//
//  Created by Hasan Nihro Hasan Gharaibeh on 18/5/17.
//  Copyright © 2017 Hasan Nihro Hasan Gharaibeh. All rights reserved.
//

#import "InputValidator.h"

@implementation InputValidator

-(BOOL) checkInput:(NSString*) input
{
    
    BOOL status = (input.length<1)?NO:YES;
    return status;
}
@end
