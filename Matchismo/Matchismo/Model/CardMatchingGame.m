//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by min guo on 6/9/14.
//  Copyright (c) 2014 CS193p. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card
@end


@implementation CardMatchingGame

- (NSInteger)cardNumber {
    
    if (!_cardNumber) _cardNumber = 1;
    return _cardNumber;
}


- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}


-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self){
        for (int i = 0; i < count; i++){
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else{
                self = nil;
                break;
            }
        }
    }
    

    return self;
}


static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

-(void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            //match against another card
            self.description = card.contents;
            NSMutableArray * otherCards = [[NSMutableArray alloc] init];
            NSMutableArray * allCards = [[NSMutableArray alloc] init];
            [allCards addObject:card];
            for (Card *otherCard in self.cards){
                if (otherCard.isChosen && !otherCard.isMatched){
                    [otherCards addObject:otherCard];
                    [allCards addObject:otherCard];
                }
                if ([otherCards count] == self.cardNumber){
                    int matchScore = [card match:otherCards];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        for (Card *otherCard in otherCards){
                        otherCard.matched = YES;
                        self.description = [self describeMatchingResult:allCards :matchScore];
                        }
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        for (Card *otherCard in otherCards){
                        otherCard.chosen = NO;
                        self.description = [self describeMismatchResult:allCards :MISMATCH_PENALTY];
                        }
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.Chosen = YES;
        }
    }
}

-(NSString *)describeMatchingResult:(NSMutableArray *)cards :(NSInteger)matchScore
{
    NSString *contentString =[[NSString alloc] init];
    NSString *cardMatchDescription = [[NSString alloc] init];
    
    
    for ( Card *card in cards)
    {
        contentString = [contentString stringByAppendingString:card.contents];
        
    }
        cardMatchDescription = [NSString stringWithFormat:@"Matched %@ for %d point.", contentString, matchScore];
    return cardMatchDescription;
}

-(NSString *)describeMismatchResult:(NSMutableArray *)cards :(NSInteger)MISMATCH_PENALTY
{
    NSString *contentString =[[NSString alloc] init];
    NSString *cardMatchDescription = [[NSString alloc] init];
    
    
    for ( Card *card in cards)
    {
        contentString = [contentString stringByAppendingString:card.contents];
        
    }
    cardMatchDescription = [NSString stringWithFormat:@"%@ don't match! %d point penalty!", contentString, MISMATCH_PENALTY];
    return cardMatchDescription;
}


-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

- (instancetype)init
{
    return nil;
}
@end
