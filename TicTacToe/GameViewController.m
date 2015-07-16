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

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentPlayer = @"X";

}

- (NSString *) findLabelUsingPoint:(CGPoint) userTappedCGPoint {

    NSString *labelName = nil;

    if (CGRectContainsPoint(self.topLeftLabel.frame, userTappedCGPoint)) {

        labelName = @"topLeftLabel";
    } else if (CGRectContainsPoint(self.topMiddleLabel.frame, userTappedCGPoint)) {

        labelName = @"topMiddleLabel";
    } else if (CGRectContainsPoint(self.topRightLabel.frame, userTappedCGPoint)) {

        labelName = @"topRightLabel";
    } else if (CGRectContainsPoint(self.middleLeftLabel.frame, userTappedCGPoint)) {

        labelName = @"middleLeftLabel";
    } else if (CGRectContainsPoint(self.middleMiddleLabel.frame, userTappedCGPoint)) {

        labelName = @"middleMiddleLabel";
    } else if (CGRectContainsPoint(self.middleRightLabel.frame, userTappedCGPoint)) {

        labelName = @"middleRightLabel";
    } else if (CGRectContainsPoint(self.bottomLeftLabel.frame, userTappedCGPoint)) {

        labelName = @"bottomLeftLabel";
    } else if (CGRectContainsPoint(self.bottomMiddleLabel.frame, userTappedCGPoint)) {

        labelName = @"bottomMiddleLabel";
    } else if (CGRectContainsPoint(self.bottomRightLabel.frame, userTappedCGPoint)) {

        labelName = @"bottomRightLabel";
    } else {
        labelName = nil;
    }

    return labelName;

}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)sender {
    CGPoint tappedPoint = [sender locationInView:self.view];
    NSString *labelPressed = [self findLabelUsingPoint:tappedPoint];


    if ([self.currentPlayer isEqualToString:@"X"]) {
        if ([labelPressed isEqualToString:@"topLeftLabel"]) {
            self.topLeftLabel.text = @"X";
            self.topLeftLabel.textColor = [UIColor blueColor];

        } else if ([labelPressed isEqualToString:@"topMiddleLabel"]) {
            self.topMiddleLabel.text = @"X";
            self.topMiddleLabel.textColor = [UIColor blueColor];

        } else if ([labelPressed isEqualToString:@"topRightLabel"]) {
            self.topRightLabel.text = @"X";
            self.topRightLabel.textColor = [UIColor blueColor];

        } else if ([labelPressed isEqualToString:@"middleLeftLabel"]) {
            self.middleLeftLabel.text = @"X";
            self.middleLeftLabel.textColor = [UIColor blueColor];

        } else if ([labelPressed isEqualToString:@"middleMiddleLabel"]) {
            self.middleMiddleLabel.text = @"X";
            self.middleMiddleLabel.textColor = [UIColor blueColor];

        } else if ([labelPressed isEqualToString:@"middleRightLabel"]) {
            self.middleRightLabel.text = @"X";
            self.middleRightLabel.textColor = [UIColor blueColor];

        } else if ([labelPressed isEqualToString:@"bottomLeftLabel"]) {
            self.bottomLeftLabel.text = @"X";
            self.bottomLeftLabel.textColor = [UIColor blueColor];

        } else if ([labelPressed isEqualToString:@"bottomMiddleLabel"]) {
            self.bottomMiddleLabel.text = @"X";
            self.bottomMiddleLabel.textColor = [UIColor blueColor];

        } else if ([labelPressed isEqualToString:@"bottomRightLabel"]) {
            self.bottomRightLabel.text = @"X";
            self.bottomRightLabel.textColor = [UIColor blueColor];
        }

        self.currentPlayer = @"O";

    } else if ([self.currentPlayer isEqualToString:@"O"]) {

        if ([labelPressed isEqualToString:@"topLeftLabel"]) {
            self.topLeftLabel.text = @"O";
            self.topLeftLabel.textColor = [UIColor redColor];

        } else if ([labelPressed isEqualToString:@"topMiddleLabel"]) {
            self.topMiddleLabel.text = @"O";
            self.topMiddleLabel.textColor = [UIColor redColor];

        } else if ([labelPressed isEqualToString:@"topRightLabel"]) {
            self.topRightLabel.text = @"O";
            self.topRightLabel.textColor = [UIColor redColor];

        } else if ([labelPressed isEqualToString:@"middleLeftLabel"]) {
            self.middleLeftLabel.text = @"O";
            self.middleLeftLabel.textColor = [UIColor redColor];

        } else if ([labelPressed isEqualToString:@"middleMiddleLabel"]) {
            self.middleMiddleLabel.text = @"O";
            self.middleMiddleLabel.textColor = [UIColor redColor];

        } else if ([labelPressed isEqualToString:@"middleRightLabel"]) {
            self.middleRightLabel.text = @"O";
            self.middleRightLabel.textColor = [UIColor redColor];

        } else if ([labelPressed isEqualToString:@"bottomLeftLabel"]) {
            self.bottomLeftLabel.text = @"O";
            self.bottomLeftLabel.textColor = [UIColor redColor];

        } else if ([labelPressed isEqualToString:@"bottomMiddleLabel"]) {
            self.bottomMiddleLabel.text = @"O";
            self.bottomMiddleLabel.textColor = [UIColor redColor];
                
        } else if ([labelPressed isEqualToString:@"bottomRightLabel"]) {
            self.bottomRightLabel.text = @"O";
            self.bottomRightLabel.textColor = [UIColor redColor];
            }
        self.currentPlayer = @"X";
    }

    if ([self.currentPlayer isEqualToString:@"X"]) {
        self.playerLabel.text = @"O";
    } else {
        self.playerLabel.text = @"X";
    }
}
@end
