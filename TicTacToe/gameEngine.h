//
//  gameEngine.h
//  TicTacToe
//
//  Created by Angelo C on 15/04/15.
//  Copyright (c) 2015 (axc111) Angelo Carraggi.  All rights reserved.
//

#ifndef TicTacToe_gameEngine_h
#define TicTacToe_gameEngine_h
#import "configGame.h"
@import Foundation;

@interface gameEngine : NSObject

@property(retain,nonatomic) NSArray *arraySymbols;
@property int turnRandom;
@property int **matrix;
-(BOOL)arraySignPosition:(int)row col:(int)cl;
-(int)changeValueOfTurn;
-(void)startMatch;
-(NSString *)getStringTurn;
-(NSString *)getstringWinner;
-(NSString*)getSymbolPlayer;
-(BOOL)areThereFreePlaces;
-(int)getRandomTurnValue;
-(int)whoWin;
-(BOOL)isEmpty:(int)row col:(int)cl;
@end


#endif
