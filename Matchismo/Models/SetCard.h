//
//  SetCard.h
//  Matchismo
//
//  Created by Richard Shin on 5/6/13.
//  Copyright (c) 2013 Richard Shin. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (nonatomic) NSUInteger number;
@property (strong, nonatomic) NSString *symbol;
@property (strong, nonatomic) NSString *shade;
@property (strong, nonatomic) NSString *color;

+ (NSArray *)validSymbols;
+ (NSArray *)validShades;
+ (NSArray *)validColors;
+ (NSUInteger)maxNumber;

@end
