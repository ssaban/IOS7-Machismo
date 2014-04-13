//
//  PlayingCard.h
//  Machismo
//
//  Created by sarel saban on 3/11/14.
//  Copyright (c) 2014 Tutorial1. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuit;
+ (NSUInteger)maxRank;

@end
