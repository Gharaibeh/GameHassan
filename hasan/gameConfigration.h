//
//  gameConfigration.h
//  hasan
//
//  Created by Hasan Nihro Hasan Gharaibeh on 18/5/17.
//  Copyright © 2017 Hasan Nihro Hasan Gharaibeh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface gameConfigration : NSObject

{
    NSMutableDictionary *_leaderboard;
    NSString *_name;
    int duration ;
    int bubbles ;
    int hScore;
}

+ (gameConfigration *)sharedInstance;
 @property(strong, nonatomic, readwrite) NSMutableDictionary *gameLeaderboard;
@property(strong, nonatomic, readwrite) NSString *userName;
@property int defaultDuration;
@property int defaultBubbles;
@property int highScore;


@end
