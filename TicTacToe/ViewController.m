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


- (BOOL) whoWin {
    int i;
    int diag=0;
    int oriz=0;
    int vert=0;
    
    for (i=0; i<[_myArrayTic count]; i++) {
        id elem = [_myArrayTic objectAtIndex:i];
        NSString *item = (NSString*)elem;
        NSLog(@"whoWin said: %@",item);
        
        
    }
    return YES;
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
    [self whoWin];
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
        NSLog(@"Ciao dalla matrice");
        int i;
        int count=0;
        //Verifico le righe
        for (i=0; i<3; i++) {
            
        }
        //Verifico le colonne
        for (i=0; i<3; i++) {
            
        }
        //Verifico diagonale
        for (i=0; i<3; i++) {
            
        }
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
    }
    
}


@end
