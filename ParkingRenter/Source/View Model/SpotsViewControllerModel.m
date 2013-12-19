//
//  SpotsViewControllerModel.m
//  ParkingRenter
//
//  Created by Loic Sharma on 12/19/13.
//  Copyright (c) 2013 Loic Sharma. All rights reserved.
//

#import "SpotsViewControllerModel.h"
#import "SpotModel.h"

@implementation SpotsViewControllerModel

-(void)fetchSpots {
    SpotModel *spotA = [[SpotModel alloc] init];
    SpotModel *spotB = [[SpotModel alloc] init];
    
    spotA.name = @"Spot A";
    spotB.name = @"Spot B";

    self.spots = @[spotA, spotB];
}

@end
