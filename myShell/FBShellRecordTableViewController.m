//
//  FBShellRecordTableViewController.m
//  myShell
//
//  Created by cc on 16/8/17.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "FBShellRecordTableViewController.h"
#import "FBShellRecordTableViewCell.h"
#import "constant.h"

@interface FBShellRecordTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation FBShellRecordTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    
    self.title = @"漂贝记录";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor colorWithRed:35.0f/255.0f green:205.0f/255.0f blue:250.0f/255.0f alpha:1.0f];
    
    self.tableView =[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@(SCREEN_WIDTH));
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.view).offset(64+6*RATIO_V);
        make.bottom.mas_equalTo(ws.view);
    }];
}


#pragma mark ----------------UITableViewDataSource--------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FBShellRecordTableViewCell *cell = [FBShellRecordTableViewCell cellWithTableView:tableView];
    
    return cell;
}

#pragma mark ----------------UITableViewDelegate--------------
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 47;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 16;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    
    UIImageView *waveImageView = imageViewOfAutoScaleImage(@"d4 wave2.png");
    waveImageView.layer.contentsCenter = CGRectMake(0, 0.95, 0, 0.5);
    
    UIImageView *dateIconImageView = imageViewOfAutoScaleImage(@"d4 calendar.png");
    
    UILabel *dateLabel = [[UILabel alloc] init];
    dateLabel.textAlignment = NSTextAlignmentLeft;
    dateLabel.numberOfLines = 1;
    dateLabel.font = [UIFont boldSystemFontOfSize:15];
    dateLabel.textColor = [UIColor colorWithRed:0.0 green:80.0/255 blue:100.0/255 alpha:1.0];
    dateLabel.text = @"2020-20-20";
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor colorWithRed:20.0/255 green:149.0/255 blue:183.0/255 alpha:1.0];
    
    [headerView addSubview:waveImageView];
    [waveImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 47));
        make.centerX.mas_equalTo(headerView);
        make.top.mas_equalTo(headerView);
    }];
    
    [headerView addSubview:dateIconImageView];
    [dateIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.top.mas_equalTo(waveImageView).offset(20);
        make.left.mas_equalTo(waveImageView).offset(18);
    }];
    
    [headerView addSubview:dateLabel];
    [dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@12);
        make.top.mas_equalTo(waveImageView).offset(24);
        make.left.mas_equalTo(dateIconImageView.mas_right).offset(6);
    }];
    
    [headerView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(270, 1));
        make.centerX.mas_equalTo(waveImageView);
        make.bottom.mas_equalTo(waveImageView);
    }];
    
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] init];
    
    UIImageView *waveImageView = imageViewOfAutoScaleImage(@"d4 wave3.png");
    [footerView addSubview:waveImageView];
    [waveImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 6));
        make.centerX.mas_equalTo(footerView);
        make.top.mas_equalTo(footerView);
    }];
    
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 26.0;
}

@end
