//
//  ParkingPassHandler.h
//  FastPassParking
//
//  Created by Kerl on 11/2/14.
//  Copyright (c) 2014 FastPassParking. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "parkingPass.h"

@interface ParkingPassHandler : NSObject

+(void) getParkingPassByLicensePlate:(NSString*)plate withLotId: (NSString*) lotId
                 withCompletionHandler:(void(^)(BOOL, parkingPass*))handler;

@end
