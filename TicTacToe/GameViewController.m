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
@property NSString *currentPlayerSymbol;
@property NSString *whoWon;
@property (weak, nonatomic) IBOutlet UILabel *timeRemaining;
@property int timerDisplay;
@property NSTimer *timer;
@property int currentTurn;
@property NSTimer *computerTurnTimer;
@property NSArray *labelArrays;


@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentPlayerSymbol = @"X";
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
    self.currentTurn = 1;
    
    self.labelArrays = [NSArray arrayWithObjects: self.topLeftLabel, self.topMiddleLabel, self.topRightLabel, self.middleLeftLabel, self.middleMiddleLabel, self.middleRightLabel, self.bottomLeftLabel, self. bottomMiddleLabel, self. bottomRightLabel, nil];
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
            [self computerTurnDelayTimer];
            
        }];
        [lostTurnAlert addAction:okAction];
        [self presentViewController: lostTurnAlert animated:YES completion:nil];
        self.currentPlayerSymbol = [self currentPlayerMark];
        self.playerLabel.text = self.currentPlayerSymbol;
    }
}


#pragma mark -Game Logic Methods

-(NSString *) whoWonTicTacToe {
    NSString *whoWon;
    
   
    
    if ([self isTheLineWinningCombinationForLabels:self.topRightLabel Label:self.topMiddleLabel Label:self.topLeftLabel]){
        whoWon = self.topRightLabel.text;
        
    } else if ([self isTheLineWinningCombinationForLabels:self.topLeftLabel Label:self.middleLeftLabel Label:self.bottomLeftLabel]) {
        whoWon = self.topLeftLabel.text;
        
    } else if ([self isTheLineWinningCombinationForLabels:self.topLeftLabel Label:self.middleMiddleLabel Label:self.bottomRightLabel]) {
        whoWon = self.topLeftLabel.text;
        
    } else if ([self isTheLineWinningCombinationForLabels:self.topMiddleLabel Label:self.middleMiddleLabel Label:self.bottomMiddleLabel]) {
        whoWon = self.topMiddleLabel.text;
        
    } else if ([self isTheLineWinningCombinationForLabels:self.topRightLabel Label:self.middleRightLabel Label:self.bottomRightLabel]) {
        whoWon = self.topRightLabel.text;
        
    } else if ([self isTheLineWinningCombinationForLabels:self.topRightLabel Label:self.middleMiddleLabel Label:self.bottomLeftLabel]) {
        whoWon = self.topRightLabel.text;
        
    } else if ([self isTheLineWinningCombinationForLabels:self.middleLeftLabel Label:self.middleMiddleLabel Label:self.middleRightLabel]) {
        whoWon = self.middleLeftLabel.text;
        
    } else if ([self isTheLineWinningCombinationForLabels:self.bottomLeftLabel Label:self.bottomMiddleLabel Label:self.bottomRightLabel]) {
        whoWon = self.bottomLeftLabel.text;
    } else {
        whoWon = nil;
    }
    
    return whoWon;
}

-(void) thereIsAWinner {

    if ([self whoWonTicTacToe] == nil) {
        return;
    } else {
        self.timeRemaining.hidden = YES;
        
        
        
        UIAlertController *resultAlert = [UIAlertController alertControllerWithTitle:@"Game Result" message:[NSString stringWithFormat:@"Congratulations player %@", [self whoWonTicTacToe]] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *newGameAction = [UIAlertAction actionWithTitle:@"Start New Game" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:nil];
            self.timeRemaining.hidden = NO;
            [self clearGameBoard];
        }];
        [resultAlert addAction:newGameAction];
        [self presentViewController: resultAlert animated:YES completion:nil];
        }
    
    
}


-(BOOL) isTheLineWinningCombinationForLabels: (UILabel *)firstLabel Label: (UILabel *)secondLabel  Label: (UILabel *)thirdLabel   {
  

    if ([firstLabel.text isEqualToString:secondLabel.text] && [secondLabel.text isEqualToString:thirdLabel.text] && !([self isLabelEmpty:firstLabel])) {
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
    self.currentTurn = 1;
    self.currentPlayerSymbol = @"X";
    

    
}

-(NSString *) currentPlayerMark {
    if ([self.currentPlayerSymbol isEqualToString:@"X"]) {
        return @"O";
    } else {
        return @"X";
    }
}

-(NSString *) currentPlayerLabelMark {
    if ([self.currentPlayerSymbol isEqualToString:@"X"]) {
        return @"X";
    } else {
        return @"O";
    }
}



-(void) playerTurn: (UILabel *) playerClickLabel {
    if ([self isLabelEmpty:playerClickLabel]) {
      
        playerClickLabel.text =@"X";
        playerClickLabel.textColor = [UIColor blueColor];
        
        self.currentPlayerSymbol = [self currentPlayerMark];
        self.playerLabel.text = [self currentPlayerLabelMark];
        [self thereIsAWinner];
        [self.timer invalidate];
        self.timeRemaining.hidden = YES;
        [self checkForTie];
//        [self computerTurnDelayTimer];
        
        if (self.currentTurn == 9 || !([self whoWonTicTacToe] == nil)) {
            [self.computerTurnTimer invalidate];
        } else {
            [self computerTurnDelayTimer];
        }
      
        
        
    } else {
        return;
    }
    self.currentTurn += 1;
    
   
    
}

-(void) computerTurnDelayTimer {
     self.computerTurnTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(computerTurn) userInfo:nil repeats: NO];
}

-(void) computerTurn {
    
    NSMutableArray *emptyLabelsArray = [[NSMutableArray alloc] initWithCapacity:self.labelArrays.count];
    int whichEmptyLabel = arc4random_uniform(9 - self.currentTurn);
    
    for (int i =0; i < self.labelArrays.count; i++) {
        if ([self isLabelEmpty:[self.labelArrays objectAtIndex:i]]) {
            [emptyLabelsArray addObject:[self.labelArrays objectAtIndex:i]];
        }
    }
    
    [self settingComputerText: [emptyLabelsArray objectAtIndex:whichEmptyLabel]];
    
    [self startTimer];
    [self thereIsAWinner];
    self.timeRemaining.hidden = NO;
    [self checkForTie];
    self.currentTurn += 1;
    self.timeRemaining.text = @"Time Remaining: 10";
    self.timerDisplay = 10;
    self.currentPlayerSymbol = [self currentPlayerMark];
    self.playerLabel.text = [self currentPlayerLabelMark];
 
    if (self.currentTurn == 9 || !([self whoWonTicTacToe] == nil)) {
        [self.computerTurnTimer invalidate];
        [self.timer invalidate];
        self.timeRemaining.hidden = YES;
        
    }
   
    

}

-(void) settingComputerText: (UILabel *)label {
    label.text = @"O";
    label.textColor = [UIColor blueColor];

}

-(void) checkForTie {
    if ((self.currentTurn == 9) && !([self whoWonTicTacToe])) {
        self.timeRemaining.hidden = YES;
        UIAlertController *resultAlert = [UIAlertController alertControllerWithTitle:@"Game Result" message:[NSString stringWithFormat:@"It's a tie :("] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *newGameAction = [UIAlertAction actionWithTitle:@"Start New Game" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:nil];
            self.timeRemaining.hidden = NO;
            [self clearGameBoard];
            
        }];
        [resultAlert addAction:newGameAction];
        [self presentViewController: resultAlert animated:YES completion:nil];
        
    }
}





#pragma mark -gesture Methods

- (IBAction)panHandler:(UIPanGestureRecognizer *)gesture {
    [gesture setMinimumNumberOfTouches:1];
    [gesture setMaximumNumberOfTouches:1];
    
    if ([self.currentPlayerSymbol isEqualToString:@"X"]) {
    
        
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
    } else {
        return;
    }
}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)sender {
    
    if ([self.currentPlayerSymbol isEqualToString:@"X"]) {
        CGPoint tappedPoint = [sender locationInView:self.view];
        UILabel *labelPressed = [self findLabelUsingPoint:tappedPoint];
        
        if (!([self findLabelUsingPoint:tappedPoint] == nil)) {
            [self playerTurn:labelPressed];
        
           

        
        } else {
            return;
        }
    } else {
        return;
    }
    
    
    
}
@end
