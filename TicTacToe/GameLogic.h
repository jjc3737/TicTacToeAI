//
//  gameLogic.h
//  TicTacToe
//
//  Created by Jaehee Chung on 7/18/15.
//  Copyright (c) 2015 seanallen.co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameLogic : NSObject

@property NSMutableArray *ticTacToeBoard;


-(NSMutableArray *)newBoard;
-(NSMutableArray *)clearBoard;


-(NSNumber *)whoWonTicTacToe: (NSMutableArray *)array;
-(BOOL)isThereATie: (NSMutableArray *)array;
-(void)upDateBoard:(NSString *)playerType int:(int)index;
-(BOOL)isBoxEmpty:(NSMutableArray *)array int:(int)index;

@end
