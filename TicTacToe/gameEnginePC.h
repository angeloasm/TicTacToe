//
//  gameEnginePC.h
//  TicTacToe
//
//  Created by Angelo C on 15/04/15.
//  Copyright (c) 2015 Angelo C. All rights reserved.
//

#ifndef TicTacToe_gameEnginePC_h
#define TicTacToe_gameEnginePC_h
#import "gameEngine.h"
#import "IAGame.h"

@interface gameEnginePC : gameEngine
@property (retain,nonatomic) NSArray *playerType;
@property int player;

-(NSString*)getPlayerType;
-(float)choosePCPositon;
-(void)changeTypePlayer;
@end

#endif
