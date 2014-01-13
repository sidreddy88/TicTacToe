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
    
    __weak IBOutlet UILabel *displayShowingIfTimeExpired;
    CGAffineTransform transform;
    
    // variables used for the timer
    int timeLeft;
    __weak IBOutlet UILabel *timerDisplay;
   
    
    }

@property (nonatomic, strong) NSTimer *timer;


    

@end

@implementation ViewController

@synthesize timer;

-(NSTimer *)timer {
    if (!timer){
        
        timer = [NSTimer scheduledTimerWithTimeInterval:1 target: self selector:@selector(countDown) userInfo:nil repeats:YES];
    }
    return timer;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    [whichPlayerLabel.text isEqualToString: @"Player One's turn "];
	numberOfTimesplayed = 0;
    transform = dragLabel.transform;
    dragLabel.text = @"X";
   timeLeft = 15;
   timer = [NSTimer scheduledTimerWithTimeInterval:1 target: self selector:@selector(countDown) userInfo:nil repeats:YES];
    timerDisplay.text = [NSString stringWithFormat:@"Timer: %i", timeLeft];
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
// the method for the NSTimer

-(void) countDown {
    

    timeLeft -= 1;
    timerDisplay.text = [NSString stringWithFormat:@"Timer: %i", timeLeft];
    displayShowingIfTimeExpired.text = @"Be aware of the time";
    
   
    if (timeLeft == 0 && [whichPlayerLabel.text isEqualToString:@"Player One's turn"] ){
        displayShowingIfTimeExpired.text = @"Time expired. You lose your turn";
//        [timer invalidate];
        self.timer = nil;
        
        whichPlayerLabel . text = @"Player Two's turn";
        dragLabel.text = @"O";
        timeLeft = 15;
        
//        [self countDown];
        [self performSelector:@selector(countDown) withObject:nil afterDelay:15.0];
        
        

        
    } else if (timeLeft == 0 && [whichPlayerLabel.text isEqualToString:@"Player Two's turn"]){
        
        displayShowingIfTimeExpired.text = @"Time expired. You lose your turn";
//        [timer invalidate];
        self.timer = nil;
        
        
        
        whichPlayerLabel . text = @"Player One's turn";
        dragLabel.text = @"X";
        timeLeft = 15;
 //       [self countDown];
      [self performSelector:@selector(countDown) withObject:nil afterDelay:15.0];
        
        
        

    }
    
    }
    


- (IBAction)onDraggingLabel:(UIPanGestureRecognizer*)panGestureRecognizer {
    
    
    CGPoint point = [panGestureRecognizer translationInView:self.view];
    dragLabel.transform = CGAffineTransformMakeTranslation(point.x, point.y);
    
    
    point.x += dragLabel.center.x;
    point.y += dragLabel.center.y;
    
    UILabel * labelUsed = [self findLabelUsingPoint:point];
    

   
 
    
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateEnded && labelUsed != nil ){
        
 
        //code for the timer
 //       self.timer = nil;
        
            timeLeft = 15;
        [self countDown];
        
        
/*
        [timer invalidate];
        self.timer = nil;
        
        if (self.timer){
            timeLeft = 5;
            [self countDown];
        }
        
        
       
*/        
       
        NSLog(@"The text is %@", labelUsed.text);
        if ([labelUsed.text isEqualToString:@""]) {
        labelUsed.text = dragLabel.text;
        
        [UIView animateWithDuration:0.5f animations:^{
            
            dragLabel.transform = transform;
        }];
        
        if (labelUsed != nil){
            numberOfTimesplayed++;
        }
            
        // Everytime an X or an O is dragged onto a label, the dragLabel's text needs to be updated
        
            if ([dragLabel.text isEqualToString:@"X"]) {
                dragLabel.text = @"O";
            } else if ([dragLabel.text isEqualToString:@"O"]) {
                dragLabel.text = @"X";
            }
        

        } else {
            [UIView animateWithDuration:0.5f animations:^{
                
                dragLabel.transform = transform;
            }];

            
        }
    }
    
    
    // the following code is to figure out the text of the whichPlayerLabel
    
    if ([labelUsed.text isEqualToString:@"X"]){
        whichPlayerLabel.text = @"Player Two's turn";
    } else if ([labelUsed.text isEqualToString:@"O"]) {
        whichPlayerLabel.text = @"Player One's turn";
    }


    playerWhoWon.text = [self whoOne];
    
    // the following code is for the alert button when somebody wins
    
    NSString *alertWinner = @"";
    
    if ([playerWhoWon.text isEqualToString:@"X"]) {
        
        alertWinner = @"Player One Wins!";
    }
    else if ([playerWhoWon.text isEqualToString:@"O"]) {
        
        alertWinner = @"Player Two Wins!";
    } else if (numberOfTimesplayed == 9 &&  [playerWhoWon.text isEqualToString:@"Nobody has won yet"] ) {
        
        alertWinner = @"Nobody wins the game";
    }
    
    if ([alertWinner isEqualToString:@"Player One Wins!"] || [alertWinner isEqualToString:@"Player Two Wins!"] || [alertWinner isEqualToString:@"Nobody wins the game"] ){
        
        
        UIAlertView *winAlert = [[UIAlertView alloc] initWithTitle:nil message:alertWinner delegate:nil cancelButtonTitle:@"Start a new game" otherButtonTitles:nil, nil];
        [winAlert show];
        [self didPresentAlertView:winAlert];
        
    }
  
    
}

// need to restart the game

- (void)didPresentAlertView:(UIAlertView *)alertView {
    numberOfTimesplayed = 0;
    dragLabel.text = @"X";
    myLabelOne.text = @"";
    myLabelTwo.text = @"";
    myLabelThree.text = @"";
    myLabelFour.text = @"";
    myLabelFive.text = @"";
    myLabelSix.text = @"";
    myLabelSeven.text = @"";
    myLabelEight.text = @"";
    myLabelNine.text = @"";
    [whichPlayerLabel.text isEqualToString: @"Player One's turn"];
    timeLeft = 15;
    playerWhoWon .text = @"Nobody has won yet";

    
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
        return @"Nobody has won yet";
    }
    
}






/*

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
*/

/*

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

*/

@end




