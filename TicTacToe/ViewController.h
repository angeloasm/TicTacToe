//
//  ViewController.h
//  TicTacToe
//
//  Created by Angelo C on 17/03/15.
//  Copyright (c) 2015 Angelo C. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Foundation;

@interface ViewController : UIViewController
@property (retain, nonatomic) NSString *val;
@property (retain, nonatomic) NSString *user;
@property (retain, nonatomic) NSString *pc;
@property (retain, nonatomic) NSArray  * myArray2;
@property (retain, nonatomic) NSMutableArray  * myArrayTic;
@property (retain, nonatomic) NSString *i;
@property int myValue;
@property (retain, nonatomic) NSString *txtStr;
@property (weak, nonatomic) IBOutlet UILabel *textTurn;

@property (weak, nonatomic) IBOutlet UIButton *btnView12;
@property (weak, nonatomic) IBOutlet UIButton *btnView13;
@property (weak, nonatomic) IBOutlet UIButton *btnView21;
@property (weak, nonatomic) IBOutlet UIButton *btnView22;
@property (weak, nonatomic) IBOutlet UIButton *btnView23;
@property (weak, nonatomic) IBOutlet UIButton *btnView31;
@property (weak, nonatomic) IBOutlet UIButton *btnView32;
@property (weak, nonatomic) IBOutlet UIButton *btnView33;
@property (weak, nonatomic) IBOutlet UIButton *btnView11;

- (IBAction)restartGame:(id)sender;


- (IBAction)btn33:(id)sender;
- (IBAction)btn32:(id)sender;
- (IBAction)btn31:(id)sender;

- (IBAction)btn21:(id)sender;
- (IBAction)btn22:(id)sender;
- (IBAction)btn23:(id)sender;

- (IBAction)btn13:(id)sender;
- (IBAction)btn12:(id)sender;
- (IBAction)btn11:(id)sender;


- (void)changeValueOfTurn;
- (BOOL)isEmpty:(int)index;
-(int)whoWin;

@end
