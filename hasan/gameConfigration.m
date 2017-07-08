//
//  gameConfigration.m
//  hasan
//
//  Created by Hasan Nihro Hasan Gharaibeh on 18/5/17.
//  Copyright © 2017 Hasan Nihro Hasan Gharaibeh. All rights reserved.
//

#import "gameConfigration.h"

@implementation gameConfigration

@synthesize gameLeaderboard = _leaderboard;
@synthesize userName = _name;
@synthesize defaultDuration = duration;
@synthesize defaultBubbles = bubbles;
@synthesize highScore = _highScore;

 

 
+ (gameConfigration *)sharedInstance {
    static dispatch_once_t onceToken;
    static gameConfigration *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[gameConfigration alloc] init];
    });
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {
        _leaderboard = [[NSMutableDictionary alloc] init];
        _name = nil;
        duration = 60;
        bubbles = 15;
        _highScore = 0;
        
    }
    return self;
}


 

@end
