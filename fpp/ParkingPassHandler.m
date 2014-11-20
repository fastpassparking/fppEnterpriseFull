//
//  ParkingPassHandler.m
//  FastPassParking
//
//  Created by Kerl on 11/2/14.
//  Copyright (c) 2014 FastPassParking. All rights reserved.
//

#import "ParkingPassHandler.h"
#import "httpRequestHandler.h"

@implementation ParkingPassHandler


+(void) getParkingPassByLicensePlate:(NSString*)plate withLotId: (NSString*) lotId
               withCompletionHandler:(void(^)(BOOL, parkingPass*))handler {
    
    NSString* endUrl = [NSString stringWithFormat:@"parkingPass/byLicensePlate?licensePlate=%@&lot_id=%@", plate, lotId];
    
    [HttpRequestHandler httpGetRequest:endUrl withCompletionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        BOOL wasSuccessful = NO;
        parkingPass* pass = nil;
        if(!error) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
            if(httpResponse.statusCode == 200) {
                
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                // Parse the vehicles from json data
                pass = [pass initWithJson:dict];
                
                // Set the completionHandler response
                wasSuccessful = YES;
            } else {
                // Make user aware that
                NSLog(@"Error code: %ld", (long)httpResponse.statusCode);
            }
        } else {
            NSLog(@"Error");
        }
        
        // Return the completion handler to the caller
        handler(wasSuccessful, pass);
    }];
    
}

@end
