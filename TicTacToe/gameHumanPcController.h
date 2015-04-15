//
//  UIViewController+gameHumanPc.h
//  TicTacToe
//
//  Created by Angelo C on 07/04/15.
//  Copyright (c) 2015 (axc111) Angelo Carraggi.  All rights reserved.
//

#import <UIKit/UIKit.h>
@import Foundation;

@interface gameHumanPcController : UIViewController


@property (retain, nonatomic) NSArray  *arrayOfSymbol;
@property (retain, nonatomic) NSArray  *arrayOfPlayers;
@property int player;
@property int turn;
@property (retain, nonatomic) NSString *txtStr;


@property (weak, nonatomic) IBOutlet UILabel *lblInfo;


/**
 * Declare the button view of matrix 
 */
@property (weak, nonatomic) IBOutlet UIButton *btnView11;
@property (weak, nonatomic) IBOutlet UIButton *btnView12;
@property (weak, nonatomic) IBOutlet UIButton *btnView13;
@property (weak, nonatomic) IBOutlet UIButton *btnView21;
@property (weak, nonatomic) IBOutlet UIButton *btnView22;
@property (weak, nonatomic) IBOutlet UIButton *btnView23;

@property (weak, nonatomic) IBOutlet UIButton *btnView31;
@property (weak, nonatomic) IBOutlet UIButton *btnView32;
@property (weak, nonatomic) IBOutlet UIButton *btnView33;



/**
 * Declare action for all btn contains in the matrix.
 */

- (IBAction)btn11:(id)sender;
- (IBAction)btn12:(id)sender;
- (IBAction)btn13:(id)sender;
- (IBAction)btn21:(id)sender;
- (IBAction)btn22:(id)sender;
- (IBAction)btn23:(id)sender;
- (IBAction)btn31:(id)sender;
- (IBAction)btn32:(id)sender;
- (IBAction)btn33:(id)sender;

/**
 * Declare methods with you can control the pc turn
 */

-(void)choosePosition;




@end
