//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by min guo on 6/9/14.
//  Copyright (c) 2014 CS193p. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

// designated initializer
-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic) NSInteger cardNumber;
@property (nonatomic) NSInteger playCards;
@property (nonatomic) NSString* description;
//-(void)getCardNumber:(NSInteger)newValue;

@end
