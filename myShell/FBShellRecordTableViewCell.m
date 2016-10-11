//
//  FBShellRecordTableViewCell.m
//  myShell
//
//  Created by cc on 16/8/17.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "FBShellRecordTableViewCell.h"
#import "constant.h"

@interface FBShellRecordTableViewCell ()

@property (strong, nonatomic) UIView      *bgView;
@property (strong, nonatomic) UIImageView *actionImageView;
@property (strong, nonatomic) UILabel     *actionLabel;
@property (strong, nonatomic) UILabel     *shellNumLabel;
@property (strong, nonatomic) UILabel     *shellLabel;

@end

@implementation FBShellRecordTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    FBShellRecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shellrecordcell"];
    if (cell == nil) {
        cell = [[FBShellRecordTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"shellrecordcell"];
        
        [cell subInitLayout];
    }
    
    return cell;
}

- (void)subInitLayout
{
    WS(ws);
    
    self.bgView = [[UIView alloc] init];
    self.bgView.backgroundColor = [UIColor colorWithRed:196.0/255 green:244.0/255 blue:255.0/255 alpha:1.0];
    
    self.actionImageView = imageViewOfAutoScaleImage(@"d4 box.png");
    
    self.actionLabel = [[UILabel alloc] init];
    self.actionLabel.textAlignment = NSTextAlignmentLeft;
    self.actionLabel.numberOfLines = 1;
    self.actionLabel.font = [UIFont boldSystemFontOfSize:14];
    self.actionLabel.textColor = [UIColor colorWithRed:0.0 green:80.0/255 blue:100.0/255 alpha:1.0];
    self.actionLabel.text = @"消耗消耗消耗消耗";
    
    self.shellNumLabel = [[UILabel alloc] init];
    self.shellNumLabel.textAlignment = NSTextAlignmentRight;
    self.shellNumLabel.numberOfLines = 1;
    self.shellNumLabel.font = [UIFont boldSystemFontOfSize:14];
    self.shellNumLabel.textColor = [UIColor redColor];
    self.shellNumLabel.text = @"-888";
    
    self.shellLabel = [[UILabel alloc] init];
    self.shellLabel.textAlignment = NSTextAlignmentRight;
    self.shellLabel.numberOfLines = 1;
    self.shellLabel.font = [UIFont boldSystemFontOfSize:14];
    self.shellLabel.textColor = [UIColor colorWithRed:0.0 green:80.0/255 blue:100.0/255 alpha:1.0];
    self.shellLabel.text = @"漂贝";
    
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@300);
        make.centerX.mas_equalTo(ws.contentView);
        make.top.mas_equalTo(ws.contentView);
        make.bottom.mas_equalTo(ws.contentView);
    }];
    
    [self.contentView addSubview:self.actionImageView];
    [self.actionImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.top.mas_equalTo(ws.bgView).offset(6);
        make.left.mas_equalTo(ws.bgView).offset(18);
    }];
    
    [self.contentView addSubview:self.actionLabel];
    [self.actionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@12);
        make.centerY.mas_equalTo(ws.actionImageView);
        make.left.mas_equalTo(ws.actionImageView.mas_right).offset(6);
    }];
    
    [self.contentView addSubview:self.shellLabel];
    [self.shellLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@12);
        make.centerY.mas_equalTo(ws.actionImageView);
        make.right.mas_equalTo(ws.bgView).offset(-18);;
    }];
    
    [self.contentView addSubview:self.shellNumLabel];
    [self.shellNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@12);
        make.centerY.mas_equalTo(ws.actionImageView);
        make.right.mas_equalTo(ws.shellLabel.mas_left);
    }];
}

@end
