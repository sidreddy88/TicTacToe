//
//  GameHelpViewController.m
//  TicTacToe
//
//  Created by Siddharth Sukumar on 1/12/14.
//  Copyright (c) 2014 Nicholas Petersen. All rights reserved.
//

#import "GameHelpViewController.h"

@interface GameHelpViewController () 
{
    
    
    __weak IBOutlet UIWebView *myWebView;
    
    
}

@end

@implementation GameHelpViewController


- (IBAction)closingTheModalContoller:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];

    NSURL *url = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Tic-tac-toe"];
    NSURLRequest *rq = [NSURLRequest requestWithURL:url];
    [myWebView loadRequest:rq];
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
