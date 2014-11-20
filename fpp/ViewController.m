//
//  ViewController.m
//  FPPEnterprise
//
//  Created by Student on 11/16/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    resultsMsg.hidden = true;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)search:(id)sender {
    // Variables needed to set
    bool validPlate = false;
    NSDate *expirationDate = [[NSDate alloc] init];
    NSDate *currentDate = [NSDate date];
    
    // Hide the error message, if not already.
    resultsMsg.hidden = true;
    
    // TODO : Search for plate and update info.
    validPlate = true;
    
    // Show error message, if the plate cannot be found
    resultsMsg.hidden = validPlate;
    
    if (currentDate > expirationDate) {
        // Set text
        expirationMsg.text = @"Parking pass expired at 10:42 PM.";
        
        // Set background
        // TODO
    } else {
        // Set text
        expirationMsg.text = @"Parking pass expires at 10:42 PM.";
        
        // Set background
        // TODO
    }
}



@end
