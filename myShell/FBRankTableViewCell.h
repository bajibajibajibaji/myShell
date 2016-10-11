//
//  FBRankTableViewCell.h
//  myShell
//
//  Created by cc on 16/8/15.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FBRankTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImage  *avatorImage;
@property (copy,   nonatomic) NSString *usernameString;
@property (copy,   nonatomic) NSString *coinString;
@property (copy,   nonatomic) NSString *rankString;

+ (instancetype)firstCellWithTableView:(UITableView *)tableView;
+ (instancetype)otherCellWithTableView:(UITableView *)tableView;

@end
