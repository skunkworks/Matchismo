//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Richard Shin on 4/27/13.
//  Copyright (c) 2013 Richard Shin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

// Designated initializer
- (id)initWithCardCount:(NSUInteger)count
              usingDeck:(Deck *)deck;

- (void)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (readonly, nonatomic) int score;
@property (readonly, nonatomic) NSString *result;
@property (readonly, nonatomic) NSArray *cardsFromResult; // of Card
@property (strong, nonatomic) NSString *gameName;
@property (nonatomic) int numberOfCardsToMatch;
@property (nonatomic) CGFloat matchBonusMultiplier;
@property (nonatomic) int mismatchPenalty;
@property (nonatomic) int flipCost;

@end
