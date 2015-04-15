//
//  ViewController.m
//  TicTacToe
//
//  Created by angeloasm on 17/03/15.
//  Copyright (c) 2015 (axc111) Angelo Carraggi.  All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController






/**
 * Thi method is called when the user want restart the game.
 * It reset the all variable of the game such as btnView matrix and the variable that the game require.
 */

-(void)restart{
    
    
    [_gE startMatch];
    [self updateTextTurn];
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
    
    [super viewDidLoad];
    _gE = [[gameEngine alloc]init];
    [_gE startMatch];
    NSString *s = [_gE getStringTurn];
    _textTurn.text = s;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)updateTextTurn
{
    NSString *txt = [_gE getStringTurn];
    _textTurn.text = txt;
}

-(void)drawGame
{
    _textTurn.text = @"THE GAME ENDS DRAW";
}

- (IBAction)restartGame:(id)sender {
    [self restart];

}

- (IBAction)btn33:(id)sender {
    // SE si verifica che la cella in questione ( 3:3 ) è piena non fare nulla!
    if ([_gE arraySignPosition:2 col:2]) {
        if ([[_gE getSymbolPlayer] isEqualToString:@"o"]) {
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView33 setImage:img forState:UIControlStateNormal];
        }else{
            UIImage *img = [UIImage imageNamed:@"x.png"];
            [_btnView33 setImage:img forState:UIControlStateNormal];
            
        }
        int areWinner = [_gE changeValueOfTurn];
        if (areWinner == 0) {
            if ([_gE areThereFreePlaces]) {
                [self updateTextTurn];
            }else{
                [self drawGame];
            }
            
            
        }else{
            [self showWinner];
        }
    }
}

- (IBAction)btn32:(id)sender {
    // SE si verifica che la cella in questione ( 3:2 ) è piena non fare nulla!
    if ([_gE arraySignPosition:2 col:1]) {
        if ([[_gE getSymbolPlayer] isEqualToString:@"o"]) {
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView32 setImage:img forState:UIControlStateNormal];
        }else{
            UIImage *img = [UIImage imageNamed:@"x.png"];
            [_btnView32 setImage:img forState:UIControlStateNormal];
            
        }
        int areWinner = [_gE changeValueOfTurn];
        if (areWinner == 0) {
            if ([_gE areThereFreePlaces]) {
                [self updateTextTurn];
            }else{
                [self drawGame];
            }
            
            
        }else{
            [self showWinner];
        }
    }
}

- (IBAction)btn31:(id)sender {
    // SE si verifica che la cella in questione ( 3:1 ) è piena non fare nulla!
    if ([_gE arraySignPosition:2 col:0]) {
        if ([[_gE getSymbolPlayer] isEqualToString:@"o"]) {
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView31 setImage:img forState:UIControlStateNormal];
        }else{
            UIImage *img = [UIImage imageNamed:@"x.png"];
            [_btnView31 setImage:img forState:UIControlStateNormal];
            
        }
        int areWinner = [_gE changeValueOfTurn];
        if (areWinner == 0) {
            if ([_gE areThereFreePlaces]) {
                [self updateTextTurn];
            }else{
                [self drawGame];
            }
            
            
        }else{
            [self showWinner];
        }
    }
}

- (IBAction)btn23:(id)sender {
    // SE si verifica che la cella in questione ( 2:3 ) è piena non fare nulla!
    if ([_gE arraySignPosition:1 col:2]) {
        if ([[_gE getSymbolPlayer] isEqualToString:@"o"]) {
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView23 setImage:img forState:UIControlStateNormal];
        }else{
            UIImage *img = [UIImage imageNamed:@"x.png"];
            [_btnView23 setImage:img forState:UIControlStateNormal];
            
        }
        int areWinner = [_gE changeValueOfTurn];
        if (areWinner == 0) {
            if ([_gE areThereFreePlaces]) {
                [self updateTextTurn];
            }else{
                [self drawGame];
            }
            
            
        }else{
            [self showWinner];
        }
    }
}

- (IBAction)btn22:(id)sender {
    // SE si verifica che la cella in questione ( 2:2 ) è piena non fare nulla!
    if ([_gE arraySignPosition:1 col:1]) {
        if ([[_gE getSymbolPlayer] isEqualToString:@"o"]) {
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView22 setImage:img forState:UIControlStateNormal];
        }else{
            UIImage *img = [UIImage imageNamed:@"x.png"];
            [_btnView22 setImage:img forState:UIControlStateNormal];
            
        }
        int areWinner = [_gE changeValueOfTurn];
        if (areWinner == 0) {
            if ([_gE areThereFreePlaces]) {
                [self updateTextTurn];
            }else{
                [self drawGame];
            }
            
            
        }else{
            [self showWinner];
        }
    }
}

- (IBAction)btn21:(id)sender {
    // SE si verifica che la cella in questione ( 2:1 ) è piena non fare nulla!
    if ([_gE arraySignPosition:1 col:0]) {
        if ([[_gE getSymbolPlayer] isEqualToString:@"o"]) {
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView21 setImage:img forState:UIControlStateNormal];
        }else{
            UIImage *img = [UIImage imageNamed:@"x.png"];
            [_btnView21 setImage:img forState:UIControlStateNormal];
            
        }
        int areWinner = [_gE changeValueOfTurn];
        if (areWinner == 0) {
            if ([_gE areThereFreePlaces]) {
                [self updateTextTurn];
            }else{
                [self drawGame];
            }
            
            
        }else{
            [self showWinner];
        }
    }
}

- (IBAction)btn13:(id)sender {
    // SE si verifica che la cella in questione ( 1:3 ) è piena non fare nulla!
    if ([_gE arraySignPosition:0 col:2]) {
        if ([[_gE getSymbolPlayer] isEqualToString:@"o"]) {
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView13 setImage:img forState:UIControlStateNormal];
        }else{
            UIImage *img = [UIImage imageNamed:@"x.png"];
            [_btnView13 setImage:img forState:UIControlStateNormal];
            
        }
        int areWinner = [_gE changeValueOfTurn];
        if (areWinner == 0) {
            if ([_gE areThereFreePlaces]) {
                [self updateTextTurn];
            }else{
                [self drawGame];
            }
            
            
        }else{
            [self showWinner];
        }
    
    }
}

- (IBAction)btn12:(id)sender {
    // SE si verifica che la cella in questione ( 1:2 ) è piena non fare nulla!
    if ([_gE arraySignPosition:0 col:1]) {
        if ([[_gE getSymbolPlayer] isEqualToString:@"o"]) {
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView12 setImage:img forState:UIControlStateNormal];
        }else{
            UIImage *img = [UIImage imageNamed:@"x.png"];
            [_btnView12 setImage:img forState:UIControlStateNormal];
            
        }
        int areWinner = [_gE changeValueOfTurn];
        if (areWinner == 0) {
            if ([_gE areThereFreePlaces]) {
                [self updateTextTurn];
            }else{
                [self drawGame];
            }
            
            
        }else{
            [self showWinner];
        }
    }

}

/*
 Funzione che gestisce il tasto della cella della matrice del tris di riga 1 e colonna 1
 */

- (IBAction)btn11:(id)sender {
    
    // SE si verifica che la cella in questione ( 1:1 ) è piena non fare nulla!
    if ([_gE arraySignPosition:0 col:0]) {
        if ([[_gE getSymbolPlayer] isEqualToString:@"o"]) {
            UIImage *img = [UIImage imageNamed:@"o.png"];
            [_btnView11 setImage:img forState:UIControlStateNormal];
        }else{
            UIImage *img = [UIImage imageNamed:@"x.png"];
            [_btnView11 setImage:img forState:UIControlStateNormal];

        }
        int areWinner = [_gE changeValueOfTurn];
        NSLog(@"are winner: %i",areWinner);
        if (areWinner == 0) {
            if ([_gE areThereFreePlaces]) {
                 [self updateTextTurn];
            }else{
                [self drawGame];
            }
           
            
        }else{
            
            [self showWinner];
        }
    }
}

/**
 * THIS METHODS STOP ALL INTERACTION WITH UI OF MATRIX OF TIC TAC TOE.
 * INSERT THE TEXT OF WINNER AT THE LABEL _TEXTTURN.
 */
-(void)showWinner
{
    _textTurn.text = [_gE getstringWinner];
    [self blockAllBtn];
}

-(void)blockAllBtn
{
    
}

@end
