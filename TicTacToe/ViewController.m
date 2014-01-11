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
    
    __weak IBOutlet UILabel *dragLabel;
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

- (IBAction)onDraggingLabel:(UIPanGestureRecognizer*)panGestureRecognizer {
    
    CGPoint point = [panGestureRecognizer translationInView:self.view];
    dragLabel.transform = CGAffineTransformMakeTranslation(point.x, point.y);
    
    
    
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
    
    playerWhoWon.text = [self whoOne];
    
    NSString *alertWinner = @"";
    
    if ([playerWhoWon.text isEqualToString:@"X"]) {
        
        alertWinner = @"Player One Wins!";
    }
    else if ([playerWhoWon.text isEqualToString:@"O"]) {
        
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
        label.text = @"X";
        label.textColor = [UIColor blueColor];
    } else {
        label.text = @"O";
        label.textColor = [UIColor redColor];
        
    }
    
    
    if ([label.text isEqualToString:@"X"]){
        whichPlayerLabel.text = @"Player two";
    } else if ([label.text isEqualToString:@"O"]) {
        whichPlayerLabel.text = @"Player one";
       }
    }

    NSLog (@"player = %@", whichPlayerLabel.text);
    
    
    // if (
    
}


-(NSString *) whoOne {
    
    BOOL playerOneWins = NO;
    BOOL playerTwoWins = NO;
    if (([myLabelOne.text isEqualToString:@"X"] && [myLabelTwo.text isEqualToString:@"X"] && [myLabelThree.text isEqualToString:@"X"])
    ||  ([myLabelFour.text isEqualToString:@"X"] && [myLabelFive.text isEqualToString:@"X"] && [myLabelSix.text isEqualToString:@"X"])
        ||  ([myLabelSeven.text isEqualToString:@"X"] && [myLabelEight.text isEqualToString:@"X"] && [myLabelNine.text isEqualToString:@"X"])
        ||  ([myLabelOne.text isEqualToString:@"X"] && [myLabelFour.text isEqualToString:@"X"] && [myLabelSeven.text isEqualToString:@"X"])
        ||  ([myLabelTwo.text isEqualToString:@"X"] && [myLabelFive.text isEqualToString:@"X"] && [myLabelEight.text isEqualToString:@"X"])
        ||  ([myLabelOne.text isEqualToString:@"X"] && [myLabelFive.text isEqualToString:@"X"] && [myLabelNine.text isEqualToString:@"X"])
        ||  ([myLabelThree.text isEqualToString:@"X"] && [myLabelSix.text isEqualToString:@"X"] && [myLabelNine.text isEqualToString:@"X"])
        ||  ([myLabelThree.text isEqualToString:@"X"] && [myLabelFive.text isEqualToString:@"X"] && [myLabelSeven.text isEqualToString:@"X"])){
    
        playerOneWins = YES;
    } else if (([myLabelOne.text isEqualToString:@"O"] && [myLabelTwo.text isEqualToString:@"O"] && [myLabelThree.text isEqualToString:@"O"])
               ||  ([myLabelFour.text isEqualToString:@")"] && [myLabelFive.text isEqualToString:@"O"] && [myLabelSix.text isEqualToString:@"O"])
               ||  ([myLabelSeven.text isEqualToString:@"O"] && [myLabelEight.text isEqualToString:@"O"] && [myLabelNine.text isEqualToString:@"O"])
               ||  ([myLabelOne.text isEqualToString:@"O"] && [myLabelFour.text isEqualToString:@"O"] && [myLabelSeven.text isEqualToString:@"O"])
               ||  ([myLabelTwo.text isEqualToString:@"O"] && [myLabelFive.text isEqualToString:@"O"] && [myLabelEight.text isEqualToString:@"O"])
               ||  ([myLabelOne.text isEqualToString:@"O"] && [myLabelFive.text isEqualToString:@"O"] && [myLabelNine.text isEqualToString:@"O"])
               ||  ([myLabelThree.text isEqualToString:@"O"] && [myLabelSix.text isEqualToString:@"O"] && [myLabelNine.text isEqualToString:@"O"])
               ||  ([myLabelThree.text isEqualToString:@"O"] && [myLabelFive.text isEqualToString:@"O"] && [myLabelSeven.text isEqualToString:@"O"]) ){
     
               playerTwoWins = YES;
               }
    
    if(playerOneWins){
        return @"X";
    } else if (playerTwoWins){
        return @"O";
    } else {
        return @"Nobody wins";
    }
    
}



@end




