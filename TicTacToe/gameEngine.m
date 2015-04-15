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
            matrix[i][j]=-1;
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
    
    NSLog(@"Turn: %i",_turnRandom);
    int valueOfPlayer = _turnRandom;
    NSLog(@"matrice:");
    
    NSLog(@"%i %i %i",matrix[0][0],matrix[0][1],matrix[0][2]);
    NSLog(@"%i %i %i",matrix[1][0],matrix[1][1],matrix[1][2]);
    NSLog(@"%i %i %i",matrix[2][0],matrix[2][1],matrix[2][2]);
    int row;
    int col;
    
    
    for(row=0;row<3;row++){
        
        
        
        
        for(col=0;col<3;col++){
            if(matrix[row][col]!=-1){
                
                
                
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
    int valueOfPlayer = _turnRandom;
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
    
    int valueOfPlayer = _turnRandom;
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
    int valueOfPlayer = _turnRandom;
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
    int valueOfPlayer=_turnRandom;
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

-(int)changeValueOfTurn
{
    int ifWinner = [self whoWin];
    if (ifWinner==-1) {
        if(_turnRandom==0){
            _turnRandom++;
        }else{
            _turnRandom=0;
        }
        return 0;
    }else{
        return 1;
    }
    
}

/**
 * THIS FUNCTION isEmpty VERIFY IF THE CELL OF THE MATRIX IS EMPTY
 *
 */

-(BOOL)isEmpty:(int)row col:(int)cl
{
    //Control if the matrix value at row index and col index is equal to 0
    if(matrix[row][cl]==-1){
        //if it's true return the YES bool. The cell is free for insert new value of Symbols.
        return YES;
    }else{
        //if it isn't true return the NO bool. It means that position is occupied from another symbols and it isn't free.
        return NO;
    }
}

/*
 * THIS FUNCTION SIGNED THE POSITION CLICKED BY THE PLAYER WITH HIS SYMBOLS ON INDEX OF MATRIX. 
 * ANOTHER WORK THAT THIS METHODS DO, IT IS, IF THE CELL IS EMPTY SET THE VALUE AND CALL THE FUNCTION FOR CHANGE THE PLAYER'S TURN.
 */
-(BOOL)arraySignPosition:(int)row col:(int)cl
{
    //CONTROL IF THE CELL WITH ROW AND COL IS EMPTY
    if ([self isEmpty:row col:cl]) {
        //IF IS TRUE ASSIGN THE SYMBOL'S PLAYER AT THE SAME CELL OF MATRIX
        matrix[row][cl]=_turnRandom;
        //CALL THE FUNCTION FOR CHANGE THE PLAYER'S TURN.
        //[self changeValueOfTurn];
        //RETURN THE STATEMENT USED FOR THE VIEW CONTROLLER METHODS
        return YES;
    }else{
        //RETURN THE STATEMENT IS IF NOT POSSIBLE TO INSERT INTO THIS CELL THE PLAYER'S SYMBOL.
        return NO;
    }
}

-(NSString*)getSymbolPlayer
{
    return [_arraySymbols objectAtIndex:_turnRandom];
}

-(NSString*)getstringWinner
{
    NSString * s = @"Win the player ";
    s = [s stringByAppendingString:[_arraySymbols objectAtIndex:_turnRandom]];
    return s;
}



@end