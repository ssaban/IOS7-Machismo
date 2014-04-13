//
//  CardMatchingGame.m
//  Machismo
//
//  Created by sarel saban on 3/13/14.
//  Copyright (c) 2014 Tutorial1. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic, readwrite)NSInteger score;
@property (nonatomic, strong)NSMutableArray *cards;// of Card


@end


@implementation CardMatchingGame

- (NSMutableArray *)cards{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    
    self = [super init]; //super's designated initializer
    
    if (self){
        for (int i = 0; i <count ; i++){
            Card *card = [deck drawRandomCard];
            if (card){
                [self.cards addObject:card];
            }else{
                self = nil;// return nil if can not init properly
                break;
            }
        }
        
    }
    
    return self;
    
}

- (Card *)cardAtIndex:(NSUInteger)index{
    return ([self.cards count]) ? self.cards[index] : nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOSE = 1;


- (void)chooseCardAtIndex:(NSUInteger)index{
    
    Card *card = [self cardAtIndex:index];
    NSLog(@"ChooseCardAtIndex %lu",(unsigned long)index );
    
    if (!card.isMatched){
        if (card.isChosen){
            card.chosen = NO;
        }else {
            //match against other chosen cards
            for (Card *otherCard in self.cards){
                if(otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                        
                        
                    }else{
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                        
                    }
                    break;// can only chose 2 cards for now
                }
            }
            
            self.score -= COST_TO_CHOSE;
            card.chosen = YES;
        }
        
    }
}


@end
