//
//  SpotModel.h
//  ParkingRenter
//
//  Created by Loic Sharma on 12/19/13.
//  Copyright (c) 2013 Loic Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserModel;

@interface SpotModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UserModel *owner;
@property (nonatomic, assign) NSUInteger hourlyRate;

@end
