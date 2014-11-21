//
//  ViewController.m
//  FPPEnterprise
//
//  Created by Student on 11/16/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "ViewController.h"
#import "ParkingPassHandler.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    resultsMsg.hidden = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)search:(id)sender {
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = @"MMM d, hh:ss a";
    
    // Hide the error message, if not already.
    resultsMsg.hidden = YES;
    
    // TODO : Search for plate and update info.
    [ParkingPassHandler getParkingPassByLicensePlate:licensePlate.text withLotId:@"546f897909c6115461a56e38" withCompletionHandler:^(BOOL success, parkingPass* returnedParkingPass) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            expirationMsg.text = @"";
            
            if(success == YES) {
                if (returnedParkingPass && returnedParkingPass.endDateTime)
                {
                    if ([currentDate compare: returnedParkingPass.endDateTime] == NSOrderedDescending) {
                        expirationMsg.text = [NSString stringWithFormat:@"Parking pass expired at %@", [formatter stringFromDate:returnedParkingPass.endDateTime]];
                    } else {
                        expirationMsg.text = [NSString stringWithFormat:@"Parking pass expires at %@", [formatter stringFromDate:returnedParkingPass.endDateTime]];
                    }
                } else {
                    expirationMsg.text = @"No parking passes found.";
                }
                
            } else {
                    resultsMsg.hidden = NO;
            }
        });
    }];
    

}

// Hide keyboard
- (IBAction)dismissKeyboard{
    [licensePlate resignFirstResponder];
}



@end
