//
//  RCTableViewSource.m
//  RCLibrary
//
//  Created by Ryan Crosby on 10/1/12.
//  Copyright (c) 2012 Ryan Crosby. All rights reserved.
//

#import "RCTableViewSource.h"

@implementation RCTableViewSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"tableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %i", indexPath.row];
    
    return cell;
}



@end
