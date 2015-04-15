//
//  gameEngine.m
//  TicTacToe
//
//  Created by Angelo Carraggi on 15/04/15.
//  Copyright (c) 2015 (axc111) Angelo Carraggi.  All rights reserved.
//

#import "gameEngine.h"


@implementation gameEngine

/**
 * THIS VARIABLE IS USED IN ALL PART OF THE CODE, IT'S THE BASE OF GAME, BECAUSE
 * ALL SYMBOL IS PLACED INTO THIS MATRIX. 
 * HOWEVER, THIS MATRIX IS THE BASE OF ALL CALCULATION OF THE GAME, ALL CONTROLS AND OTHER FUNCTION 
 * IS BASED FOR THIS STRUCTURE.
 */
static int matrix[ROW][COL];
/**
 * THIS METHODS IS CALLED IF THE VIEW CONTROLLER WOULD KNOW WHICH ARE THE NEXT PLAYER'S TURN.
 * WITH THIS FUNCTION THE SYSTEM GIVE TO VIEW CONTROLLER CLASS THE COMPLETE STRING.
 * FOR EXAMPLE:
 * IF IS THE TURN OF SYMBOL X -> getStringTurn RETURN "Player X"
 */
-(NSString *)getStringTurn
{
    //INITIALIZING THE BASE STRING USED FOR THE NSSTRING
    NSString *txt = @"Player ";
    //APPEND FOR THIS STRING THE NEW PLAYER SYMBOLS FOR THE NEXT TURN.
    txt = [txt stringByAppendingString:[_arraySymbols objectAtIndex:_turnRandom]];
    //RETURN TO VIEW CONTROLLE CLASS THE FULL STRING CREATED.
    return txt;
}

/**
 * THIS METHODS INIZIALIZE THE MATRIX WITH ALL -1 VALUE.
 * THIS VALUE IS THE DEFAULT INT THAT BE INDICATIVE OF THE CELL IS EMPTY.
 */
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

/**
 * THIS METHODS IS CALLED IF YOU WANT KNOW WHO IS WINNER OF THE MATCH.
 * ITS CONTROLS ALL WINNER POSSIBILITIES IN ALL DIRECTION.
 * RETURN A DEFAULT VALUE THAT ARE -1 IF THERE AREN'T WINNER.
 */
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

/**
 * THIS METHOD CONTROL ALL POSIBILITIES WINNER IN THE ORIZONTAL DIRECTION OF THE MATRIX.
 */
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
/**
 * THIS METHOD CONTROL ALL POSSIBILITIES WINNER IN THE VERTICAL DIRECTION OF THE MATRIX.
 */
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

/**
 * THIS METHOD CONTROL ALL POSSIBILITIES WINNER IN THE DIAGONAL DIRECTION OF THE MATRIX.
 */

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

/**
 * THIS METHOD CONTROL ALL POSSIBILITIES WINNER IN THE DIAGONALINF DIRECTION OF THE MATRIX.
 */
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

/**
 * THIS METHOD CHANGE THE VALUE OF PLAYER'S TURN. 
 * IF THERE AREN'T A WINNER THE TURN PLAYER ISN'T CHANGE.
 */
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

/**
 * THIS METHOD HELP VIEWCONTROLLER FOR GET THE SYMBOL PLAYER'S TURN USED FOR 
 * ASSIGN AT THE BUTTON THE CORRECT IMAGE.
 */
-(NSString*)getSymbolPlayer
{
    return [_arraySymbols objectAtIndex:_turnRandom];
}

/**
 * THIS METHOD GET AT THE VIEWCONTROLLER THE FULL TEXT FOR THE WINNER PLAYER.
 * IT WORKS: getstringWinner - return-> "WIN THE PLAYER X";
 */
-(NSString*)getstringWinner
{
    NSString * s = @"Win the player ";
    s = [s stringByAppendingString:[_arraySymbols objectAtIndex:_turnRandom]];
    return s;
}

/**
 * THIS METHOD GET IF THERE ARE THE FREE PLACES IN THE MATRIX
 * IF THERE AREN'T FREE PLACES RETURN NO ELSE RETURN YES.
 */
-(BOOL)areThereFreePlaces
{
    int i,j;
    for (i=0; i<ROW; i++) {
        for (j=0; j<COL; j++) {
            if (matrix[i][j]==-1) {
                return YES;
            }
        }
    }
    return NO;
}

-(int)getRandomTurnValue
{
    return _turnRandom;
}

-(int)valueOfMatrix:(int)row col:(int)cl
{
    return matrix[row][cl];
}

@end