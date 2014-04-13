//
//  PlayingCard.m
//  Machismo
//
//  Created by sarel saban on 3/11/14.
//  Copyright (c) 2014 Tutorial1. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

+ (NSUInteger)maxRank {
    return [[PlayingCard rankString] count] - 1;
}

+ (NSArray *)rankString{
    return @[@"?",@"A",@"2",@"3", @"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

- (int)match:(NSArray *)otherCards{
    int score = 0;
    
    if ([otherCards count] == 1){
        PlayingCard *otherCard = [otherCards firstObject];
        if (otherCard.rank == self.rank){
            score = 4;
        }else if ([otherCard.suit isEqualToString:self.suit ]){
            score = 1;
        }

    }
    return score;
    
}
- (NSString *)contents {
    
    NSArray  *rankStrings = [PlayingCard rankString];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+ (NSArray *)validSuit{
    return @[@"♣️",@"♠️",@"♥️",@"♦️"];
    
}
@synthesize suit = _suit; //because we provide setter AND getter

- (void)setSuit:(NSString *)suit{
    if ([[PlayingCard validSuit] containsObject:suit]){
        _suit = suit;
    }
}

- (NSString *)suit{
    return _suit ? _suit : @"?";
}

- (void)setRank:(NSUInteger)rank{
    if (rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}

@end
