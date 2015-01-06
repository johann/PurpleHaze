//
//  ViewController.m
//  PurpleHaze
//
//  Created by Johann Kerr on 12/30/14.
//  Copyright (c) 2014 Johann Kerr. All rights reserved.
//

#import "ViewController.h"
#import "ZLSwipeableView.h"


#import "UIColor+FlatColors.h"
#import "M13BadgeView.h"
#import "Card.h"
#import "Deck.h"
#import "Stack.h"
#import "CardView.h"
//#import "Game.h"
#import "JFMinimalNotification.h"






@interface ViewController ()<JFMinimalNotificationDelegate,ZLSwipeableViewDataSource,
ZLSwipeableViewDelegate>
@property (weak, nonatomic) IBOutlet ZLSwipeableView *swipeableView;
@property (nonatomic, strong) JFMinimalNotification* minimalNotification;
@property (weak, nonatomic) IBOutlet UIView *viewFull;

@property (nonatomic, strong) NSArray *colors;
@property (nonatomic, strong) NSArray *cards;
@property (nonatomic) NSUInteger cardIndex;
@property (nonatomic) NSUInteger colorIndex;
@property (nonatomic, retain) M13BadgeView *badgeView;
@property (nonatomic, weak) NSString *title;
@property (nonatomic, weak) NSString *subtitle;
@property (nonatomic, weak) NSString *image;


@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
       /**
     * Create the notification
     *
     * You can also use the following to each the same result:
     * self.minimalNotification = [[JFMinimalNotification alloc] initWithSuperView:self.view];
     * [self.minimalNotification setTitle:@"My Test Title" withSubTitle:@"My Test Sub-Title"];
     * [self.minimalNotification setStyle:JFMinimalNotificationStyleDefault];
//     */
//    self.minimalNotification = [JFMinimalNotification notificationWithStyle:JFMinimalNotificationStyleError title:self.title subTitle:nil dismissalDelay:0.4 touchHandler:^{
//        [self.minimalNotification dismiss];
//    }];
    
    
    /**
     * Set the delegate
     */
    //self.minimalNotification.delegate = self;
    
    Deck *deck = [[Deck alloc] init];
    [deck shuffle];
    self.deckCards = deck;
    NSLog(@"%u", self.deckCards.draw.suit);
    NSLog(@"%u", self.deckCards.draw.value);
    
    
    
    
    
//    _badgeView = [[M13BadgeView alloc] initWithFrame:CGRectMake(0, 0, 16.0, 16.0)];
//    _badgeView.text = @"";
    UIImageView *bn = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Logo2.png"]];
//    //[bn addSubview:_badgeView];
   self.navigationItem.titleView = bn;
   
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"phbg2.png"]];
    
    self.cardIndex = 0;
        
    self.swipeableView.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)dealloc
{
#ifdef DEBUG
    NSLog(@"dealloc %@", self);
#endif
}
#pragma mark - Game UI

- (CardView *)cardViewForCard:(Card *)card
{
    for (CardView *cardView in self.swipeableView.subviews)
    {
       
            return cardView;
    }
    return nil;
}


- (void)viewDidLayoutSubviews {
    // Required Data Source
    self.swipeableView.dataSource = self;
}

#pragma mark - ZLSwipeableViewDelegate

- (void)swipeableView:(ZLSwipeableView *)swipeableView
         didSwipeLeft:(UIView *)view {
    
    
    if (self.currentCard.suit == SuitDiamonds || self.currentCard.suit == SuitHearts )
    {
    self.minimalNotification = [JFMinimalNotification notificationWithStyle:JFMinimalNotificationStyleError title:@"DRINK!" subTitle:self.title dismissalDelay:0.4 touchHandler:^{
        [self.minimalNotification dismiss];
    }];
    
    self.minimalNotification.delegate = self;
    [self.minimalNotification setRightAccessoryView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:self.image]] animated:YES];
    [self.view addSubview:self.minimalNotification];
   [self.minimalNotification show];
        
    }
    else if (self.currentCard.suit == SuitClubs || self.currentCard.suit == SuitSpades)
    {
        self.minimalNotification = [JFMinimalNotification notificationWithStyle:JFMinimalNotificationStyleError title:@"Safe!" subTitle:self.title dismissalDelay:0.4 touchHandler:^{
            [self.minimalNotification dismiss];
        }];
        
        self.minimalNotification.delegate = self;
        [self.minimalNotification setRightAccessoryView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:self.image]] animated:YES];
        [self.view addSubview:self.minimalNotification];
        [self.minimalNotification show];
        
    }
    else
    {
        
    }
    
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
        didSwipeRight:(UIView *)view {
//    self.minimalNotification = [JFMinimalNotification notificationWithStyle:JFMinimalNotificationStyleError title:@"DRINK!" subTitle:self.title dismissalDelay:0.4 touchHandler:^{
//        [self.minimalNotification dismiss];
//    }];
//    
//    self.minimalNotification.delegate = self;
//    [self.minimalNotification setRightAccessoryView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:self.image]] animated:YES];
//    [self.view addSubview:self.minimalNotification];
//    [self.minimalNotification show];
    
    if (self.currentCard.suit == SuitDiamonds || self.currentCard.suit == SuitHearts )
    {
        self.minimalNotification = [JFMinimalNotification notificationWithStyle:JFMinimalNotificationStyleError title:@"DRINK!" subTitle:self.title dismissalDelay:0.4 touchHandler:^{
            [self.minimalNotification dismiss];
        }];
        
        self.minimalNotification.delegate = self;
        [self.minimalNotification setRightAccessoryView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:self.image]] animated:YES];
        [self.view addSubview:self.minimalNotification];
        [self.minimalNotification show];
        
    }
    else if (self.currentCard.suit == SuitClubs || self.currentCard.suit == SuitSpades)
    {
        self.minimalNotification = [JFMinimalNotification notificationWithStyle:JFMinimalNotificationStyleError title:@"Safe!" subTitle:self.title dismissalDelay:0.4 touchHandler:^{
            [self.minimalNotification dismiss];
        }];
        
        self.minimalNotification.delegate = self;
        [self.minimalNotification setRightAccessoryView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:self.image]] animated:YES];
        [self.view addSubview:self.minimalNotification];
        [self.minimalNotification show];
        
    }
    else
    {
        
    }
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
       didCancelSwipe:(UIView *)view {
    NSLog(@"did cancel swipe");
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
  didStartSwipingView:(UIView *)view
           atLocation:(CGPoint)location {
    NSLog(@"did start swiping at location: x %f, y %f", location.x, location.y);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
          swipingView:(UIView *)view
           atLocation:(CGPoint)location
          translation:(CGPoint)translation {
    NSLog(@"swiping at location: x %f, y %f, translation: x %f, y %f",
          location.x, location.y, translation.x, translation.y);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
    didEndSwipingView:(UIView *)view
           atLocation:(CGPoint)location {
    NSLog(@"did end swiping at location: x %f, y %f", location.x, location.y);
}

- (UIView *)nextViewForSwipeableView:(ZLSwipeableView *)swipeableView {
    if (self.cardIndex < 52) {
        
        CardView *view = [[CardView alloc] initWithFrame:swipeableView.bounds];
        Card* cardchoice = [self.deckCards cardAtIndex:self.cardIndex];
        
        NSLog(@"Card Choice %@", cardchoice);
        view.card = cardchoice;
        NSLog(@"%@", view.card);
        //[view loadFront];
        self.image = view.loadFront;
        self.title = view.loadDescription;
        //self.suitCheck = view.card.suit;
        self.currentCard = view.card;

        
        
        view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BofC"]];
        
        self.cardIndex++;
//        viewMe.loadFront;

        
//        CardView *view = [[CardView alloc] initWithFrame:swipeableView.bounds];
//        Card* cardchoice = [self.deckCards cardAtIndex:self.cardIndex];
//        NSLog(@"Card Choice %@", cardchoice);
//        //view = [self cardViewForCard:[self.deckCards cardAtIndex:self.cardIndex]];
//        NSLog(@"%@", view.card);
//        //[view loadFront];
//        [self.swipeableView addSubview:view];
        
        
        //NSString *file = [self.cards objectAtIndex:self.colorIndex];
        

        //view.backgroundColor = [self colorForName:self.colors[self.colorIndex]];
      //  self.cardIndex++;
        

       return view;
        
       
    }
    return nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIColor *)colorForName:(NSString *)name {
    NSString *sanitizedName =
    [name stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *selectorString =
    [NSString stringWithFormat:@"flat%@Color", sanitizedName];
    Class colorClass = [UIColor class];
    return [colorClass performSelector:NSSelectorFromString(selectorString)];
}


- (IBAction)higherAction:(id)sender {
}

- (IBAction)reloadDeck:(id)sender {
    self.cardIndex = 0;
    
    [self.swipeableView discardAllSwipeableViews];
    [self.swipeableView loadNextSwipeableViewsIfNeeded];
}

- (IBAction)lowerAction:(id)sender {
}
@end
