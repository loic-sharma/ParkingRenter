//
//  SpotsViewController.m
//  ParkingRenter
//
//  Created by Loic Sharma on 12/19/13.
//  Copyright (c) 2013 Loic Sharma. All rights reserved.
//

#import "SpotsViewController.h"
#import "SpotsViewControllerModel.h"
#import "SpotViewController.h"
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

#pragma UITableView view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:SegueViewStop sender:self];
}

#pragma UIStoryboard

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:SegueViewStop]) {
        SpotViewController *controller = (SpotViewController *)segue.destinationViewController;
        SpotModel *spot = self.model.spots[[self.tableView indexPathForSelectedRow].row];

        controller.model = spot;
    }
}


@end
