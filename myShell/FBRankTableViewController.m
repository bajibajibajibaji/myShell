//
//  FBRankTableViewController.m
//  myShell
//
//  Created by cc on 16/8/12.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "FBRankTableViewController.h"
#import "FBRankTableViewCell.h"
#import "constant.h"

@interface FBRankTableViewController ()

@end

@implementation FBRankTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
}

#pragma mark ----------------UITableViewDataSource--------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FBRankTableViewCell *cell = nil;
    
    if (indexPath.row == 0) {
        cell = [FBRankTableViewCell firstCellWithTableView:tableView];
        
        cell.avatorImage = imageOfAutoScaleImage(@"d2 miss.png");
        cell.usernameString = @"我事用户名";
        cell.coinString = @"1234567";
        cell.rankString = @"99999";
    } else {
        cell = [FBRankTableViewCell otherCellWithTableView:tableView];
        
        cell.avatorImage = imageOfAutoScaleImage(@"d2 miss.png");
        cell.usernameString = @"夜夜夜夜夜983298888888888";
        cell.coinString = @"233333";
        cell.rankString = @"888";
    }
 
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 25*RATIO_V + 40*RATIO + 2;
    } else {
        return 5*RATIO_V + 40*RATIO;
    }
}

@end
