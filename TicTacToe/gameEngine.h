//
//  gameEngine.h
//  TicTacToe
//
//  Created by Angelo C on 15/04/15.
//  Copyright (c) 2015 (axc111) Angelo Carraggi.  All rights reserved.
//

#ifndef TicTacToe_gameEngine_h
#define TicTacToe_gameEngine_h
#import <Foundation/Foundation.h>
#import "configGame.h"

@interface gameEngine : NSObject
@property(retain,nonatomic) NSArray *arraySymbols;
@property int turnRandom;

-(BOOL)arraySignPosition:(int)row col:(int)cl;
-(int)changeValueOfTurn;
-(void)startMatch;
-(NSString *)getStringTurn;
-(NSString *)getstringWinner;
-(NSString*)getSymbolPlayer;
@end


#endif
