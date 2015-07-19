//
//  ViewController.h
//  TicTacToe
//
//  Created by Sean's Macboo Pro on 7/16/15.
//  Copyright (c) 2015 seanallen.co. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GameLogic;
@interface GameViewController : UIViewController


@property (strong,nonatomic)GameLogic *ticTacToeGameLogic;

@end

