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

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;

@end
