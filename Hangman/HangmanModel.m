//
//  HangmanModel.m
//  Hangman
//
//  Created by William Wu on 10/13/13.
//  Copyright (c) 2013 William Wu. All rights reserved.
//

#import "HangmanModel.h"
#import "HangmanWords.h"

@implementation HangmanModel

//////////////////////
//// Initialization //
//////////////////////
//
//- (id) init
//{
//    self = [super init];
//    if (self)
//    {
//        numberTries = 10;
//        running = YES;
//        condition = 0; // 1 == win, 0 == neither, -1 == loss
//        attempt = nil;
//        message = [[NSString alloc] init];
//        guesses = [[NSMutableArray alloc] init];
//        indices = [[NSMutableArray alloc] init];
//        word = [[HangmanWords alloc] init];
//    }
//    return self;
//}
//
///////////////
//// Getters //
///////////////
//
//- (BOOL) getRunning
//{
//    return running;
//}
//
//- (NSString *) getMessage
//{
//    return message;
//}
//
//- (NSString *) getAttempt
//{
//    return attempt;
//}
//
//- (NSMutableArray *) getGuesses
//{
//    return guesses;
//}
//
//
//
////////////////
//// Checking //
////////////////
//
//- (void) checkLetter
//{
//    for (int i = 0; i < [guesses count]; i = i + 1)
//    {
//        if ([guesses objectAtIndex: i] == attempt)
//        {
//            message = @"You have already tried this letter. Try again.";
//        }
//    }
//    if (message == nil)
//    {
//        [guesses addObject: attempt];
//    }
//    int prevLength = [indices count];
//    for (int i = 0; i < [term length]; i = i + 1)
//    {
//        if (attempt == [term substringWithRange: NSMakeRange(i, 1)])
//        {
//            [indices addObject: [NSNumber numberWithInt: i]];
//        }
//    }
//    if (prevLength == [indices count])
//    {
//        numberTries = numberTries - 1;
//    }
//}
//
//- (void) checkCondition
//{
//    if (condition == 0)
//    {
//        if ([indices count] == [term length])
//        {
//            condition = 1;
//            message = @"You won. Continue?";
//        }
//        if ([indices count] > numberTries)
//        {
//            condition = -1;
//            message = @"You lost. Continue?";
//        }
//        if (NO) // user clicks no
//        {
//            running = NO;
//        }
//        else
//        {
//            [self restartGame];
//        }
//    }
//}
//
//
/////////////////
//// Resetting //
/////////////////
//
//- (void) clearGuesses
//{
//    [guesses removeAllObjects];
//}
//
//- (void) clearIndices
//{
//    [indices removeAllObjects];
//}
//
//- (void) clearMessage
//{
//    message = nil;
//}
//
//- (void) clearAttempt
//{
//    attempt = nil;
//}
//
//- (void) restartGame
//{
//    [self clearGuesses];
//    [self clearIndices];
//    [self clearMessage];
//    [self clearAttempt];
//    running = YES;
//    condition = 0;
//    numberTries = 10;
//    term = [word getWord];
//}

@end
