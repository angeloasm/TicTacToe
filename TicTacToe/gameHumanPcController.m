//
//  UIViewController+gameHumanPc.m
//  TicTacToe
//
//  Created by Angelo C on 07/04/15.
//  Copyright (c) 2015 (axc111) Angelo Carraggi.  All rights reserved.
//

#import "gameHumanPcController.h"

@interface gameHumanPcController ()
@end

@implementation gameHumanPcController

static int matrix[3][3];


-(void)showWinner
{
    NSString *lblwinner = @"Win the ";
    lblwinner = [lblwinner stringByAppendingString:[_gEPC getPlayerType]];
    _lblInfo.text = lblwinner;
}

-(void)drawGame
{
    NSString *lbldraw =@"The game finish draw";
    _lblInfo.text = lbldraw;
}
-(void)updateTextTurn
{
    NSString *lblwinner = @"Turn for ";
    lblwinner = [lblwinner stringByAppendingString:[_gEPC getPlayerType]];
    _lblInfo.text = lblwinner;
}

-(void)signPosition:(float)position
{
    int r = round(position);
    int c = (position*10)-(r*10);
     NSLog(@"cell: %f r: %i c: %i",position,r,c);
    id a;
    if(r==0){
        if(c==0){
            [self btn11:a];
        }
        if(c==1){
            [self btn12:a];
        }
        if(c==2){
            [self btn13:a];
        }
    }
    if(r==1){
        if(c==0){
            [self btn21:a];
        }
        if(c==1){
            [self btn22:a];
        }
        if(c==2){
            [self btn23:a];
        }
    }
    if(r==2){
        if(c==0){
            [self btn31:a];
        }
        if(c==1){
            [self btn32:a];
        }
        if(c==2){
            [self btn33:a];
        }
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    _gEPC = [[gameEnginePC alloc ]init];
    [_gEPC startMatch];
    NSLog(@"%@",[_gEPC getPlayerType]);
    if ([[_gEPC getPlayerType]isEqualToString:@"pc"]) {
        float position = [_gEPC choosePCPositon];
        [self signPosition:position];
    }
    //[self choosePosition];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/**
 * Implementation of the button Action of the matrix
 */
- (IBAction)btnRestart:(id)sender {
    [_gEPC startMatch];
    [_btnView33 setImage:nil forState:UIControlStateNormal];
    [_btnView32 setImage:nil forState:UIControlStateNormal];
    [_btnView31 setImage:nil forState:UIControlStateNormal];
    [_btnView23 setImage:nil forState:UIControlStateNormal];
    [_btnView22 setImage:nil forState:UIControlStateNormal];
    [_btnView21 setImage:nil forState:UIControlStateNormal];
    [_btnView13 setImage:nil forState:UIControlStateNormal];
    [_btnView12 setImage:nil forState:UIControlStateNormal];
    [_btnView11 setImage:nil forState:UIControlStateNormal];
    [self updateTextTurn];
    if ([[_gEPC getPlayerType]isEqualToString:@"pc"]) {
        float position = [_gEPC choosePCPositon];
        [self signPosition:position];
    }

}

- (IBAction)btn11:(id)sender {
    //This action is for the cell of matrix row:1 and col:1
    if ([_gEPC arraySignPosition:0 col:0]) {
        if ([[_gEPC getSymbolPlayer] isEqualToString:@"o"]) {
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView11 setImage:img forState:UIControlStateNormal];
        }else{
            UIImage *img = [UIImage imageNamed:@"x.png"];
            [_btnView11 setImage:img forState:UIControlStateNormal];
            
        }
        int areWinner = [_gEPC changeValueOfTurn];
        NSLog(@"are winner: %i",areWinner);
        if (areWinner == 0) {
            if ([_gEPC areThereFreePlaces]) {
                
                [self updateTextTurn];
            }else{
                [self drawGame];
            }
            
            
        }else{
            
            if (areWinner==5) {
                float position = [_gEPC choosePCPositon];
                [self signPosition:position];
                if ([_gEPC areThereFreePlaces]) {
                    
                    
                }else{
                    [self drawGame];
                }
            }else{
                

                [self showWinner];
            }
            
        }
    }
}

- (IBAction)btn12:(id)sender {
    
    if ([_gEPC arraySignPosition:0 col:1]) {
        if ([[_gEPC getSymbolPlayer] isEqualToString:@"o"]) {
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView12 setImage:img forState:UIControlStateNormal];
        }else{
            UIImage *img = [UIImage imageNamed:@"x.png"];
            [_btnView12 setImage:img forState:UIControlStateNormal];
            
        }
        int areWinner = [_gEPC changeValueOfTurn];
        NSLog(@"are winner: %i",areWinner);
        if (areWinner == 0) {
            if ([_gEPC areThereFreePlaces]) {
                [self updateTextTurn];
            }else{
                [self drawGame];
            }
            
            
        }else{
            
            if (areWinner==5) {
                float position = [_gEPC choosePCPositon];
                [self signPosition:position];
                if ([_gEPC areThereFreePlaces]) {
                    
                    
                }else{
                    [self drawGame];
                }
            }else{
                
                
                [self showWinner];
            }
            
        }
    }
}

- (IBAction)btn13:(id)sender {
    
   
    if ([_gEPC arraySignPosition:0 col:2]) {
        if ([[_gEPC getSymbolPlayer] isEqualToString:@"o"]) {
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView13 setImage:img forState:UIControlStateNormal];
        }else{
            UIImage *img = [UIImage imageNamed:@"x.png"];
            [_btnView13 setImage:img forState:UIControlStateNormal];
            
        }
        int areWinner = [_gEPC changeValueOfTurn];
        NSLog(@"are winner: %i",areWinner);
        if (areWinner == 0) {
            if ([_gEPC areThereFreePlaces]) {
                     [self updateTextTurn];
            }else{
                    [self drawGame];
            }
            
            
        }else{
                 [self showWinner];
            if (areWinner==5) {
                float position = [_gEPC choosePCPositon];
                [self signPosition:position];
                if ([_gEPC areThereFreePlaces]) {
                    
                    
                }else{
                    [self drawGame];
                }
            }else{
                
                
                [self showWinner];
            }
        }
    }

}

- (IBAction)btn21:(id)sender {
    
    if ([_gEPC arraySignPosition:1 col:0]) {
        if ([[_gEPC getSymbolPlayer] isEqualToString:@"o"]) {
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView21 setImage:img forState:UIControlStateNormal];
        }else{
            UIImage *img = [UIImage imageNamed:@"x.png"];
            [_btnView21 setImage:img forState:UIControlStateNormal];
            
        }
        int areWinner = [_gEPC changeValueOfTurn];
        NSLog(@"are winner: %i",areWinner);
        if (areWinner == 0) {
            if ([_gEPC areThereFreePlaces]) {
                    [self updateTextTurn];
            }else{
                    [self drawGame];
            }
            
            
        }else{
            if (areWinner==5) {
                float position = [_gEPC choosePCPositon];
                [self signPosition:position];
                if ([_gEPC areThereFreePlaces]) {
                    
                    
                }else{
                    [self drawGame];
                }
            }else{
                
                
                [self showWinner];
            }
        }
    }
}

- (IBAction)btn22:(id)sender {
    
    if ([_gEPC arraySignPosition:1 col:1]) {
        if ([[_gEPC getSymbolPlayer] isEqualToString:@"o"]) {
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView22 setImage:img forState:UIControlStateNormal];
        }else{
            UIImage *img = [UIImage imageNamed:@"x.png"];
            [_btnView22 setImage:img forState:UIControlStateNormal];
            
        }
        int areWinner = [_gEPC changeValueOfTurn];
        NSLog(@"are winner: %i",areWinner);
        if (areWinner == 0) {
            if ([_gEPC areThereFreePlaces]) {
                     [self updateTextTurn];
            }else{
                     [self drawGame];
            }
            
            
        }else{
            if (areWinner==5) {
                float position = [_gEPC choosePCPositon];
                [self signPosition:position];
                if ([_gEPC areThereFreePlaces]) {
                    
                    
                }else{
                    [self drawGame];
                }
            }else{
                
                
                [self showWinner];
            }
        }
    }

}

- (IBAction)btn23:(id)sender {
    
    if ([_gEPC arraySignPosition:1 col:2]) {
        if ([[_gEPC getSymbolPlayer] isEqualToString:@"o"]) {
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView23 setImage:img forState:UIControlStateNormal];
        }else{
            UIImage *img = [UIImage imageNamed:@"x.png"];
            [_btnView23 setImage:img forState:UIControlStateNormal];
            
        }
        int areWinner = [_gEPC changeValueOfTurn];
        NSLog(@"are winner: %i",areWinner);
        if (areWinner == 0) {
            if ([_gEPC areThereFreePlaces]) {
                     [self updateTextTurn];
            }else{
                    [self drawGame];
            }
            
            
        }else{
            if (areWinner==5) {
                float position = [_gEPC choosePCPositon];
                [self signPosition:position];
                if ([_gEPC areThereFreePlaces]) {
                    
                    
                }else{
                    [self drawGame];
                }
            }else{
                
                
                [self showWinner];
            }
        }
    }

}

- (IBAction)btn31:(id)sender {
    
    if ([_gEPC arraySignPosition:2 col:0]) {
        if ([[_gEPC getSymbolPlayer] isEqualToString:@"o"]) {
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView31 setImage:img forState:UIControlStateNormal];
        }else{
            UIImage *img = [UIImage imageNamed:@"x.png"];
            [_btnView31 setImage:img forState:UIControlStateNormal];
            
        }
        int areWinner = [_gEPC changeValueOfTurn];
        NSLog(@"are winner: %i",areWinner);
        if (areWinner == 0) {
            if ([_gEPC areThereFreePlaces]) {
                     [self updateTextTurn];
            }else{
                    [self drawGame];
            }
            
            
        }else{
            if (areWinner==5) {
                float position = [_gEPC choosePCPositon];
                [self signPosition:position];
                if ([_gEPC areThereFreePlaces]) {
                    
                    
                }else{
                    [self drawGame];
                }
            }else{
                
                
                [self showWinner];
            }
        }
    }


}

- (IBAction)btn32:(id)sender {
    
    if ([_gEPC arraySignPosition:2 col:1]) {
        if ([[_gEPC getSymbolPlayer] isEqualToString:@"o"]) {
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView32 setImage:img forState:UIControlStateNormal];
        }else{
            UIImage *img = [UIImage imageNamed:@"x.png"];
            [_btnView32 setImage:img forState:UIControlStateNormal];
            
        }
        int areWinner = [_gEPC changeValueOfTurn];
        NSLog(@"are winner: %i",areWinner);
        if (areWinner == 0) {
            if ([_gEPC areThereFreePlaces]) {
                     [self updateTextTurn];
            }else{
                    [self drawGame];
            }
            
            
        }else{
            if (areWinner==5) {
                float position = [_gEPC choosePCPositon];
                [self signPosition:position];
                if ([_gEPC areThereFreePlaces]) {
                    
                    
                }else{
                    [self drawGame];
                }
            }else{
                
                
                [self showWinner];
            }
        }
    }

}

- (IBAction)btn33:(id)sender {
    if ([_gEPC arraySignPosition:2 col:2]) {
        if ([[_gEPC getSymbolPlayer] isEqualToString:@"o"]) {
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView33 setImage:img forState:UIControlStateNormal];
        }else{
            UIImage *img = [UIImage imageNamed:@"x.png"];
            [_btnView33 setImage:img forState:UIControlStateNormal];
            
        }
        int areWinner = [_gEPC changeValueOfTurn];
        NSLog(@"are winner: %i",areWinner);
        if (areWinner == 0) {
            if ([_gEPC areThereFreePlaces]) {
                     [self updateTextTurn];
            }else{
                    [self drawGame];
            }
            
            
        }else{
            if (areWinner==5) {
                float position = [_gEPC choosePCPositon];
                [self signPosition:position];
                if ([_gEPC areThereFreePlaces]) {
                    
                    
                }else{
                    [self drawGame];
                }
            }else{
                
                
                [self showWinner];
            }
        }
    }

}

/**
 * Implementation of the choose Position will do choose by the PC.
 */
-(void)choosePosition{
    
    float arr[9];
    int x=0;
    int row=0;
    for(row=0;row<3;row++){
        int col=0;
        for(col=0;col<3;col++){
            if(matrix[row][col]==0){
                float fcol = (float)col/10;
                float frow = row;
                float tot = frow+fcol;
                arr[x]=tot;
                x++;
            }
        }
        
    }
    
    int cell = rand()%x;
    //NSLog(@"random cell: %i",cell);
    int r = round(arr[cell]);
    int c = (arr[cell]-r)*10;
   // NSLog(@"cell: %f r: %i c: %i",arr[cell],r,c);
    id a;
    if(r==0){
        if(c==0){
            [self btn11:a];
        }
        if(c==1){
            [self btn12:a];
        }
        if(c==2){
            [self btn13:a];
        }
    }
    if(r==1){
        if(c==0){
            [self btn21:a];
        }
        if(c==1){
            [self btn22:a];
        }
        if(c==2){
            [self btn23:a];
        }
    }
    if(r==2){
        if(c==0){
            [self btn31:a];
        }
        if(c==1){
            [self btn32:a];
        }
        if(c==2){
            [self btn33:a];
        }
    }
    
    
    
    
}




@end


