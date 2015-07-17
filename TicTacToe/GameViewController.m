//
//  ViewController.m
//  TicTacToe
//
//  Created by Sean's Macboo Pro on 7/16/15.
//  Copyright (c) 2015 seanallen.co. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *topLeftLabel;
@property (weak, nonatomic) IBOutlet UILabel *topMiddleLabel;
@property (weak, nonatomic) IBOutlet UILabel *topRightLabel;
@property (weak, nonatomic) IBOutlet UILabel *middleLeftLabel;
@property (weak, nonatomic) IBOutlet UILabel *middleMiddleLabel;
@property (weak, nonatomic) IBOutlet UILabel *middleRightLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomLeftLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomMiddleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomRightLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerLabel;
@property NSString *currentPlayer;
@property NSString *whoWon;
@property (weak, nonatomic) IBOutlet UILabel *timeRemaining;
@property int timerDisplay;
@property NSTimer *timer;


@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentPlayer = @"X";
    self.whoWon = @"No one has won this game";
    
    self.topLeftLabel.layer.borderColor = [UIColor grayColor].CGColor;
    self.topLeftLabel.layer.borderWidth = 3.0;
    self.topMiddleLabel.layer.borderColor = [UIColor grayColor].CGColor;
    self.topMiddleLabel.layer.borderWidth = 3.0;
    self.topRightLabel.layer.borderColor = [UIColor grayColor].CGColor;
    self.topRightLabel.layer.borderWidth = 3.0;
    self.middleLeftLabel.layer.borderColor = [UIColor grayColor].CGColor;
    self.middleLeftLabel.layer.borderWidth = 3.0;
    self.middleMiddleLabel.layer.borderColor = [UIColor grayColor].CGColor;
    self.middleMiddleLabel.layer.borderWidth = 3.0;
    self.middleRightLabel.layer.borderColor = [UIColor grayColor].CGColor;
    self.middleRightLabel.layer.borderWidth = 3.0;
    self.bottomLeftLabel.layer.borderColor = [UIColor grayColor].CGColor;
    self.bottomLeftLabel.layer.borderWidth = 3.0;
    self.bottomMiddleLabel.layer.borderColor = [UIColor grayColor].CGColor;
    self.bottomMiddleLabel.layer.borderWidth = 3.0;
    self.bottomRightLabel.layer.borderColor = [UIColor grayColor].CGColor;
    self.bottomRightLabel.layer.borderWidth = 3.0;
    
    self.playerLabel.text = @"X";
    self.timerDisplay = 10;
    self.timeRemaining.text = @"Time Remaining: 10";
    [self startTimer];

}

#pragma mark -Label Methods

- (UILabel *) findLabelUsingPoint:(CGPoint) userTappedCGPoint {

    UILabel *selectedLabel = nil;

    if (CGRectContainsPoint(self.topLeftLabel.frame, userTappedCGPoint)) {

        selectedLabel = self.topLeftLabel;
    } else if (CGRectContainsPoint(self.topMiddleLabel.frame, userTappedCGPoint)) {

        selectedLabel = self.topMiddleLabel;
    } else if (CGRectContainsPoint(self.topRightLabel.frame, userTappedCGPoint)) {

       selectedLabel = self.topRightLabel;
    } else if (CGRectContainsPoint(self.middleLeftLabel.frame, userTappedCGPoint)) {

        selectedLabel = self.middleLeftLabel;
    } else if (CGRectContainsPoint(self.middleMiddleLabel.frame, userTappedCGPoint)) {

        selectedLabel = self.middleMiddleLabel;
    } else if (CGRectContainsPoint(self.middleRightLabel.frame, userTappedCGPoint)) {

        selectedLabel = self.middleRightLabel;
    } else if (CGRectContainsPoint(self.bottomLeftLabel.frame, userTappedCGPoint)) {

        selectedLabel = self.bottomLeftLabel;
    } else if (CGRectContainsPoint(self.bottomMiddleLabel.frame, userTappedCGPoint)) {

        selectedLabel = self.bottomMiddleLabel;
    } else if (CGRectContainsPoint(self.bottomRightLabel.frame, userTappedCGPoint)) {

        selectedLabel = self.bottomRightLabel;
    } else {
        selectedLabel = nil;
    }

    return selectedLabel;

}

- (void) startTimer {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(onTick) userInfo:nil repeats: YES];
    }

- (void) onTick {
    if (self.timerDisplay > 0) {
        self.timerDisplay -=1;
        self.timeRemaining.text = [NSString stringWithFormat:@"Time Remaining: %i", self.timerDisplay];
    } else {
        [self.timer invalidate];
        UIAlertController *lostTurnAlert = [UIAlertController alertControllerWithTitle:@"Too Slow!" message:[NSString stringWithFormat:@"You lost your turn"] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:nil];
            self.timeRemaining.text = @"Time Remainging: 10";
            self.timerDisplay = 10;
            [self startTimer];
            
        }];
        [lostTurnAlert addAction:okAction];
        [self presentViewController: lostTurnAlert animated:YES completion:nil];
        self.currentPlayer = [self currentPlayerMark];
        self.playerLabel.text = self.currentPlayer;
        
        
    }
}


#pragma mark -Game Logic Methods

-(BOOL) didThePlayerWin {
    
    if (([self isTheLineWinningCombinationForLabels:self.topRightLabel Label:self.topMiddleLabel Label:self.topLeftLabel] && ![self isLabelEmpty:self.topLeftLabel]) ||
        ([self isTheLineWinningCombinationForLabels:self.topLeftLabel Label:self.middleLeftLabel Label:self.bottomLeftLabel] && ![self isLabelEmpty:self.topLeftLabel]) ||
        ([self isTheLineWinningCombinationForLabels:self.topLeftLabel Label:self.middleMiddleLabel Label:self.bottomRightLabel] && ![self isLabelEmpty:self.topLeftLabel]) ||
        ([self isTheLineWinningCombinationForLabels:self.topMiddleLabel Label:self.middleMiddleLabel Label:self.bottomMiddleLabel] && ![self isLabelEmpty:self.topMiddleLabel]) ||
        ([self isTheLineWinningCombinationForLabels:self.topRightLabel Label:self.middleRightLabel Label:self.bottomRightLabel] && ![self isLabelEmpty:self.topRightLabel]) ||
        ([self isTheLineWinningCombinationForLabels:self.topRightLabel Label:self.middleMiddleLabel Label:self.bottomLeftLabel] && ![self isLabelEmpty:self.bottomLeftLabel]) ||
        ([self isTheLineWinningCombinationForLabels:self.middleLeftLabel Label:self.middleMiddleLabel Label:self.middleRightLabel] && ![self isLabelEmpty:self.middleMiddleLabel]) ||
        ([self isTheLineWinningCombinationForLabels:self.bottomLeftLabel Label:self.bottomMiddleLabel Label:self.bottomRightLabel] && ![self isLabelEmpty:self.bottomLeftLabel])) {
            return YES;
        
        } else {
            return NO;
        }
    
    
}

-(BOOL) isTheLineWinningCombinationForLabels: (UILabel *)firstLabel Label: (UILabel *)secondLabel  Label: (UILabel *)thirdLabel   {
    if ([firstLabel.text isEqualToString:secondLabel.text] && [secondLabel.text isEqualToString:thirdLabel.text]) {
        return YES;
    } else {
        return NO;
    }
    
}

-(BOOL) isLabelEmpty:(UILabel *) currentLabel {
    if ([currentLabel.text isEqualToString:@"X"] || [currentLabel.text isEqualToString:@"O"]) {
        return NO;
    } else {
        return YES;
    }
}

-(void) clearGameBoard {
    self.topRightLabel.text = nil;
    self.topMiddleLabel.text = nil;
    self.topLeftLabel.text = nil;
    self.middleRightLabel.text = nil;
    self.middleLeftLabel.text = nil;
    self.middleMiddleLabel.text = nil;
    self.bottomLeftLabel.text = nil;
    self.bottomMiddleLabel.text = nil;
    self.bottomRightLabel.text = nil;
    self.playerLabel.text = @"X";
    [self startTimer];
    self.timeRemaining.text =@"Time Remaining: 10";
    self.timerDisplay = 10;

    
}

-(NSString *) currentPlayerMark {
    if ([self.currentPlayer isEqualToString:@"X"]) {
        return @"O";
    } else {
        return @"X";
    }
}

-(NSString *) currentPlayerLabelMark {
    if ([self.currentPlayer isEqualToString:@"X"]) {
        return @"X";
    } else {
        return @"O";
    }
}

-(void) whoWonTicTacToe {
    

    if ([self didThePlayerWin]) {
        self.timeRemaining.hidden = YES;
        NSString *whichPlayerWon = nil;
        
        if ([self.currentPlayer isEqualToString:@"X"]) {
            whichPlayerWon = @"O";
            
        } else {
            whichPlayerWon =@"X";
        }
        
        
        
        UIAlertController *resultAlert = [UIAlertController alertControllerWithTitle:@"Game Result" message:[NSString stringWithFormat:@"Congratulations player %@", whichPlayerWon] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *newGameAction = [UIAlertAction actionWithTitle:@"Start New Game" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:nil];
            self.timeRemaining.hidden = NO;
            [self clearGameBoard];
        }];
        [resultAlert addAction:newGameAction];
        [self presentViewController: resultAlert animated:YES completion:nil];
    }
}

-(void) playerTurn: (UILabel *) playerClickLabel {
    if ([self isLabelEmpty:playerClickLabel]) {
        if ([self.currentPlayer isEqualToString:@"X"]) {
            playerClickLabel.text =@"X";
            playerClickLabel.textColor = [UIColor blueColor];
        } else {
            playerClickLabel.text =@"O";
            playerClickLabel.textColor = [UIColor redColor];
        }
        self.currentPlayer = [self currentPlayerMark];
        self.playerLabel.text = [self currentPlayerLabelMark];
        [self whoWonTicTacToe];
        [self.timer invalidate];
        self.timeRemaining.text = @"Time Remaining: 10";
        self.timerDisplay = 10;
        [self startTimer];
    } else {
        return;
    }
}


    



#pragma mark -gesture Methods

- (IBAction)panHandler:(UIPanGestureRecognizer *)gesture {
    [gesture setMinimumNumberOfTouches:1];
    [gesture setMaximumNumberOfTouches:1];
    
    CGPoint originalPlayerLabelPoint = self.playerLabel.center;
    
    CGPoint currentPanPoint = [gesture locationInView:self.view];
    
    if (CGRectContainsPoint(self.playerLabel.frame, currentPanPoint)) {
        self.playerLabel.center = currentPanPoint;
    }
    
    if (gesture.state == UIGestureRecognizerStateEnded) {
        UILabel *currentPannedToLabel = nil;
        currentPannedToLabel = [self findLabelUsingPoint:currentPanPoint];
        
        if (currentPannedToLabel == nil) {
            self.playerLabel.center = originalPlayerLabelPoint;
        } else {
            [self playerTurn:currentPannedToLabel];
        }


        
    }
}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)sender {
    CGPoint tappedPoint = [sender locationInView:self.view];
    UILabel *labelPressed = [self findLabelUsingPoint:tappedPoint];
    
    if (!([self findLabelUsingPoint:tappedPoint] == nil)) {
        [self playerTurn:labelPressed];
    
       

    
    } else {
        return;
    }
    
    
    
}
@end
