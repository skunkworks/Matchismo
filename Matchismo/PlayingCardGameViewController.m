//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by Richard Shin on 5/7/13.
//  Copyright (c) 2013 Richard Shin. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()
@end

@implementation PlayingCardGameViewController

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}
- (NSString *)gameName {
    return @"Playing Card Game";
}
- (int)numberOfCardsToMatch {
    return 2;
}
-(CGFloat)matchBonusMultiplier {
    return 2;
}
- (int)mismatchPenalty {
    return 2;
}
- (int)flipCost {
    return 1;
}



// Implements/overrides the superclass method
- (void)updateButton:(UIButton *)cardButton withCard:(Card *)card {
    PlayingCard *playingCard = (PlayingCard *)card;
    
    if (playingCard) {
        [cardButton setTitle:playingCard.contents forState:UIControlStateSelected];
        [cardButton setTitle:playingCard.contents forState:UIControlStateSelected|UIControlStateDisabled];
        [cardButton setImage:[[self class] cardBackImage] forState:UIControlStateNormal];
        [cardButton setImage:[[self class] cardFrontImage] forState:UIControlStateSelected];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable ? .3 : 1;
    }
}

- (void)updateResultLabel:(UILabel *)label withObject:(id)object {
    if (label) {
        if (!object) label.text = @"";
        else if ([object isKindOfClass:[NSString class]]) {
            label.text = object;
        }
    }
}

+ (UIImage *)cardBackImage {
    static UIImage *image = nil;
    if (!image) image = [UIImage imageNamed:@"cardback.png"];
    return image;
}

+ (UIImage *)cardFrontImage {
    static UIImage *image = nil;
    if (!image) image = [[UIImage alloc] init];
    return image;
}

@end