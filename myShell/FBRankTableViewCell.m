//
//  FBRankTableViewCell.m
//  myShell
//
//  Created by cc on 16/8/15.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "FBRankTableViewCell.h"
#import "constant.h"

@interface FBRankTableViewCell ()

@property (strong, nonatomic) UIView *topLinesView;

@property (strong, nonatomic) UIView *rankInfoView;
    @property (strong, nonatomic) UIImageView *avatorImageView;
    @property (strong, nonatomic) UILabel     *usernameLabel;
    @property (strong, nonatomic) UIImageView *coinIconImageView;
    @property (strong, nonatomic) UILabel     *coinLabel;
    @property (strong, nonatomic) UIImageView *rankIconImageView;
    @property (strong, nonatomic) UILabel     *rankLabel;

@property (strong, nonatomic) UIView *bottomLinesView;

@end

@implementation FBRankTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

+ (instancetype)firstCellWithTableView:(UITableView *)tableView
{
    FBRankTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rankfirstcell"];
    if (cell == nil) {
        cell = [[FBRankTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"rankfirstcell"];
    
        cell.topLinesView = [[UIView alloc] init];
        cell.topLinesView.backgroundColor = [UIColor colorWithRed:20.0/255 green:149.0/255 blue:183.0/255 alpha:1.0];
        
        cell.rankInfoView = [[UIView alloc] init];
        [cell rankInfoViewSubInit];
        
        cell.bottomLinesView = [[UIView alloc] init];
        cell.bottomLinesView.backgroundColor = [UIColor colorWithRed:20.0/255 green:149.0/255 blue:183.0/255 alpha:1.0];
        
        
        [cell.contentView addSubview:cell.topLinesView];
        [cell.topLinesView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(370*RATIO, 1));
            make.centerX.mas_equalTo(cell.contentView);
            make.top.mas_equalTo(cell.contentView);
        }];
        
        [cell.contentView addSubview:cell.rankInfoView];
        [cell.rankInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(351*RATIO, 40*RATIO));
            make.top.mas_equalTo(cell.topLinesView.mas_bottom).offset(10*RATIO_V);
            make.left.mas_equalTo(cell.contentView).offset(9.5*RATIO);
        }];
        
        [cell rankInfoViewSubLayout];
        
        [cell.contentView addSubview:cell.bottomLinesView];
        [cell.bottomLinesView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(370*RATIO, 1));
            make.centerX.mas_equalTo(cell.contentView);
            make.top.mas_equalTo(cell.rankInfoView.mas_bottom).offset(10*RATIO_V);
        }];
    }
    
    return cell;
}

+ (instancetype)otherCellWithTableView:(UITableView *)tableView
{
    FBRankTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rankothercell"];
    if (cell == nil) {
        cell = [[FBRankTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"rankothercell"];
        
        cell.rankInfoView = [[UIView alloc] init];
        [cell rankInfoViewSubInit];
        
        
        [cell.contentView addSubview:cell.rankInfoView];
        [cell.rankInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(351*RATIO, 40*RATIO));
            make.top.mas_equalTo(cell.contentView).offset(5*RATIO_V);
            make.left.mas_equalTo(cell.contentView).offset(9.5*RATIO);
        }];
        
        [cell rankInfoViewSubLayout];
    }
    
    return cell;
}

- (void)rankInfoViewSubInit
{
    if (self.rankInfoView != nil) {
        self.avatorImageView = [[UIImageView alloc] init];
        self.avatorImageView.layer.cornerRadius = 20.0*RATIO;
        self.avatorImageView.layer.masksToBounds = YES;
        self.avatorImageView.backgroundColor = [UIColor whiteColor];  // test by cc
        
        self.usernameLabel = [[UILabel alloc] init];
        self.usernameLabel.textAlignment = NSTextAlignmentLeft;
        self.usernameLabel.numberOfLines = 1;
        self.usernameLabel.font = [UIFont systemFontOfSize:15*RATIO];
        
        self.coinIconImageView = imageViewOfAutoScaleImage(@"d4 coin.png");;
        
        self.coinLabel = [[UILabel alloc] init];
        self.coinLabel.textAlignment = NSTextAlignmentLeft;
        self.coinLabel.numberOfLines = 1;
        self.coinLabel.font = [UIFont systemFontOfSize:15*RATIO];
        
        self.rankIconImageView = imageViewOfAutoScaleImage(@"d4 rank.png");
        
        self.rankLabel = [[UILabel alloc] init];
        self.rankLabel.textAlignment = NSTextAlignmentLeft;
        self.rankLabel.numberOfLines = 1;
        self.rankLabel.font = [UIFont systemFontOfSize:15*RATIO];
        
    }
}

- (void)rankInfoViewSubLayout
{
    WS(ws);
    
    if (self.rankInfoView != nil) {
        [self.rankInfoView addSubview:self.avatorImageView];
        [self.avatorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(40*RATIO, 40*RATIO));
            make.centerY.mas_equalTo(ws.rankInfoView);
            make.left.mas_equalTo(ws.rankInfoView);
        }];
        
        [self.rankInfoView addSubview:self.usernameLabel];
        [self.usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(120*RATIO, 20*RATIO));
            make.left.mas_equalTo(ws.avatorImageView.mas_right).offset(10*RATIO);
            make.centerY.mas_equalTo(ws.rankInfoView);
        }];
        
        [self.rankInfoView addSubview:self.coinIconImageView];
        [self.coinIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(20*RATIO, 20*RATIO));
            make.left.mas_equalTo(ws.usernameLabel.mas_right).offset(10*RATIO);
            make.centerY.mas_equalTo(ws.rankInfoView);
        }];
        
        [self.rankInfoView addSubview:self.coinLabel];
        [self.coinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(70*RATIO, 20*RATIO));
            make.left.mas_equalTo(ws.coinIconImageView.mas_right).offset(3*RATIO);
            make.centerY.mas_equalTo(ws.rankInfoView);
        }];
        
        [self.rankInfoView addSubview:self.rankIconImageView];
        [self.rankIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(20*RATIO, 20*RATIO));
            make.left.mas_equalTo(ws.coinLabel.mas_right).offset(10*RATIO);
            make.centerY.mas_equalTo(ws.rankInfoView);
        }];
        
        [self.rankInfoView addSubview:self.rankLabel];
        [self.rankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(70*RATIO, 20*RATIO));
            make.left.mas_equalTo(ws.rankIconImageView.mas_right).offset(3*RATIO);
            make.centerY.mas_equalTo(ws.rankInfoView);
        }];
    }
}

- (void)setAvatorImage:(UIImage *)avatorImage
{
    _avatorImage = avatorImage;
    self.avatorImageView.image = _avatorImage;
}

- (void)setUsernameString:(NSString *)usernameString
{
    _usernameString = usernameString;
    self.usernameLabel.text = _usernameString;
}

- (void)setCoinString:(NSString *)coinString
{
    _coinString = coinString;
    self.coinLabel.text = _coinString;
}

- (void)setRankString:(NSString *)rankString
{
    _rankString = rankString;
    self.rankLabel.text = _rankString;
}

@end
