//
//  ViewController.m
//  TicTacToe
//
//  Created by Sean's Macboo Pro on 7/16/15.
//  Copyright (c) 2015 seanallen.co. All rights reserved.
//

#import "GameViewController.h"
#import "GameLogic.h"

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
@property (weak, nonatomic) IBOutlet UILabel *timeRemaining;
@property int timerDisplay;
@property NSTimer *timer;
@property NSTimer *computerTurnTimer;
@property NSArray *labelArrays;
typedef NS_ENUM(int, LabelIndex) {
    zero,
    one,
    two,
    three,
    four,
    five,
    six,
    seven,
    eight
    
};


@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ticTacToeGameLogic = [[GameLogic alloc] init];
    self.ticTacToeGameLogic.ticTacToeBoard = [[NSMutableArray alloc] init];
    [self.ticTacToeGameLogic newBoard];
    
    self.currentPlayer = @"player";
    
    self.topLeftLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.topLeftLabel.layer.borderWidth = 0.25;
    self.topMiddleLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.topMiddleLabel.layer.borderWidth = 0.25;
    self.topRightLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.topRightLabel.layer.borderWidth = 0.25;
    self.middleLeftLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.middleLeftLabel.layer.borderWidth = 0.25;
    self.middleMiddleLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.middleMiddleLabel.layer.borderWidth = 0.25;
    self.middleRightLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.middleRightLabel.layer.borderWidth = 0.25;
    self.bottomLeftLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.bottomLeftLabel.layer.borderWidth = 0.25;
    self.bottomMiddleLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.bottomMiddleLabel.layer.borderWidth = 0.25;
    self.bottomRightLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.bottomRightLabel.layer.borderWidth = 0.25;
    
    self.playerLabel.text = @"X";
    [self resetStartTimer];
    
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

-(enum LabelIndex)getLabelIndex:(UILabel *)label {
    enum LabelIndex labelIndex;
    if (label == self.topLeftLabel) {
        labelIndex = zero;
    } else if (label == self.topMiddleLabel) {
        labelIndex = one;
    } else if (label == self.topRightLabel) {
        labelIndex = two;
    } else if (label == self.middleLeftLabel) {
        labelIndex = three;
    } else if (label == self.middleMiddleLabel) {
        labelIndex = four;
    } else if (label == self.middleRightLabel) {
        labelIndex = five;
    } else if (label == self.bottomLeftLabel) {
        labelIndex = six;
    } else if (label == self.bottomMiddleLabel) {
        labelIndex = seven;
    } else if (label == self.bottomRightLabel) {
        labelIndex = eight;
    }
    
    return labelIndex;
}

#pragma mark -timers
- (void) startTimer {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(onTick) userInfo:nil repeats: YES];
    }

- (void) onTick {
    if (self.timerDisplay > 0) {
        self.timerDisplay -=1;
        self.timeRemaining.text = [NSString stringWithFormat:@"It's Your Turn! %i", self.timerDisplay];
    } else {
        [self.timer invalidate];
        UIAlertController *lostTurnAlert = [UIAlertController alertControllerWithTitle:@"Too Slow!" message:[NSString stringWithFormat:@"You lost your turn"] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:nil];
            [self computerTurnDelayTimer];
            
        }];
        [lostTurnAlert addAction:okAction];
        [self presentViewController: lostTurnAlert animated:YES completion:nil];
        self.currentPlayer = [self currentPlayerChanged];
        self.playerLabel.text = [self playerLabelText];
    }
}

-(void) resetStartTimer {
    [self startTimer];
    self.timeRemaining.hidden = NO;
    self.timeRemaining.text =@"It's Your Turn! 10";
    self.timerDisplay = 10;
}


#pragma mark -Game is Over Methods
-(void) thereIsAWinner {
        self.timeRemaining.hidden = YES;
        NSString *whoWonThisGame;
        [self.timer invalidate];
        [self.computerTurnTimer invalidate];
        
        if ([[self.ticTacToeGameLogic whoWonTicTacToe:self.ticTacToeGameLogic.ticTacToeBoard] isEqualToNumber:[NSNumber numberWithInt:-1]]) {
            whoWonThisGame = @"X";
        } else {
            whoWonThisGame = @"O";
        }
        
        UIAlertController *resultAlert = [UIAlertController alertControllerWithTitle:@"Game Result" message:[NSString stringWithFormat:@"Congratulations player %@", whoWonThisGame] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *newGameAction = [UIAlertAction actionWithTitle:@"Start New Game" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:nil];
            self.timeRemaining.hidden = NO;
            [self clearGameBoard];
        }];
        [resultAlert addAction:newGameAction];
        [self presentViewController: resultAlert animated:YES completion:nil];
}

-(void) thereisATie {
        self.timeRemaining.hidden = YES;
        [self.timer invalidate];
        [self.computerTurnTimer invalidate];
        
        UIAlertController *resultAlert = [UIAlertController alertControllerWithTitle:@"Game Result" message:[NSString stringWithFormat:@"It's a tie :("] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *newGameAction = [UIAlertAction actionWithTitle:@"Start New Game" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:nil];
            [self clearGameBoard];
            
        }];
        [resultAlert addAction:newGameAction];
        [self presentViewController: resultAlert animated:YES completion:nil];
}


-(void) clearGameBoard {
    
//    for (int i=0; i<9; i++) {
//        (UILabel *)label = [self.labelArrays objectAtIndex:i];
//        label.text = nil;
//        
//    }
    self.topRightLabel.text = nil;
    self.topMiddleLabel.text = nil;
    self.topLeftLabel.text = nil;
    self.middleRightLabel.text = nil;
    self.middleLeftLabel.text = nil;
    self.middleMiddleLabel.text = nil;
    self.bottomLeftLabel.text = nil;
    self.bottomMiddleLabel.text = nil;
    self.bottomRightLabel.text = nil;

    [self.ticTacToeGameLogic clearBoard];
    self.playerLabel.text = @"X";
    self.currentPlayer = @"player";
    [self resetStartTimer];
    
}

#pragma mark Setting Label Text
-(NSString *) playerLabelText {
    if ([self.currentPlayer isEqualToString:@"player"]) {
        return @"X";
    } else {
        return @"O";
    }
}

-(NSString *) currentPlayerChanged {
    if ([self.currentPlayer isEqualToString:@"player"]) {
        return @"computer";
    } else {
        return @"player";
    }
}

#pragma mark -Player & Computer Turns
-(void) playerTurn: (UILabel *) playerClickLabel {
    
    int index = [self getLabelIndex:playerClickLabel];
    [self.ticTacToeGameLogic upDateBoard:@"player" int:index];
    
    
    if (!([self.ticTacToeGameLogic isBoxEmpty:self.ticTacToeGameLogic.ticTacToeBoard int:index])) {
      
        playerClickLabel.text =@"X";
        playerClickLabel.textColor = [UIColor blueColor];
        self.currentPlayer = [self currentPlayerChanged];
        self.playerLabel.text = [self playerLabelText];
        
        if (!([self.ticTacToeGameLogic whoWonTicTacToe:self.ticTacToeGameLogic.ticTacToeBoard] == nil)) {
            [self thereIsAWinner];
        } else if ([self.ticTacToeGameLogic isThereATie:self.ticTacToeGameLogic.ticTacToeBoard]) {
            [self thereisATie];
        } else {
            [self.timer invalidate];
            self.timeRemaining.hidden = YES;
        
            [self computerTurnDelayTimer];
        }
        
    } else {
        return;
    }
}

-(void) computerTurnDelayTimer {
     self.computerTurnTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(computerTurn) userInfo:nil repeats: NO];
}

-(void) computerTurn {
    
    NSMutableArray *emptyLabelsArray = [[NSMutableArray alloc] initWithCapacity:self.labelArrays.count];
    int whichEmptyLabel = arc4random_uniform(emptyLabelsArray.count);
    UILabel *labelComputerChose;
    
    for (int i =0; i < self.labelArrays.count; i++) {
        if ([self.ticTacToeGameLogic isBoxEmpty:self.ticTacToeGameLogic.ticTacToeBoard int:i]) {
            [emptyLabelsArray addObject:[self.labelArrays objectAtIndex:i]];
        }
    }
    
    labelComputerChose = [emptyLabelsArray objectAtIndex:whichEmptyLabel];
    
    [self.ticTacToeGameLogic upDateBoard:@"computer" int:[self getLabelIndex:labelComputerChose]];
    [self settingComputerText: labelComputerChose];
    if (!([self.ticTacToeGameLogic whoWonTicTacToe:self.ticTacToeGameLogic.ticTacToeBoard] == nil)) {
        [self thereIsAWinner];
    } else if ([self.ticTacToeGameLogic isThereATie:self.ticTacToeGameLogic.ticTacToeBoard]) {
        [self thereisATie];
    } else {
        
        [self resetStartTimer];
        self.currentPlayer = [self currentPlayerChanged];
        self.playerLabel.text = [self playerLabelText];
    }
}

-(void) settingComputerText: (UILabel *)label {
    label.text = @"O";
    label.textColor = [UIColor redColor];


}


#pragma mark -gesture Methods
- (IBAction)panHandler:(UIPanGestureRecognizer *)gesture {
    [gesture setMinimumNumberOfTouches:1];
    [gesture setMaximumNumberOfTouches:1];
    
    if ([self.currentPlayer isEqualToString:@"player"]) {
        
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
                self.playerLabel.center = originalPlayerLabelPoint;
            }
        }
    } else {
        return;
    }
}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)sender {
    
    if ([self.currentPlayer isEqualToString:@"player"]) {
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
