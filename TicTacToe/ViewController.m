//
//  ViewController.m
//  TicTacToe
//
//  Created by angeloasm on 17/03/15.
//  Copyright (c) 2015 Angelo C. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController


/**
 * This variable init the matrix who the game is based.
 * It's static because it's used in all scope of this file.
 */
static int matrix[3][3];


/*************FUNCTION FOR THE RESTART*******************/
/**
 * This function reset the matrix for restart a new game.
 */

-(void)resetMatrix{
    //This variable is used for the iteration of reset matrix bidimensional array.
    int i;
    for(i=0;i<3;i++){
        int j;
        for(j=0;j<3;j++){
            matrix[i][j]=0;
        }
    }
}

/**
 * Thi method is called when the user want restart the game.
 * It reset the all variable of the game such as btnView matrix and the variable that the game require.
 */

-(void)restart{
    //This array contains the symbol of the game.
    _myArray2 = [NSArray arrayWithObjects:@"x",@"o", nil];
    // This is a call of function for restart the matrix.
    [self resetMatrix];
    //Assign a new pseudo-rand number for the turn of the user.
    _turnRandom=arc4random() % 2;
    //Log of new number turn.
    NSLog(@"%i",_turnRandom);
    _val =@"x";
    _user=@"x";
    //This string is set for visualize at users turn.
    _txtStr = @"Gioca il giocatore con la ";
    id dictionary = [_myArray2 objectAtIndex:_turnRandom];
    NSString *i = (NSString *)dictionary;
    //Obtain the symbol assigned for the user we can start the turn.
    _textTurn.text = [_txtStr stringByAppendingString:i];
    //Reset all images of buttun view inside the matrix view.
    [_btnView33 setImage:nil forState:UIControlStateNormal];
    [_btnView32 setImage:nil forState:UIControlStateNormal];
    [_btnView31 setImage:nil forState:UIControlStateNormal];
    [_btnView23 setImage:nil forState:UIControlStateNormal];
    [_btnView22 setImage:nil forState:UIControlStateNormal];
    [_btnView21 setImage:nil forState:UIControlStateNormal];
    [_btnView13 setImage:nil forState:UIControlStateNormal];
    [_btnView12 setImage:nil forState:UIControlStateNormal];
    [_btnView11 setImage:nil forState:UIControlStateNormal];
    
}



//Si avvia dando il turno ad un primo concorrente.
//Settando i parametri necessari quali:

// _turnRandom: la variabile che permette di definire con quale segno inizia il primo giocatore
// _myArray2: l'array che contiene le variabili del gioco x o che sono i segni che andranno a riempire la matrice
// _myArrayTic: Array che è inizializzato con stringhe vuote e che serve per segnare dove è stata messa il rispettivo valore.

/**
 * This method is called by iOS when this app is started.
 * The code is the same of the method restartGame.
 */


- (void)viewDidLoad {
    _myArray2 = [NSArray arrayWithObjects:@"x",@"o", nil];
    _myArrayTic = [NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",nil];
    [super viewDidLoad];
    _turnRandom=arc4random() % 2;
    NSLog(@"%i",_turnRandom);
    _val =@"x";
    _user=@"x";
    _txtStr = @"Gioca il giocatore con la ";
    id dictionary = [_myArray2 objectAtIndex:_turnRandom];
    NSString *i = (NSString *)dictionary;
    _textTurn.text = [_txtStr stringByAppendingString:i];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)verifyOrizontalWin:(int)row{
    
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

-(BOOL)verifyDiagInfWin{
    
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

- (int) whoWin {
    
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


/**
 Funzione che permette il cambio del turno portando il valore di _turnRandom tra 0 ed 1 per identificare il valore
 dell'array _myArray2 per saperequale valore sarà inserito .
 
 */
- (void)changeValueOfTurn {
   
    int winnerid = [self whoWin];
    if(winnerid!=-1){
        _txtStr = @"Vince il giocatore con la ";
        if(winnerid==2){
            _turnRandom=0;
            _textTurn.text = [_txtStr stringByAppendingString:@"x"];
        }else{
            _turnRandom=1;
            _textTurn.text = [_txtStr stringByAppendingString:@"o"];
        }
        
    }
     NSLog(@"Turn:%i",_turnRandom);
    if(winnerid==-1){
    if(_turnRandom == 1){
        _turnRandom=0;
        _txtStr = @"Gioca il giocatore con la ";
        id dictionary = [_myArray2 objectAtIndex:_turnRandom+1];
        NSString *i = (NSString *)dictionary;
        _textTurn.text = [_txtStr stringByAppendingString:i];
    }else{
        _turnRandom++;
        _txtStr = @"Gioca il giocatore con la ";
        id dictionary = [_myArray2 objectAtIndex:_turnRandom-1];
        NSString *i = (NSString *)dictionary;
        _textTurn.text = [_txtStr stringByAppendingString:i];
    }
    }
    
}

/**
 Funzione che controlla se l'indice che si è toccati risulta essere effettivamente libero o già occupato da un'altro segno!
 */

- (BOOL)isEmpty:(int)index {
    if([[_myArrayTic objectAtIndex:index] isEqualToString:@"0"]){
        return YES;
    }else{
        return NO;
    }
    
}

/*
 Funzione che permette di assegnare il valore di un tasto premuto, per essere occupato, nell'array del tic tac toe
 */

- (BOOL)arraySign:(int)row and:(int)col{
    
    /*
     Riadattamento del codice alla matrice int[3][3]
     */
    
    if(matrix[row][col]==0){
        matrix[row][col]=_turnRandom+1;
        [self changeValueOfTurn];
    }
    return YES;
    

}



- (IBAction)restartGame:(id)sender {
    [self restart];

}

- (IBAction)btn33:(id)sender {
    // SE si verifica che la cella in questione ( 3:3 ) è piena non fare nulla!
    if([self arraySign:2 and:2]){
        if([[_myArray2 objectAtIndex: _turnRandom] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView33 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_myArray2 objectAtIndex: _turnRandom] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
                [_btnView33 setImage:img forState:UIControlStateNormal];
                
            }
        }
    }

}

- (IBAction)btn32:(id)sender {
    // SE si verifica che la cella in questione ( 3:2 ) è piena non fare nulla!
    if([self arraySign:2 and:1]){
        if([[_myArray2 objectAtIndex: _turnRandom] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView32 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_myArray2 objectAtIndex: _turnRandom] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
                [_btnView32 setImage:img forState:UIControlStateNormal];
                
            }
        }
    }

}

- (IBAction)btn31:(id)sender {
    // SE si verifica che la cella in questione ( 3:1 ) è piena non fare nulla!
    if([self arraySign:2 and:0]){
        if([[_myArray2 objectAtIndex: _turnRandom] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView31 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_myArray2 objectAtIndex: _turnRandom] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
                [_btnView31 setImage:img forState:UIControlStateNormal];
                
            }
        }
    }
}



- (IBAction)btn23:(id)sender {
    // SE si verifica che la cella in questione ( 2:3 ) è piena non fare nulla!
    if([self arraySign:1 and: 2]){
        if([[_myArray2 objectAtIndex: _turnRandom] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView23 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_myArray2 objectAtIndex: _turnRandom] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
                [_btnView23 setImage:img forState:UIControlStateNormal];
                
            }
        }
    }
}

- (IBAction)btn22:(id)sender {
    // SE si verifica che la cella in questione ( 2:2 ) è piena non fare nulla!
    if([self arraySign:1 and:1]){
        if([[_myArray2 objectAtIndex: _turnRandom] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView22 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_myArray2 objectAtIndex: _turnRandom] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
                [_btnView22 setImage:img forState:UIControlStateNormal];
                
            }
        }
    }
}

- (IBAction)btn21:(id)sender {
    // SE si verifica che la cella in questione ( 2:1 ) è piena non fare nulla!
    if([self arraySign:1 and:0]){
        if([[_myArray2 objectAtIndex: _turnRandom] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView21 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_myArray2 objectAtIndex: _turnRandom] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
                [_btnView21 setImage:img forState:UIControlStateNormal];
                
            }
        }
    }

}


- (IBAction)btn13:(id)sender {
    // SE si verifica che la cella in questione ( 1:3 ) è piena non fare nulla!
    if([self arraySign:0 and:2]){
        if([[_myArray2 objectAtIndex: _turnRandom] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView13 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_myArray2 objectAtIndex: _turnRandom] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
                [_btnView13 setImage:img forState:UIControlStateNormal];
                
            }
        }
    }

}

//Caso in cui 
- (IBAction)btn12:(id)sender {
    // SE si verifica che la cella in questione ( 1:2 ) è piena non fare nulla!
    if([self arraySign:0 and:1]){
        if([[_myArray2 objectAtIndex: _turnRandom] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView12 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_myArray2 objectAtIndex: _turnRandom] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
                [_btnView12 setImage:img forState:UIControlStateNormal];
                
            }
        }
    }
}

/*
 Funzione che gestisce il tasto della cella della matrice del tris di riga 1 e colonna 1
 */

- (IBAction)btn11:(id)sender {
    
    // SE si verifica che la cella in questione ( 1:1 ) è piena non fare nulla!
    if([self arraySign:0 and:0]){
        if([[_myArray2 objectAtIndex: _turnRandom] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView11 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_myArray2 objectAtIndex: _turnRandom] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
                [_btnView11 setImage:img forState:UIControlStateNormal];
            
            }
        }
    }else{

    }
    
}


@end
