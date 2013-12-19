//
//  SpotsViewController.m
//  ParkingRenter
//
//  Created by Loic Sharma on 12/19/13.
//  Copyright (c) 2013 Loic Sharma. All rights reserved.
//

#import "SpotsViewController.h"
#import "SpotsViewControllerModel.h"
#import "SpotModel.h"

@interface SpotsViewController ()

@end

@implementation SpotsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Stops";
    
    self.model = [[SpotsViewControllerModel alloc] init];
    [self.model fetchSpots];

    [RACObserve(self.model, spots) subscribeNext:^(NSArray *spots) {
        if (spots) {
            [self.tableView reloadData];
        }
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Find a parking spot";
    }
    
    return nil;
}

#pragma UITableView data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(self.model.spots.count == 0) {
        return 1;
    }
    
    return self.model.spots.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StopCell"];
    
    if(self.model.spots.count == 0) {
        cell.textLabel.text = @"No spots!";
    }
    else {
        SpotModel *spot = self.model.spots[indexPath.row];

        cell.textLabel.text = spot.name;
    }
    
    return cell;
}

@end
