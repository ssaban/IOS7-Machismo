//
//  CardMatchingGame.h
//  Machismo
//
//  Created by sarel saban on 3/13/14.
//  Copyright (c) 2014 Tutorial1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"



@interface CardMatchingGame : NSObject

//Designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic,readonly) NSInteger score;

@end
