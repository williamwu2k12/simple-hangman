//
//  HangmanViewController.m
//  Hangman
//
//  Created by William Wu on 10/15/13.
//  Copyright (c) 2013 William Wu. All rights reserved.
//

#import "HangmanViewController.h"
#import "HangmanModel.h"
#import "HangmanView.h"

@implementation HangmanViewController

@synthesize phrase;
@synthesize word;
@synthesize guesses;
@synthesize noose;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self restartGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





////////////////////////
//  Helper Functions  //
////////////////////////

- (void) addToGuesses
{
    if ([guesses.text isEqualToString: @"Guesses: "])
    {
        guesses.text = [guesses.text stringByAppendingString: charPressed];
    }
    else
    {
        guesses.text = [guesses.text stringByAppendingString: [@", " stringByAppendingString: charPressed]];
    }
}

- (void) chooseWord
{
    HangmanWords * temp = [[HangmanWords alloc] init];
    phrase = [temp getWord];
}

- (void) createBlanks
{
    for (int i = 0; i < [phrase length]; i = i + 1)
    {
        if (i == 0)
        {
            numberSpaces = 0;
            word.text = [word.text stringByAppendingString: @"_"];
        }
        else
        {
            if ([[phrase substringWithRange: NSMakeRange(i, 1)] isEqualToString: @" "])
            {
                word.text = [word.text stringByAppendingString: @"  "];
                numberSpaces = numberSpaces + 1;
            }
            else
            {
                word.text = [word.text stringByAppendingString: @" _"];
            }
        }
    }
}

- (void) showAlert
{
    UIAlertView * message = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You have already tried this letter. Choose another letter." delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles:nil];
    [message show];
}



//////////////////////
//  Main Functions  //
//////////////////////

- (void) checkWord
{
    int changes = 0;
    if ([[guesses.text substringFromIndex: 7] rangeOfString: charPressed].location != NSNotFound) // assuming everything is uppercase
    {
        [self showAlert];
        changes = -1;
    }
    for (int i = 0; i < [phrase length]; i = i + 1)
    {
//        NSLog(charPressed);
//        NSLog([phrase substringWithRange: NSMakeRange(i, 1)]);
        if ([charPressed isEqualToString: [phrase substringWithRange: NSMakeRange(i, 1)]])
        {
            NSString * before = [word.text substringToIndex: 2 * i + 6];
            NSString * after = [word.text substringFromIndex: 2 * i + 1 + 6];
            word.text = [before stringByAppendingString: [charPressed stringByAppendingString: after]];
//            word.text = [word.text stringByReplacingCharactersInRange:NSMakeRange(i * 2 + 6, 1) withString:charPressed];
            changes = changes + 1;
        }
    }
    if (changes >= 0)
    {
        [self addToGuesses];
    }
    if (changes == 0)
    {
        numberTries = numberTries - 1;
        if (numberTries == 5)
        {
            noose.image = [UIImage imageNamed:@"hang_1@2x.gif"];
        }
        if (numberTries == 4)
        {
            noose.image = [UIImage imageNamed:@"hang_2@2x.gif"];
        }
        if (numberTries == 3)
        {
            noose.image = [UIImage imageNamed:@"hang_3@2x.gif"];
        }
        if (numberTries == 2)
        {
            noose.image = [UIImage imageNamed:@"hang_4@2x.gif"];
        }
        if (numberTries == 1)
        {
            noose.image = [UIImage imageNamed:@"hang_5@2x.gif"];
        }
        if (numberTries == 0)
        {
            noose.image = [UIImage imageNamed:@"hang_6@2x.gif"];
        }
    }
}

- (void) checkCondition
{
    UIAlertView * winningMessage = [[UIAlertView alloc] initWithTitle:@"You won" message:@"Congratulations. Let's play another game." delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles:nil];
    UIAlertView * losingMessage = [[UIAlertView alloc] initWithTitle:@"You lost" message:@"Let's try again." delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles:nil];
    BOOL underscore = NO;
    for (int i = 0; i < [word.text length]; i = i + 1)
    {
        if ([[word.text substringWithRange: NSMakeRange(i, 1)] isEqualToString: @"_"])
        {
            underscore = YES;
        }
    }
    if (underscore == NO)
    {
        condition = 1;
        [winningMessage show];
        [self restartGame];
    }
    if (numberTries <= 0)
    {
        condition = -1;
        [losingMessage show];
        [self restartGame];
    }
}

- (void) restartGame
{
    numberSpaces = 0;
    numberTries = 6;
    condition = 0;
    word.text = @"Word: ";
    guesses.text = @"Guesses: ";
    charPressed = nil;
    noose.image = [UIImage imageNamed: @"hang_0@2x.gif"];
    [self chooseWord];
    [self createBlanks];
//    NSLog(phrase);
}



///////////////////
//  Main Events  //
///////////////////

- (IBAction)buttonPressed:(id)sender {
    [self checkWord];
    [self checkCondition];
}



///////////////////////
//  Key Recognition  //
///////////////////////

- (IBAction)APressed:(id)sender {
    charPressed = @"A";
//    NSLog(@"A Pressed");
}
- (IBAction)BPressed:(id)sender {
    charPressed = @"B";
//    NSLog(@"B Pressed");
}
- (IBAction)CPressed:(id)sender {
    charPressed = @"C";
//    NSLog(@"C Pressed");
}
- (IBAction)DPressed:(id)sender {
    charPressed = @"D";
//    NSLog(@"D Pressed");
}
- (IBAction)EPressed:(id)sender {
    charPressed = @"E";
//    NSLog(@"E Pressed");
}
- (IBAction)FPressed:(id)sender {
    charPressed = @"F";
//    NSLog(@"F Pressed");
}
- (IBAction)GPressed:(id)sender {
    charPressed = @"G";
//    NSLog(@"G Pressed");
}
- (IBAction)HPressed:(id)sender {
    charPressed = @"H";
//    NSLog(@"H Pressed");
}
- (IBAction)IPressed:(id)sender {
    charPressed = @"I";
//    NSLog(@"I Pressed");
}
- (IBAction)JPressed:(id)sender {
    charPressed = @"J";
//    NSLog(@"J Pressed");
}
- (IBAction)KPressed:(id)sender {
    charPressed = @"K";
//    NSLog(@"K Pressed");
}
- (IBAction)LPressed:(id)sender {
    charPressed = @"L";
//    NSLog(@"L Pressed");
}
- (IBAction)MPressed:(id)sender {
    charPressed = @"M";
//    NSLog(@"M Pressed");
}
- (IBAction)NPressed:(id)sender {
    charPressed = @"N";
//    NSLog(@"N Pressed");
}
- (IBAction)OPressed:(id)sender {
    charPressed = @"O";
//    NSLog(@"O Pressed");
}
- (IBAction)PPressed:(id)sender {
    charPressed = @"P";
//    NSLog(@"P Pressed");
}
- (IBAction)QPressed:(id)sender {
    NSLog(@"Q Pressed");
//    charPressed = @"Q";
}
- (IBAction)RPressed:(id)sender {
    charPressed = @"R";
//    NSLog(@"R Pressed");
}
- (IBAction)SPressed:(id)sender {
    charPressed = @"S";
//    NSLog(@"S Pressed");
}
- (IBAction)TPressed:(id)sender {
    charPressed = @"T";
//    NSLog(@"T Pressed");
}
- (IBAction)UPressed:(id)sender {
    charPressed = @"U";
//    NSLog(@"U Pressed");
}
- (IBAction)VPressed:(id)sender {
    charPressed = @"V";
//    NSLog(@"V Pressed");
}
- (IBAction)WPressed:(id)sender {
    charPressed = @"W";
//    NSLog(@"W Pressed");
}
- (IBAction)XPressed:(id)sender {
    charPressed = @"X";
//    NSLog(@"X Pressed");
}
- (IBAction)YPressed:(id)sender {
    charPressed = @"Y";
//    NSLog(@"Y Pressed");
}
- (IBAction)ZPressed:(id)sender {
    charPressed = @"Z";
//    NSLog(@"Z Pressed");
}


/////////////////////
//  Outdated Main  //
/////////////////////

//- (void) main
//{
//    HangmanModel * logic = [[HangmanModel alloc] init];
//    while ([logic getRunning] == YES)
//    {
//        [logic clearMessage];
//        // wait for text input
//        [logic checkLetter];
//        if ([logic getMessage] != nil)
//        {
//            // draw error message on the screen
//            [logic clearMessage];
//            [logic clearAttempt];
//            break;
//        }
//        // draw the correct letters using the indices list
//        [logic checkCondition];
//    }
//}

@end