//
//  ViewController.h
//  PurpleHaze
//
//  Created by Johann Kerr on 12/30/14.
//  Copyright (c) 2014 Johann Kerr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@class ViewController;
@class Card;
@class Stack;
@class Deck;

@interface ViewController : UIViewController



@property (nonatomic, strong) Deck *deckCards;
@property (nonatomic, strong) Card *currentCard;

- (IBAction)higherAction:(id)sender;
- (IBAction)reloadDeck:(id)sender;
- (IBAction)lowerAction:(id)sender;



@end

