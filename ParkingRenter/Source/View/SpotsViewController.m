//
//  SpotsViewController.m
//  ParkingRenter
//
//  Created by Loic Sharma on 12/19/13.
//  Copyright (c) 2013 Loic Sharma. All rights reserved.
//

#import "SpotsViewController.h"
#import "SpotsViewControllerModel.h"

@interface SpotsViewController ()

@end

@implementation SpotsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Stops";
    
    self.model = [[SpotsViewControllerModel alloc] init];
    [self.model fetchSpots];

    [RACObserve(self.model, spots) subscribeNext:^(NSArray *stops) {
        if (stops) {
            [self.tableView reloadData];
        }
    }];
}

@end
