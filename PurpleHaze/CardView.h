//
//  CardView.h
//  PurpleHaze
//
//  Created by Johann Kerr on 12/30/14.
//  Copyright (c) 2014 Johann Kerr. All rights reserved.
//

#import <UIKit/UIKit.h>

const CGFloat CardWidth;
const CGFloat CardHeight;

@class Card;



@interface CardView : UIView
@property (nonatomic, strong) Card *card;
@property (nonatomic, weak) NSString *descrip;

-(void)animateDealingWithDelay:(NSTimeInterval)delay;
-(void)animateTurningOver;
-(void)animateSingleCard:(NSTimeInterval)delay;
-(NSString*)loadFront;
-(void)loadBack;
-(NSString*)loadDescription;



@end
