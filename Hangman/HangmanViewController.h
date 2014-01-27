//
//  HangmanViewController.h
//  Hangman
//
//  Created by William Wu on 10/15/13.
//  Copyright (c) 2013 William Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HangmanViewController : UIViewController
{
    NSString * charPressed;
    int numberSpaces;
    int numberTries;
    int condition;
}

@property NSString *phrase;
@property (weak, nonatomic) IBOutlet UIImageView *noose;
@property (weak, nonatomic) IBOutlet UILabel *word;
@property (weak, nonatomic) IBOutlet UILabel *guesses;


- (void) addToGuesses;
- (void) chooseWord;
- (void) createBlanks;
- (void) showAlert;

- (void) checkWord;
- (void) checkCondition;
- (void) restartGame;


- (IBAction)buttonPressed:(id)sender;

- (IBAction)APressed:(id)sender;
- (IBAction)BPressed:(id)sender;
- (IBAction)CPressed:(id)sender;
- (IBAction)DPressed:(id)sender;
- (IBAction)EPressed:(id)sender;
- (IBAction)FPressed:(id)sender;
- (IBAction)GPressed:(id)sender;
- (IBAction)HPressed:(id)sender;
- (IBAction)IPressed:(id)sender;
- (IBAction)JPressed:(id)sender;
- (IBAction)KPressed:(id)sender;
- (IBAction)LPressed:(id)sender;
- (IBAction)MPressed:(id)sender;
- (IBAction)NPressed:(id)sender;
- (IBAction)OPressed:(id)sender;
- (IBAction)PPressed:(id)sender;
- (IBAction)QPressed:(id)sender;
- (IBAction)RPressed:(id)sender;
- (IBAction)SPressed:(id)sender;
- (IBAction)TPressed:(id)sender;
- (IBAction)UPressed:(id)sender;
- (IBAction)VPressed:(id)sender;
- (IBAction)WPressed:(id)sender;
- (IBAction)XPressed:(id)sender;
- (IBAction)YPressed:(id)sender;
- (IBAction)ZPressed:(id)sender;


@end
