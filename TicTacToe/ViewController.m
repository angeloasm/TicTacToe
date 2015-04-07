//
//  ViewController.m
//  TicTacToe
//
//  Created by Angelo C on 17/03/15.
//  Copyright (c) 2015 Angelo C. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController
static int matrix[3][3];
//Si avvia dando il turno ad un primo concorrente.
//Settando i parametri necessari quali:

// _myValue: la variabile che permette di definire con quale segno inizia il primo giocatore
// _myArray2: l'array che contiene le variabili del gioco x o che sono i segni che andranno a riempire la matrice
// _myArrayTic: Array che è inizializzato con stringhe vuote e che serve per segnare dove è stata messa il rispettivo valore.

-(void)resetMatrix{
    int i;
    for(i=0;i<3;i++){
        int j;
        for(j=0;j<3;j++){
            matrix[i][j]=0;
        }
    }
}

-(void)restart{
    _myArray2 = [NSArray arrayWithObjects:@"x",@"o", nil];
    [self resetMatrix];
    
    _myValue=arc4random() % 2;
    NSLog(@"%i",_myValue);
    _val =@"x";
    _user=@"x";
    _txtStr = @"Gioca il giocatore con la ";
    id dictionary = [_myArray2 objectAtIndex:_myValue];
    NSString *i = (NSString *)dictionary;
    _textTurn.text = [_txtStr stringByAppendingString:i];
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

- (void)viewDidLoad {
    _myArray2 = [NSArray arrayWithObjects:@"x",@"o", nil];
    _myArrayTic = [NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",nil];
    [super viewDidLoad];
    _myValue=arc4random() % 2;
    NSLog(@"%i",_myValue);
    _val =@"x";
    _user=@"x";
    _txtStr = @"Gioca il giocatore con la ";
    id dictionary = [_myArray2 objectAtIndex:_myValue];
    NSString *i = (NSString *)dictionary;
    _textTurn.text = [_txtStr stringByAppendingString:i];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


/**
 Funzione che permette il cambio del turno portando il valore di _myValue tra 0 ed 1 per identificare il valore
 dell'array _myArray2 per saperequale valore sarà inserito .
 
 */
- (void)changeValueOfTurn {

    if(_myValue == 1){
        _myValue=0;
        _txtStr = @"Gioca il giocatore con la ";
        id dictionary = [_myArray2 objectAtIndex:_myValue+1];
        NSString *i = (NSString *)dictionary;
        _textTurn.text = [_txtStr stringByAppendingString:i];
    }else{
        _myValue++;
        _txtStr = @"Gioca il giocatore con la ";
        id dictionary = [_myArray2 objectAtIndex:_myValue-1];
        NSString *i = (NSString *)dictionary;
        _textTurn.text = [_txtStr stringByAppendingString:i];
    }
    int winnerid = [self whoWin];
    if(winnerid!=-1){
        _txtStr = @"Vince il giocatore con la ";
        if(winnerid==2){
            _textTurn.text = [_txtStr stringByAppendingString:@"x"];
        }else{
            _textTurn.text = [_txtStr stringByAppendingString:@"o"];
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
        matrix[row][col]=_myValue+1;
        [self changeValueOfTurn];
    }
    return YES;
    /*
    if([self isEmpty:index]){
        
        if([[_myArray2 objectAtIndex: _myValue] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
           // [_btnView11 setImage:img forState:UIControlStateNormal];
            _val = @"set";
            
            [_myArrayTic replaceObjectAtIndex:index withObject:@"1"];
            [self changeValueOfTurn];
            
        }else{
            if([[_myArray2 objectAtIndex: _myValue] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
               // [_btnView11 setImage:img forState:UIControlStateNormal];
                [_myArrayTic replaceObjectAtIndex:index withObject:@"2"];
                 _val = @"set";
                [self changeValueOfTurn];
                
                
            }
        }
        return YES;
    }else{
        return NO;
    }
     */

}



- (IBAction)restartGame:(id)sender {
    [self restart];

}

- (IBAction)btn33:(id)sender {
    // SE si verifica che la cella in questione ( 3:3 ) è piena non fare nulla!
    if([self arraySign:2 and:2]){
        if([[_myArray2 objectAtIndex: _myValue] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView33 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_myArray2 objectAtIndex: _myValue] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
                [_btnView33 setImage:img forState:UIControlStateNormal];
                
            }
        }
    }

}

- (IBAction)btn32:(id)sender {
    // SE si verifica che la cella in questione ( 3:2 ) è piena non fare nulla!
    if([self arraySign:2 and:1]){
        if([[_myArray2 objectAtIndex: _myValue] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView32 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_myArray2 objectAtIndex: _myValue] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
                [_btnView32 setImage:img forState:UIControlStateNormal];
                
            }
        }
    }

}

- (IBAction)btn31:(id)sender {
    // SE si verifica che la cella in questione ( 3:1 ) è piena non fare nulla!
    if([self arraySign:2 and:0]){
        if([[_myArray2 objectAtIndex: _myValue] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView31 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_myArray2 objectAtIndex: _myValue] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
                [_btnView31 setImage:img forState:UIControlStateNormal];
                
            }
        }
    }
}



- (IBAction)btn23:(id)sender {
    // SE si verifica che la cella in questione ( 2:3 ) è piena non fare nulla!
    if([self arraySign:1 and: 2]){
        if([[_myArray2 objectAtIndex: _myValue] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView23 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_myArray2 objectAtIndex: _myValue] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
                [_btnView23 setImage:img forState:UIControlStateNormal];
                
            }
        }
    }
}

- (IBAction)btn22:(id)sender {
    // SE si verifica che la cella in questione ( 2:2 ) è piena non fare nulla!
    if([self arraySign:1 and:1]){
        if([[_myArray2 objectAtIndex: _myValue] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView22 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_myArray2 objectAtIndex: _myValue] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
                [_btnView22 setImage:img forState:UIControlStateNormal];
                
            }
        }
    }
}

- (IBAction)btn21:(id)sender {
    // SE si verifica che la cella in questione ( 2:1 ) è piena non fare nulla!
    if([self arraySign:1 and:0]){
        if([[_myArray2 objectAtIndex: _myValue] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView21 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_myArray2 objectAtIndex: _myValue] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
                [_btnView21 setImage:img forState:UIControlStateNormal];
                
            }
        }
    }

}


- (IBAction)btn13:(id)sender {
    // SE si verifica che la cella in questione ( 1:3 ) è piena non fare nulla!
    if([self arraySign:0 and:2]){
        if([[_myArray2 objectAtIndex: _myValue] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView13 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_myArray2 objectAtIndex: _myValue] isEqualToString:@"x"]){
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
        if([[_myArray2 objectAtIndex: _myValue] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView12 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_myArray2 objectAtIndex: _myValue] isEqualToString:@"x"]){
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
        if([[_myArray2 objectAtIndex: _myValue] isEqualToString:@"o"]){
            
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView11 setImage:img forState:UIControlStateNormal];
            
            
        }else{
            if([[_myArray2 objectAtIndex: _myValue] isEqualToString:@"x"]){
                UIImage *img = [UIImage imageNamed:@"x.png"];
                [_btnView11 setImage:img forState:UIControlStateNormal];
            
            }
        }
    }else{

    }
    
}


@end
