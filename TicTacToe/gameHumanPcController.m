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
static int turnPC;

-(BOOL)verifyOrizontalWin:(int)row{
    
    int win=0;
    int col;
    int valueOfPlayer = _turn+1;
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
    
    int valueOfPlayer = _turn+1;
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
    int valueOfPlayer = _turn+1;
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

-(BOOL)verifyDiagInfWin{
    
    int diagInf=0;
    int d=2;
    int r=0;
    int valueOfPlayer=_turn+1;
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



-(void)matchStart {
    int row;
    for(row=0;row<3;row++){
        int col;
        for(col=0;col<3;col++){
            matrix[row][col]=0;
        }
    }
    _arrayOfSymbol = [NSArray  arrayWithObjects:@"x",@"o", nil];
    _arrayOfPlayers = [NSArray arrayWithObjects:@"human",@"pc", nil];
    _player = rand()%[_arrayOfPlayers count];
    _turn = rand()%[_arrayOfSymbol count];
    id dicPlayer = [_arrayOfPlayers objectAtIndex:_player];
    id dicTurn = [_arrayOfSymbol objectAtIndex:_turn];
    _lblInfo.text = [_lblInfo.text stringByAppendingString:(NSString *)dicPlayer];
    if([[_arrayOfPlayers objectAtIndex:_player] isEqualToString:@"pc"]){
        turnPC =_turn;
    }else{
        if(_turn == 0){
            turnPC =1;
        }else{
            turnPC=0;
        }
    }

}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self matchStart];
    //[self choosePosition];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/**
 * Implementation of the button Action of the matrix
 */
- (IBAction)btn11:(id)sender {
    //This action is for the cell of matrix row:1 and col:1
  //  NSLog(@"ciao mondo!");
    if([self arraySign:0 and:0]){
        if([[_arrayOfSymbol objectAtIndex: _turn] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView11 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_arrayOfSymbol objectAtIndex: _turn] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
                [_btnView11 setImage:img forState:UIControlStateNormal];
                
            }
        }
    }else{
        
    }
}

- (IBAction)btn12:(id)sender {
    //This action is for the cell of matrix row:1 and col:2
    if([self arraySign:0 and:1]){
        if([[_arrayOfSymbol objectAtIndex: _turn] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView12 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_arrayOfSymbol objectAtIndex: _turn] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
                [_btnView12 setImage:img forState:UIControlStateNormal];
                
            }
        }
    }else{
        
    }
}

- (IBAction)btn13:(id)sender {
    
    //This action is for the cell of matrix row:1 and col:3
    if([self arraySign:0 and:2]){
        if([[_arrayOfSymbol objectAtIndex: _turn] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView13 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_arrayOfSymbol objectAtIndex: _turn] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
                [_btnView13 setImage:img forState:UIControlStateNormal];
                
            }
        }
    }else{
        
    }

}

- (IBAction)btn21:(id)sender {
    //This action is for the cell of matrix row:2 and col:1
    if([self arraySign:1 and:0]){
        if([[_arrayOfSymbol objectAtIndex: _turn] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView21 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_arrayOfSymbol objectAtIndex: _turn] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
                [_btnView21 setImage:img forState:UIControlStateNormal];
                
            }
        }
    }else{
        
    }

}

- (IBAction)btn22:(id)sender {
    //This action is for the cell of matrix row:2 and col:2
    if([self arraySign:1 and:1]){
        if([[_arrayOfSymbol objectAtIndex: _turn] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView22 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_arrayOfSymbol objectAtIndex: _turn] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
                [_btnView22 setImage:img forState:UIControlStateNormal];
                
            }
        }
    }else{
        
    }

}

- (IBAction)btn23:(id)sender {
    //This action is for the cell of matrix row:2 and col:3
    if([self arraySign:1 and:2]){
        if([[_arrayOfSymbol objectAtIndex: _turn] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView23 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_arrayOfSymbol objectAtIndex: _turn] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
                [_btnView23 setImage:img forState:UIControlStateNormal];
                
            }
        }
    }else{
        
    }

}

- (IBAction)btn31:(id)sender {
    //This action is for the cell of matrix row:3 and col:1
    if([self arraySign:2 and:0]){
        if([[_arrayOfSymbol objectAtIndex: _turn] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView31 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_arrayOfSymbol objectAtIndex: _turn] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
                [_btnView31 setImage:img forState:UIControlStateNormal];
                
            }
        }
    }else{
        
    }

}

- (IBAction)btn32:(id)sender {
    //This action is for the cell of matrix row:3 and col:2
    if([self arraySign:2 and:1]){
        if([[_arrayOfSymbol objectAtIndex: _turn] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView32 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_arrayOfSymbol objectAtIndex: _turn] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
                [_btnView32 setImage:img forState:UIControlStateNormal];
                
            }
        }
    }else{
        
    }

}

- (IBAction)btn33:(id)sender {
    //This action is for the cell of matrix row:3 and col:3
    if([self arraySign:2 and:2]){
        if([[_arrayOfSymbol objectAtIndex: _turn] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView33 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_arrayOfSymbol objectAtIndex: _turn] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
                [_btnView33 setImage:img forState:UIControlStateNormal];
                
            }
        }
    }else{
        
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


- (int) whoWin {
    int i,j;
    int diag=0;
    int oriz=0;
    int vert=0;
    int diaginf=0;
    
    /**
     * Controllo se sta vincendo verticalmente col fisso e row variabile
     **/
    for (i=0; i<3; i++) {
        
        /*
         id elem = [_myArrayTic objectAtIndex:i];
         NSString *item = (NSString*)elem;
         NSLog(@"whoWin said: %@",item);
         */
        
        int value = matrix[i][i];
        int secDiag = 2;
        if(value!=0){
            NSLog(@"Controllo il valore della matrice %i",value);
            for (j=0; j<3; j++) {
                
                if(matrix[i][j]==value && matrix[i][j]!=0){
                    NSLog(@"value of matrix[i][j] %i", matrix[i][j]);
                    vert++;
                }
                if(matrix[j][i]==value && matrix[i][j]!=0){
                    oriz++;
                }
                if (matrix[j][j]==value && matrix[j][j]!=0) {
                    diag++;
                }
                if(matrix[secDiag][j]==value && matrix[secDiag][j]!=0){
                    diaginf++;
                }
                secDiag--;
            }
        }
        NSLog(@"vert=%i oriz=%i diag=%i diaginf=%i", vert, oriz, diag,diaginf);
        if(vert == 3 || oriz == 3 || diaginf ==3 || diag==3){
            return value;
        }
        vert=0;
        oriz=0;
        diag=0;
        diaginf=0;
        
        
    }
    
    return -1;
}

- (BOOL)arraySign:(int)row and:(int)col{
    
    /*
     Riadattamento del codice alla matrice int[3][3]
     */
    if(_turn == turnPC){
        NSLog(@"E' il turno del pc");
    }
    if(matrix[row][col]==0){
        matrix[row][col]=_turn+1;
        [self changeValueOfTurn];
    }
    return YES;
    
}

- (void)changeValueOfTurn {
    int winnerid = [self whoWin];
    if(winnerid!=-1){
        _txtStr = @"Vince il giocatore con la ";
        if(winnerid==2){
            _turn=0;
            _lblInfo.text = [_txtStr stringByAppendingString:@"x"];
        }else{
            _turn=1;
            _lblInfo.text = [_txtStr stringByAppendingString:@"o"];
        }
        
    }
    NSLog(@"Turn:%i",_turn);
    if(winnerid==-1){
        if(_turn == turnPC){
            
                [self choosePosition];
            
            _txtStr = @"Gioca il giocatore con la ";
            id dictionary = [_arrayOfSymbol objectAtIndex:_turn+1];
            NSString *i = (NSString *)dictionary;
            _lblInfo.text = [_txtStr stringByAppendingString:i];
            _turn=0;
            
        }else{
            _turn++;
            
            
            _txtStr = @"Gioca il giocatore con la ";
            id dictionary = [_arrayOfSymbol objectAtIndex:_turn-1];
            NSString *i = (NSString *)dictionary;
            _lblInfo.text = [_txtStr stringByAppendingString:i];
            
        }
    }

    
}

@end


