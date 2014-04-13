//
//  CardGameViewController.m
//  Machismo
//
//  Created by sarel saban on 3/7/14.
//  Copyright (c) 2014 Tutorial1. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"


@interface CardGameViewController ()

@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *CardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation CardGameViewController

- (CardMatchingGame *)game{
    if (!_game) _game  = [[CardMatchingGame alloc] initWithCardCount:[self.CardButtons count]
                                                           usingDeck:[self createDeck]];
    return _game;
}


    
- (Deck *)createDeck{

    return [[PlayingCardDeck alloc] init];
}


- (IBAction)touchCardButton:(UIButton *)sender {
    
    NSUInteger chosenButtonIndex = [self.CardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    NSLog(@"touchCardButton%lu",(unsigned long)chosenButtonIndex );
    [self updateUI];
    
    
}

- (void)updateUI{
    for (UIButton *cardButton in self.CardButtons){
        NSUInteger cardButtonIndex = [self.CardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCards:card] forState:UIControlStateNormal];
        
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld",(long)self.game.score];
        
        
    }
    
}

- (NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCards:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}
@end
