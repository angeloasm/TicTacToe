//
//  gameEnginePC.m
//  TicTacToe
//
//  Created by Angelo C on 15/04/15.
//  Copyright (c) 2015 Angelo C. All rights reserved.
//

#import "gameEnginePC.h"

@implementation gameEnginePC

static int matrix[ROW][COL];

-(void)changeTypePlayer
{
    if(_player==0){
        _player++;
    }else{
        _player=0;
    }
}

-(float)choosePCPositon
{
    float arr[9];
    int x=0;
    int row=0;
    for(row=0;row<3;row++){
        int col=0;
        for(col=0;col<3;col++){
            if([super isEmpty:row col:col]){
                float fcol = (float)col/10;
                float frow = row;
                float tot = frow+fcol;
                arr[x]=tot;
                x++;
            }
        }
        
    }
    
    int cell = arc4random() % 2;
    //int r = round(arr[cell]);
    //int c = (arr[cell]-r)*10;
    return arr[cell];
 
}

-(void)startMatch
{
    [super startMatch];
    _playerType = [NSArray arrayWithObjects:@"human",@"pc", nil];
    _player = arc4random() % 2;
    
    
}

-(NSString*)getPlayerType
{
    return [_playerType objectAtIndex:_player];
}

-(int)changeValueOfTurn
{
    int ifWinner = [super whoWin];
    if (ifWinner==-1) {
        if(super.turnRandom==0){
            super.turnRandom++;
            [self changeTypePlayer];
            if([[self getPlayerType]isEqualToString:@"pc"])
            {
                return 5;
            }
        }else{
            super.turnRandom=0;
            [self changeTypePlayer];
            if([[self getPlayerType]isEqualToString:@"pc"])
            {
                return 5;
            }
        }
        return 0;
    }else{
        return 1;
    }

}
@end
