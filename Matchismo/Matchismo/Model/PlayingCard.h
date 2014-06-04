//
//  PlayingCard.h
//  Matchismo
//
//  Created by min guo on 6/4/14.
//  Copyright (c) 2014 CS193p. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
