//
//  SetCard.m
//  Matchismo
//
//  Created by Richard Shin on 5/6/13.
//  Copyright (c) 2013 Richard Shin. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

- (NSString *)contents {
    return [@"" stringByPaddingToLength:self.number
                             withString:self.symbol
                        startingAtIndex:0];
}

@synthesize symbol = _symbol;

- (NSString *)symbol {
    if (!_symbol) _symbol = @"?";
    return _symbol;
}

- (void)setSymbol:(NSString *)symbol {
    if ([[SetCard validSymbols] containsObject:symbol]) {
        _symbol = symbol;
    }
}

@synthesize shade = _shade;

- (NSString *)shade {
    if (!_shade) _shade = @"?";
    return _shade;
}

- (void)setShade:(NSString *)shade {
    if ([[SetCard validShades] containsObject:shade]) {
        _shade = shade;
    }
}

@synthesize color = _color;

- (NSString *)color {
    if (!_color) _color = @"?";
    return _color;
}

- (void)setColor:(NSString *)color {
    if ([[SetCard validColors] containsObject:color]) {
        _color = color;
    }
}

- (void)setNumber:(NSUInteger)number {
    if (number <= [SetCard maxNumber]) {
        _number = number;
    }
}

- (int)match:(NSArray *)otherCards
{
    NSIndexSet *indexSet = [otherCards indexesOfObjectsPassingTest:
     ^BOOL(id obj, NSUInteger idx, BOOL *stop) { return [((SetCard *)obj).symbol isEqualToString:self.symbol]; }];
    if ([indexSet count] > 0 && [indexSet count] < [otherCards count]) return 0;
    indexSet = [otherCards indexesOfObjectsPassingTest:
                 ^BOOL(id obj, NSUInteger idx, BOOL *stop) { return [((SetCard *)obj).shade isEqualToString:self.shade]; }];
    if ([indexSet count] > 0 && [indexSet count] < [otherCards count]) return 0;
    indexSet = [otherCards indexesOfObjectsPassingTest:
                ^BOOL(id obj, NSUInteger idx, BOOL *stop) { return [((SetCard *)obj).color isEqualToString:self.color]; }];
    if ([indexSet count] > 0 && [indexSet count] < [otherCards count]) return 0;
    indexSet = [otherCards indexesOfObjectsPassingTest:
                ^BOOL(id obj, NSUInteger idx, BOOL *stop) { return ((SetCard *)obj).number == self.number; }];
    if ([indexSet count] > 0 && [indexSet count] < [otherCards count]) return 0;

    return 1;
}

+ (NSArray *)validSymbols {
    return @[@"▲", @"●", @"■"];
}

+ (NSArray *)validShades {
    return @[@"solid", @"shaded", @"open"];
}

+ (NSArray *)validColors {
    return @[@"red", @"green", @"purple"];
}

+ (NSUInteger)maxNumber {
    return 3;
}

@end
