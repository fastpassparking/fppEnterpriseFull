//
//  ViewController.h
//  FPPEnterprise
//
//  Created by Student on 11/16/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    IBOutlet UITextField *licensePlate;
    IBOutlet UILabel *resultsMsg;
    IBOutlet UIButton *searchBtn;
    IBOutlet UILabel *expirationMsg;
    
}

- (IBAction)search:(id)sender;


@end

