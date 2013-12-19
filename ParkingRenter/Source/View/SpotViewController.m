//
//  StopViewController.m
//  ParkingRenter
//
//  Created by Loic Sharma on 12/19/13.
//  Copyright (c) 2013 Loic Sharma. All rights reserved.
//

#import "SpotViewController.h"
#import "SpotModel.h"

@interface SpotViewController ()

@end

@implementation SpotViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = self.model.name;
}


@end
