//
//  MEMenuViewController.m
//  TransitionFun
//
//  Created by Michael Enriquez on 10/27/13.
//  Copyright (c) 2013 Mike Enriquez. All rights reserved.
//

#import "MEMenuViewController.h"
#import "ECSlidingSegue.h"

@interface MEMenuViewController ()
@property (nonatomic, strong) NSArray *menuItems;
@end

@implementation MEMenuViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ECSlidingSegue *slidingSegue = (ECSlidingSegue *)segue;
    slidingSegue.skipSettingTopViewController = YES;
}

#pragma mark - Properties

- (NSArray *)menuItems {
    if (_menuItems) return _menuItems;
    
    _menuItems = @[@"Transitions", @"Noop 1", @"Noop 2"];
    
    return _menuItems;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"MenuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSString *menuItem = self.menuItems[indexPath.row];
    
    cell.textLabel.text = menuItem;
    
    return cell;
}

@end
