//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Richard Shin on 4/24/13.
//  Copyright (c) 2013 Richard Shin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardMatchingGame.h"

@interface CardGameViewController : UIViewController

@property (strong, nonatomic) NSString *gameName; // abstract
@property (nonatomic) int numberOfCardsToMatch; // abstract
@property (nonatomic) CGFloat matchBonusMultiplier; // abstract
@property (nonatomic) int mismatchPenalty; // abstract
@property (nonatomic) int flipCost; // abstract

- (void)updateButton:(UIButton *)button withCard:(Card *)card; // abstract
- (void)updateResultLabel:(UILabel *)label withObject:(id)object; // abstract
- (Deck *)createDeck; // abstract
@end
