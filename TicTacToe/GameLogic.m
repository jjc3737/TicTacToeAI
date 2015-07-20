//
//  gameLogic.m
//  TicTacToe
//
//  Created by Jaehee Chung on 7/18/15.
//  Copyright (c) 2015 seanallen.co. All rights reserved.
//

#import "GameLogic.h"
@interface GameLogic ()
@property NSArray *twoInARowIndexArrays;

@end
@implementation GameLogic


-(instancetype)init {
    self = [super init];
    
    if (self) {
        self.twoInARowIndexArrays = [[NSArray alloc] initWithObjects:
                 [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1], [NSNumber numberWithInt:2], nil],
                 [NSArray arrayWithObjects:[NSNumber numberWithInt:2],[NSNumber numberWithInt:1], [NSNumber numberWithInt:0], nil],
                 [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:2], [NSNumber numberWithInt:1], nil],
                 [NSArray arrayWithObjects:[NSNumber numberWithInt:3],[NSNumber numberWithInt:4], [NSNumber numberWithInt:5], nil],
                 [NSArray arrayWithObjects:[NSNumber numberWithInt:5],[NSNumber numberWithInt:4], [NSNumber numberWithInt:3], nil],
                 [NSArray arrayWithObjects:[NSNumber numberWithInt:3],[NSNumber numberWithInt:5], [NSNumber numberWithInt:4], nil],
                 [NSArray arrayWithObjects:[NSNumber numberWithInt:6],[NSNumber numberWithInt:7], [NSNumber numberWithInt:8], nil],
                 [NSArray arrayWithObjects:[NSNumber numberWithInt:8],[NSNumber numberWithInt:7], [NSNumber numberWithInt:6], nil],
                 [NSArray arrayWithObjects:[NSNumber numberWithInt:6],[NSNumber numberWithInt:8], [NSNumber numberWithInt:7], nil],
                 [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:3], [NSNumber numberWithInt:6], nil],
                 [NSArray arrayWithObjects:[NSNumber numberWithInt:6],[NSNumber numberWithInt:3], [NSNumber numberWithInt:0], nil],
                 [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:6], [NSNumber numberWithInt:3], nil],
                 [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:4], [NSNumber numberWithInt:7], nil],
                 [NSArray arrayWithObjects:[NSNumber numberWithInt:7],[NSNumber numberWithInt:4], [NSNumber numberWithInt:1], nil],
                 [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:7], [NSNumber numberWithInt:4], nil],
                 [NSArray arrayWithObjects:[NSNumber numberWithInt:2],[NSNumber numberWithInt:5], [NSNumber numberWithInt:8], nil],
                 [NSArray arrayWithObjects:[NSNumber numberWithInt:8],[NSNumber numberWithInt:5], [NSNumber numberWithInt:2], nil],
                 [NSArray arrayWithObjects:[NSNumber numberWithInt:2],[NSNumber numberWithInt:8], [NSNumber numberWithInt:5], nil],
                 [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:4], [NSNumber numberWithInt:8], nil],
                 [NSArray arrayWithObjects:[NSNumber numberWithInt:8],[NSNumber numberWithInt:4], [NSNumber numberWithInt:0], nil],
                 [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:8], [NSNumber numberWithInt:4], nil],
                 [NSArray arrayWithObjects:[NSNumber numberWithInt:6],[NSNumber numberWithInt:4], [NSNumber numberWithInt:2], nil],
                 [NSArray arrayWithObjects:[NSNumber numberWithInt:2],[NSNumber numberWithInt:4], [NSNumber numberWithInt:6], nil],
                 [NSArray arrayWithObjects:[NSNumber numberWithInt:6],[NSNumber numberWithInt:2], [NSNumber numberWithInt:4], nil], nil];
    }
    
    return self;
    
}
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

#pragma mark    -Computer Logic
-(void)createWinningAndBlockingIndexArray:(NSMutableArray *)array {
    for (int i=0; i<self.twoInARowIndexArrays.count; i++) {
        if ([self isThereATwoInARow:array int:[[[self.twoInARowIndexArrays objectAtIndex:i] objectAtIndex:0] intValue] int:[[[self.twoInARowIndexArrays objectAtIndex:i] objectAtIndex:1] intValue] int:[[[self.twoInARowIndexArrays objectAtIndex: i] objectAtIndex:2] intValue]]) {
            if ([[[self.twoInARowIndexArrays objectAtIndex:i] objectAtIndex:0] isEqualToNumber:[NSNumber numberWithInt:1]]) {
                int index = [[[self.twoInARowIndexArrays objectAtIndex:i] objectAtIndex:2] intValue];
                [self addingToWinningIndexArray:index];
            } else {
                int index = [[[self.twoInARowIndexArrays objectAtIndex:i] objectAtIndex:2] intValue];
                [self addingToBlockingIndexArray:index];
            }
        }
    }
}

-(void)addingToWinningIndexArray:(int)index{
    [self.winningIndexArray addObject:[NSNumber numberWithInt:index]];
}

-(void)addingToBlockingIndexArray:(int)index{
    [self.blockingIndexArray addObject:[NSNumber numberWithInt:index]];
     
//     insertObject:[NSNumber numberWithInt:index]atIndex:0];
    
}


-(BOOL)isThereATwoInARow:(NSMutableArray *)array int:(int)indexOne int:(int)indexTwo int:(int)indexThree {
    
    if (([array objectAtIndex:indexOne] == [array objectAtIndex:indexTwo]) && !([self isBoxEmpty:array int:indexOne]) && ([self isBoxEmpty:array int:indexThree])) {
        return YES;
    } else {
        return NO;
    }
}

-(int)whatIndexComputShouldMakeNextMove {
    [self createWinningAndBlockingIndexArray:self.ticTacToeBoard];
    int index;
    if (!([self.winningIndexArray count] == 0)) {
        index = [[self.winningIndexArray objectAtIndex:0] intValue];
    } else if (!([self.blockingIndexArray count] == 0)) {
        int lastIndex = [self.blockingIndexArray count] - 1;
        index = [[self.blockingIndexArray objectAtIndex:lastIndex] intValue];
    } else {
        
        if ([self isBoxEmpty:self.ticTacToeBoard int:4]) {
            index = 4;
        } else {
            NSMutableArray *emptyIndexArray = [[NSMutableArray alloc] initWithCapacity:self.ticTacToeBoard.count];
            for (int i =0; i < self.ticTacToeBoard.count; i++) {
                if ([self isBoxEmpty:self.ticTacToeBoard int:i ]) {
                    [emptyIndexArray addObject:[NSNumber numberWithInt:i]];
                }
            }
            int indexRandom = arc4random_uniform((int)emptyIndexArray.count);
            index = [[emptyIndexArray objectAtIndex:indexRandom] intValue];
        }
    }
    [self.blockingIndexArray removeAllObjects];
    return index;
    
}


@end
