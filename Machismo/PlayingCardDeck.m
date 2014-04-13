//
//  PlayingCardDeck.m
//  Machismo
//
//  Created by sarel saban on 3/11/14.
//  Copyright (c) 2014 Tutorial1. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype)init{
    self = [super init];
    
    if (self){
        for (NSString *suit in [PlayingCard validSuit]){
            for (NSUInteger rank = 1 ; rank <= [PlayingCard maxRank];rank++){
                PlayingCard *card = [[PlayingCard alloc]init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
        
    }
    
    return self;
    
}

@end
