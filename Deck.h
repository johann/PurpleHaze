//
//  Deck.h
//  PurpleHaze
//
//  Created by Johann Kerr on 12/30/14.
//  Copyright (c) 2014 Johann Kerr. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Card;

@interface Deck : NSObject

- (void)shuffle;
- (Card *)draw;
- (int)cardsRemaining;

- (void)addCardToTop:(Card *)card;
- (void)addCardToBottom:(Card *)card;
- (NSUInteger)cardCount;
- (Card *)cardAtIndex:(NSUInteger)index;
- (Card *)topmostCard;
- (Card *)secondCard;
- (void)removeTopmostCard;
- (void)removeAllCards;
- (NSArray *)array;
- (void)addCardsFromArray:(NSArray *)array;



@end
