//
//  UIViewController+gameHumanPc.m
//  TicTacToe
//
//  Created by Angelo C on 07/04/15.
//  Copyright (c) 2015 Angelo C. All rights reserved.
//

#import "gameHumanPcController.h"

@interface gameHumanPcController ()
@end

@implementation gameHumanPcController

static int matrix[3][3];

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
    

}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self matchStart];
    [self choosePosition];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/**
 * Implementation of the button Action of the matrix
 */
- (IBAction)btn11:(id)sender {
    //This action is for the cell of matrix row:1 and col:1
    NSLog(@"ciao mondo!");
}

- (IBAction)btn12:(id)sender {
    //This action is for the cell of matrix row:1 and col:2

}

- (IBAction)btn13:(id)sender {
    //This action is for the cell of matrix row:1 and col:3

}

- (IBAction)btn21:(id)sender {
    //This action is for the cell of matrix row:2 and col:1

}

- (IBAction)btn22:(id)sender {
    //This action is for the cell of matrix row:2 and col:2

}

- (IBAction)btn23:(id)sender {
    //This action is for the cell of matrix row:2 and col:3

}

- (IBAction)btn31:(id)sender {
    //This action is for the cell of matrix row:3 and col:1

}

- (IBAction)btn32:(id)sender {
    //This action is for the cell of matrix row:3 and col:2

}

- (IBAction)btn33:(id)sender {
    //This action is for the cell of matrix row:3 and col:3

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
    NSLog(@"random cell: %i",cell);
    int r = round(arr[cell]);
    int c = arr[cell]-r;
    id a;
    [self btn11:a];
    
    
    
}


- (int) whoWin {
    int i,j;
    int diag=0;
    int oriz=0;
    int vert=0;
    int diaginf=0;
    
    /*
     Controllo se sta vincendo verticalmente col fisso e row variabile
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
    
    if(matrix[row][col]==0){
        matrix[row][col]=_turn+1;
     //   [self changeValueOfTurn];
    }
    return YES;
    
}

- (void)changeValueOfTurn {
    
    
}

@end


