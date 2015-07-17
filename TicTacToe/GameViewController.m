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
        NSString *whichPlayerWon = nil;
        
        if ([self.currentPlayer isEqualToString:@"X"]) {
            whichPlayerWon = @"O";
            
        } else {
            whichPlayerWon =@"X";
        }
        
        UIAlertController *resultAlert = [UIAlertController alertControllerWithTitle:@"Game Result" message:[NSString stringWithFormat:@"Congratulations player %@", whichPlayerWon] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *newGameAction = [UIAlertAction actionWithTitle:@"Start New Game" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:nil];
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
        } else if ([self isLabelEmpty:currentPannedToLabel]) {
            currentPannedToLabel.text = self.currentPlayer;
             self.playerLabel.center = originalPlayerLabelPoint;
        } else {
             self.playerLabel.center = originalPlayerLabelPoint;
        }
        
        self.currentPlayer = [self currentPlayerMark];
        self.playerLabel.text = [self currentPlayerLabelMark];
        [self whoWonTicTacToe];
        
    }
    
    
    
    
//    if (gesture.state == UIGestureRecognizerStateBegan && ) {
//        
//        
//        if (!CGRectContainsPoint(self.playerLabel.frame, currentPanPoint))  {
//            return;
//        } else {
//            if (gesture.state == UIGestureRecognizerStateChanged) {
//            }
//            
//    }
    
}



- (IBAction)onLabelTapped:(UITapGestureRecognizer *)sender {
    CGPoint tappedPoint = [sender locationInView:self.view];
    UILabel *labelPressed = [self findLabelUsingPoint:tappedPoint];
    
    if (!([self findLabelUsingPoint:tappedPoint] == nil)) {
    
    
        if ([self.currentPlayer isEqualToString:@"X"] && [self isLabelEmpty:labelPressed]) {
            if (labelPressed == self.topLeftLabel) {
                self.topLeftLabel.text = @"X";
                self.topLeftLabel.textColor = [UIColor blueColor];
                
            } else if (labelPressed == self.topMiddleLabel) {
                self.topMiddleLabel.text = @"X";
                self.topMiddleLabel.textColor = [UIColor blueColor];
                
            } else if (labelPressed == self.topRightLabel){
                self.topRightLabel.text = @"X";
                self.topRightLabel.textColor = [UIColor blueColor];
                
            } else if (labelPressed == self.middleLeftLabel) {
                self.middleLeftLabel.text = @"X";
                self.middleLeftLabel.textColor = [UIColor blueColor];
                
            } else if (labelPressed == self.middleMiddleLabel) {
                self.middleMiddleLabel.text = @"X";
                self.middleMiddleLabel.textColor = [UIColor blueColor];
                
            } else if (labelPressed == self.middleRightLabel) {
                self.middleRightLabel.text = @"X";
                self.middleRightLabel.textColor = [UIColor blueColor];
                
            } else if (labelPressed == self.bottomLeftLabel) {
                self.bottomLeftLabel.text = @"X";
                self.bottomLeftLabel.textColor = [UIColor blueColor];
                
            } else if (labelPressed == self.bottomMiddleLabel) {
                self.bottomMiddleLabel.text = @"X";
                self.bottomMiddleLabel.textColor = [UIColor blueColor];
                
            } else if (labelPressed == self.bottomRightLabel) {
                self.bottomRightLabel.text = @"X";
                self.bottomRightLabel.textColor = [UIColor blueColor];
            }
            
            self.currentPlayer = [self currentPlayerMark];
            
        } else if ([self.currentPlayer isEqualToString:@"O"] && [self isLabelEmpty:labelPressed]) {
            
            if (labelPressed == self.topLeftLabel) {
                self.topLeftLabel.text = @"O";
                self.topLeftLabel.textColor = [UIColor redColor];
                
            } else if (labelPressed == self.topMiddleLabel){
                self.topMiddleLabel.text = @"O";
                self.topMiddleLabel.textColor = [UIColor redColor];
                
            } else if (labelPressed == self.topRightLabel) {
                self.topRightLabel.text = @"O";
                self.topRightLabel.textColor = [UIColor redColor];
                
            } else if (labelPressed == self.middleLeftLabel) {
                self.middleLeftLabel.text = @"O";
                self.middleLeftLabel.textColor = [UIColor redColor];
                
            } else if (labelPressed == self.middleMiddleLabel) {
                self.middleMiddleLabel.text = @"O";
                self.middleMiddleLabel.textColor = [UIColor redColor];
                
            } else if (labelPressed == self.middleRightLabel) {
                self.middleRightLabel.text = @"O";
                self.middleRightLabel.textColor = [UIColor redColor];
                
            } else if (labelPressed == self.bottomLeftLabel) {
                self.bottomLeftLabel.text = @"O";
                self.bottomLeftLabel.textColor = [UIColor redColor];
                
            } else if (labelPressed == self.bottomMiddleLabel) {
                self.bottomMiddleLabel.text = @"O";
                self.bottomMiddleLabel.textColor = [UIColor redColor];
                
            } else if (labelPressed == self.bottomRightLabel) {
                self.bottomRightLabel.text = @"O";
                self.bottomRightLabel.textColor = [UIColor redColor];
            }
            self.currentPlayer = [self currentPlayerMark];
        }
        
        
        
        self.playerLabel.text = [self currentPlayerLabelMark];
    
    
        [self whoWonTicTacToe];
    
    } else {
        return;
    }
    
    
    
}
@end
