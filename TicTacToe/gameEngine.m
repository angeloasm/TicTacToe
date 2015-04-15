//
//  gameEngine.m
//  TicTacToe
//
//  Created by Angelo Carraggi on 15/04/15.
//  Copyright (c) 2015 (axc111) Angelo Carraggi.  All rights reserved.
//

#import "gameEngine.h"


@implementation gameEngine

static int matrix[ROW][COL];

-(NSString *)getStringTurn
{
    NSString *txt = @"Player ";
    txt = [txt stringByAppendingString:[_arraySymbols objectAtIndex:_turnRandom]];
    NSLog(@"%@",txt);
    return txt;
}

-(void)initMatrix
{
    int i,j;
    for(i=0;i<ROW;i++){
        for(j=0;j<COL;j++){
            matrix[i][j]=0;
        }
    }
}
/**
 * This method is called for initialization the variable of the game.
 * It's the main point for start the game.
 */
-(void)startMatch
{
    //get random turn cell for the arraySymbols
    _turnRandom = arc4random() % 2;
    //set value of array _arraySymbols
    _arraySymbols = [NSArray arrayWithObjects:@"x",@"o", nil];
    //initilization of matrix value
    [self initMatrix];
    
}


-(int)whoWin
{
    
    NSLog(@"Turn: %i",_turnRandom+1);
    int valueOfPlayer = _turnRandom+1;
    NSLog(@"matrice:");
    
    NSLog(@"%i %i %i",matrix[0][0],matrix[0][1],matrix[0][2]);
    NSLog(@"%i %i %i",matrix[1][0],matrix[1][1],matrix[1][2]);
    NSLog(@"%i %i %i",matrix[2][0],matrix[2][1],matrix[2][2]);
    int row;
    int col;
    
    
    for(row=0;row<3;row++){
        
        
        
        
        for(col=0;col<3;col++){
            if(matrix[row][col]!=0){
                
                
                
                if([self verifyVerticalWin:row]){
                    return valueOfPlayer;
                }
                if(row==col){
                    if([self verifyDiagonalWin:row]){
                        return valueOfPlayer;
                    }
                }
                
                if([self verifyDiagInfWin]){
                    return valueOfPlayer;
                }
                if([self verifyOrizontalWin:row]){
                    return valueOfPlayer;
                }
                
            }
            
            
            
            
            
        }
        
    }
    
    
    
    
    
    
    
    return -1;
}

-(BOOL)verifyOrizontalWin:(int)row
{
    
    int win=0;
    int col;
    int valueOfPlayer = _turnRandom+1;
    for(col=0;col<3;col++){
        if(matrix[row][col]==valueOfPlayer){
            win++;
        }
        
    }
    if(win==3){
        return YES;
    }else{
        return NO;
    }
    
}

-(BOOL) verifyVerticalWin:(int)row
{
    int win=0;
    
    int valueOfPlayer = _turnRandom+1;
    int j=0;
    for(j=0;j<3;j++){
        if(matrix[j][row]==valueOfPlayer){
            win++;
        }
    }
    if(win==3){
        return YES;
    }else{
        return NO;
    }
    
}

-(BOOL) verifyDiagonalWin:(int)row
{
    int diag=0;
    int d = 0;
    int valueOfPlayer = _turnRandom+1;
    for(d=0;d<3;d++){
        if(matrix[d][d]==valueOfPlayer){
            diag++;
        }
    }
    
    
    if(diag==3){
        return YES;
    }else{
        return NO;
    }
    
}

-(BOOL)verifyDiagInfWin
{
    
    int diagInf=0;
    int d=2;
    int r=0;
    int valueOfPlayer=_turnRandom+1;
    for(r=0;r<3;r++){
        if(matrix[d][r]==valueOfPlayer){
            diagInf++;
            d--;
        }else{
            return NO;
        }
    }
    if(diagInf ==3){
        return YES;
    }else{
        return NO;
    }
    
}

-(void)changeValueOfTurn
{
    
}

/**
 * THIS FUNCTION isEmpty VERIFY IF THE CELL OF THE MATRIX IS EMPTY
 *
 */

-(BOOL)isEmpty:(int)row col:(int)cl
{
    //Control if the matrix value at row index and col index is equal to 0
    if(matrix[row][cl]==0){
        //if it's true return the YES bool. The cell is free for insert new value of Symbols.
        return YES;
    }else{
        //if it isn't true return the NO bool. It means that position is occupied from another symbols and it isn't free.
        return NO;
    }
}

/*
 * THIS FUNCTION SIGNED THE POSITION CLICKED BY THE PLAYER WITH HIS SYMBOLS ON INDEX OF MATRIX.
 */
-(void)arraySignPosition:(int)row col:(int)cl
{
    
}


@end