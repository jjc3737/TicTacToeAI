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

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
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
    }

    return labelName;

}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)sender {
    CGPoint tappedPoint = [sender locationInView:self.view];
    NSString *labelPressed = [self findLabelUsingPoint:tappedPoint];

}

@end
