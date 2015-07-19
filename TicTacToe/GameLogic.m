//
//  gameLogic.m
//  TicTacToe
//
//  Created by Jaehee Chung on 7/18/15.
//  Copyright (c) 2015 seanallen.co. All rights reserved.
//

#import "GameLogic.h"

@implementation GameLogic

#pragma mark -The Board

-(NSMutableArray *)newBoard {
    
    for (int i = 0; i < 9; i++) {
        [self.ticTacToeBoard insertObject:[NSNumber numberWithInt:0]  atIndex:i ];
    }
    
    return self.ticTacToeBoard;
    
}

-(NSMutableArray *)clearBoard {
    
    for (int i = 0; i < 9; i++) {
        [self.ticTacToeBoard replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:0]];
    }
    
    return self.ticTacToeBoard;
    
}

-(void)upDateBoard:(NSString *)playerType int:(int)index {
    if ([self isBoxEmpty:self.ticTacToeBoard int:index]) {
        if ([playerType isEqualToString:@"player"]) {
            [self.ticTacToeBoard replaceObjectAtIndex:index withObject:[NSNumber numberWithInt: -1]];
        } else if ([playerType isEqualToString:@"computer"]){
            [self.ticTacToeBoard replaceObjectAtIndex:index withObject:[NSNumber numberWithInt:1]];
        }
    }
    
}

#pragma mark -Win / Tie

-(NSNumber *)whoWonTicTacToe:(NSMutableArray *)array {
    NSNumber *whoWon;
    
    if ([self isThereAWinningCombination:array int:0 int:1 int:2]) {
        whoWon = [array objectAtIndex:0];
        
    } else if ([self isThereAWinningCombination:array int:3 int:4 int:5]) {
        whoWon = [array objectAtIndex:3];
        
    } else if ([self isThereAWinningCombination:array int:6 int:7 int:8]) {
        whoWon = [array objectAtIndex:6];
        
    } else if ([self isThereAWinningCombination:array int:0 int:4 int:8]) {
        whoWon = [array objectAtIndex:0];
        
    } else if ([self isThereAWinningCombination:array int:2 int:4 int:6]) {
        whoWon = [array objectAtIndex:2];
        
    } else if ([self isThereAWinningCombination:array int:0 int:3 int:6]) {
        whoWon = [array objectAtIndex:0];
        
    } else if ([self isThereAWinningCombination:array int:1 int:4 int:7]) {
        whoWon = [array objectAtIndex:1];
        
    } else if ([self isThereAWinningCombination:array int:2 int:5 int:8]) {
        whoWon = [array objectAtIndex:2];
    } else {
        whoWon = nil;
    }
    
    return whoWon;
    
}


-(BOOL)isThereAWinningCombination:(NSMutableArray *)array int:(int)indexOne int
                                 :(int)indexTwo int:(int)indexThree {
    
    if (([array objectAtIndex:indexOne] == [array objectAtIndex:indexTwo]) && ([array objectAtIndex:indexTwo] == [array objectAtIndex:indexThree]) &&  ![self isBoxEmpty:array int:indexOne]) {
        return YES;
    } else {
        return NO;
    }
    
}

-(BOOL)isThereATie:(NSMutableArray *)array {
    if (![self isBoxEmpty:array int:0] && ![self isBoxEmpty:array int:1] &&
        ![self isBoxEmpty:array int:2] && ![self isBoxEmpty:array int:3] &&
        ![self isBoxEmpty:array int:4] && ![self isBoxEmpty:array int:5] &&
        ![self isBoxEmpty:array int:6] && ![self isBoxEmpty:array int:7] &&
        ![self isBoxEmpty:array int:8]) {
        
            return YES;
    } else {
        return NO;
    }
    
}


-(BOOL)isBoxEmpty:(NSMutableArray *)array int:(int)index {
    if ([array objectAtIndex:index] == [NSNumber numberWithInt:0]) {
        return YES;
    } else {
        return NO;
    }
}



@end
