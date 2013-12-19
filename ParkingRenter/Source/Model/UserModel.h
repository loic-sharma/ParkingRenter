//
//  UserModel.h
//  ParkingRenter
//
//  Created by Loic Sharma on 12/19/13.
//  Copyright (c) 2013 Loic Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSArray *spots;
@property (nonatomic, strong) NSArray *ratings;

@end
