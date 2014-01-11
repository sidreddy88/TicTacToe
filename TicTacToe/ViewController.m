//
//  ViewController.m
//  TicTacToe
//
//  Created by Nicholas Petersen on 1/10/14.
//  Copyright (c) 2014 Nicholas Petersen. All rights reserved.
//

#import "ViewController.h"


@interface ViewController () <UIAlertViewDelegate>
{
    
    __weak IBOutlet UILabel *playerWhoWon;
        int numberOfTimesplayed;
    BOOL firstPlayerHasPlayed;
        __weak IBOutlet UILabel *myLabelOne;
        __weak IBOutlet UILabel *myLabelTwo;
        __weak IBOutlet UILabel *myLabelThree;
        __weak IBOutlet UILabel *myLabelFour;
        __weak IBOutlet UILabel *myLabelFive;
        __weak IBOutlet UILabel *myLabelSix;
        __weak IBOutlet UILabel *myLabelSeven;
        __weak IBOutlet UILabel *myLabelEight;
        __weak IBOutlet UILabel *myLabelNine;
        __weak IBOutlet UILabel *whichPlayerLabel;
    }


    

@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    [whichPlayerLabel.text isEqualToString: @"Player One"];
	numberOfTimesplayed = 0;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-  (UILabel *)findLabelUsingPoint:(CGPoint) point {
    UILabel *labelClicked;
    if (CGRectContainsPoint(myLabelOne.frame,  point)){
        labelClicked = myLabelOne;
        
    
    } else if (CGRectContainsPoint(myLabelTwo.frame,  point)){
        labelClicked = myLabelTwo;
    } else if (CGRectContainsPoint(myLabelThree.frame,  point)){
        labelClicked = myLabelThree;

        
    } else if (CGRectContainsPoint(myLabelFour.frame,  point)){
        labelClicked = myLabelFour;

        
    } else if (CGRectContainsPoint(myLabelFive.frame,  point)){
        labelClicked = myLabelFive;

        
    }else if (CGRectContainsPoint(myLabelSix.frame,  point)){
        labelClicked = myLabelSix;

        
    }else if (CGRectContainsPoint(myLabelSeven.frame,  point)){
        labelClicked = myLabelSeven;

        
    }else if (CGRectContainsPoint(myLabelEight.frame,  point)){
        labelClicked = myLabelEight;

        
    }else if (CGRectContainsPoint(myLabelNine.frame,  point)){
        labelClicked = myLabelNine;

    }
    
    return labelClicked;

}





-(IBAction)onLabelTapped:(UITapGestureRecognizer *)tapGestureRecognizer {
    
    
    CGPoint point =  [tapGestureRecognizer locationInView:self.view];
    
    UILabel * labelUsed = [self findLabelUsingPoint:point];
    
    if (labelUsed != nil){
        numberOfTimesplayed++;
    }
    
    
    
    if (numberOfTimesplayed < 10 && labelUsed != nil){
        [self playGame:labelUsed];
    }
    
    playerWhoWon.text = [self whoWon];
    
    NSString *alertWinner = @"";
    
    if ([playerWhoWon.text isEqualToString:@"x"]) {
        
        alertWinner = @"Player One Wins!";
    }
    else if ([playerWhoWon.text isEqualToString:@"o"]) {
        
        alertWinner = @"Player Two Wins!";
    }

    if ([alertWinner isEqualToString:@"Player One Wins!"] || [alertWinner isEqualToString:@"Player Two Wins!"] ){
    

    UIAlertView *winAlert = [[UIAlertView alloc] initWithTitle:nil message:alertWinner delegate:nil cancelButtonTitle:@"Start a new game" otherButtonTitles:nil, nil];
    [winAlert show];
        [self didPresentAlertView:winAlert];
    
    }
    NSLog(@"label clcked = %@", labelUsed);
// whichPlayerIsSelected
    

  }

- (void)didPresentAlertView:(UIAlertView *)alertView {
    numberOfTimesplayed = 0;
    myLabelOne.text = @"";
    myLabelTwo.text = @"";
    myLabelThree.text = @"";
    myLabelFour.text = @"";
    myLabelFive.text = @"";
    myLabelSix.text = @"";
    myLabelSeven.text = @"";
    myLabelEight.text = @"";
    myLabelNine.text = @"";
    [whichPlayerLabel.text isEqualToString: @"Player One"];
    
}

-(void) playGame: (UILabel *) label {
    
    if  ([label.text isEqual: @""]) {
    
    
    
    if (numberOfTimesplayed % 2 != 0){
        label.text = @"x";
        label.textColor = [UIColor blueColor];
    } else {
        label.text = @"o";
        label.textColor = [UIColor redColor];
        
    }
    
    
    if ([label.text isEqualToString:@"x"]){
        whichPlayerLabel.text = @"Player two";
    } else if ([label.text isEqualToString:@"o"]) {
        whichPlayerLabel.text = @"Player one";
       }
    }

    NSLog (@"player = %@", whichPlayerLabel.text);
    
    
    // if (
    
}


-(NSString *) whoWon {
    
    BOOL playerOneWins = NO;
    BOOL playerTwoWins = NO;
    if (([myLabelOne.text isEqualToString:@"x"] && [myLabelTwo.text isEqualToString:@"x"] && [myLabelThree.text isEqualToString:@"x"])
    ||  ([myLabelFour.text isEqualToString:@"x"] && [myLabelFive.text isEqualToString:@"x"] && [myLabelSix.text isEqualToString:@"x"])
        ||  ([myLabelSeven.text isEqualToString:@"x"] && [myLabelEight.text isEqualToString:@"x"] && [myLabelNine.text isEqualToString:@"x"])
        ||  ([myLabelOne.text isEqualToString:@"x"] && [myLabelFour.text isEqualToString:@"x"] && [myLabelSeven.text isEqualToString:@"x"])
        ||  ([myLabelTwo.text isEqualToString:@"x"] && [myLabelFive.text isEqualToString:@"x"] && [myLabelEight.text isEqualToString:@"x"])
        ||  ([myLabelOne.text isEqualToString:@"x"] && [myLabelFive.text isEqualToString:@"x"] && [myLabelNine.text isEqualToString:@"x"])
        ||  ([myLabelThree.text isEqualToString:@"x"] && [myLabelSix.text isEqualToString:@"x"] && [myLabelNine.text isEqualToString:@"x"])
        ||  ([myLabelThree.text isEqualToString:@"x"] && [myLabelFive.text isEqualToString:@"x"] && [myLabelSeven.text isEqualToString:@"x"])){
    
        playerOneWins = YES;
    } else if (([myLabelOne.text isEqualToString:@"o"] && [myLabelTwo.text isEqualToString:@"o"] && [myLabelThree.text isEqualToString:@"o"])
               ||  ([myLabelFour.text isEqualToString:@"o"] && [myLabelFive.text isEqualToString:@"o"] && [myLabelSix.text isEqualToString:@"o"])
               ||  ([myLabelSeven.text isEqualToString:@"o"] && [myLabelEight.text isEqualToString:@"o"] && [myLabelNine.text isEqualToString:@"o"])
               ||  ([myLabelOne.text isEqualToString:@"o"] && [myLabelFour.text isEqualToString:@"o"] && [myLabelSeven.text isEqualToString:@"o"])
               ||  ([myLabelTwo.text isEqualToString:@"o"] && [myLabelFive.text isEqualToString:@"o"] && [myLabelEight.text isEqualToString:@"o"])
               ||  ([myLabelOne.text isEqualToString:@"o"] && [myLabelFive.text isEqualToString:@"o"] && [myLabelNine.text isEqualToString:@"o"])
               ||  ([myLabelThree.text isEqualToString:@"o"] && [myLabelSix.text isEqualToString:@"o"] && [myLabelNine.text isEqualToString:@"o"])
               ||  ([myLabelThree.text isEqualToString:@"o"] && [myLabelFive.text isEqualToString:@"o"] && [myLabelSeven.text isEqualToString:@"o"]) ){
     
               playerTwoWins = YES;
               }
    
    if(playerOneWins){
        return @"x";
    } else if (playerTwoWins){
        return @"o";
    } else {
        return @"Nobody wins";
    }
    
}



@end




