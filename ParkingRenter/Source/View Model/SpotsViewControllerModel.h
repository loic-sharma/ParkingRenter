//
//  SpotsViewControllerModel.h
//  ParkingRenter
//
//  Created by Loic Sharma on 12/19/13.
//  Copyright (c) 2013 Loic Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpotsViewControllerModel : NSObject

@property (nonatomic, strong) NSArray *spots;

-(void)fetchSpots;

@end
