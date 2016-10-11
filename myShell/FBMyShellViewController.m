//
//  FBMyShellViewController.m
//  myShell
//
//  Created by cc on 16/8/11.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "FBMyShellViewController.h"
#import "FBRankTableViewController.h"
#import "FBShellRecordTableViewController.h"
#import "constant.h"

@interface FBMyShellViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (strong, nonatomic) UIButton *shellRecordButton;
@property (strong, nonatomic) UILabel  *shellRecordLabel;

@property (strong, nonatomic) UIImageView *crownImageView;
@property (strong, nonatomic) UILabel     *crownLabel;
@property (strong, nonatomic) UILabel     *shellDistanceLabel;

@property (strong, nonatomic) UIImageView *waveImageView;

@property (strong, nonatomic) UIButton    *frendRankButton;
@property (strong, nonatomic) UIButton    *totalRankButton;
@property (strong, nonatomic) UIImageView *buttonFrameImageView;

@property (strong, nonatomic) NSMutableDictionary<NSNumber *, FBRankTableViewController *> *rankTableVCs;
@property (strong, nonatomic) UIPageViewController *pageVC;

@end

@implementation FBMyShellViewController

- (instancetype)init
{
    if (self = [super init]) {
        self.title = @"我的漂贝";
        
        
        // 漂贝记录
        self.shellRecordButton = [[UIButton alloc] init];
        [self.shellRecordButton setImage:imageOfAutoScaleImage(@"d4 rankRecord.png") forState:UIControlStateNormal];
        [self.shellRecordButton addTarget:self action:@selector(recordButtonPress:) forControlEvents:UIControlEventTouchUpInside];
        
        self.shellRecordLabel = [[UILabel alloc] init];
        self.shellRecordLabel.textAlignment = NSTextAlignmentCenter;
        self.shellRecordLabel.numberOfLines = 1;
        self.shellRecordLabel.font = [UIFont systemFontOfSize:11*RATIO weight:UIFontWeightThin];
        self.shellRecordLabel.text = @"漂贝记录";
        self.shellRecordLabel.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *shellRecordLabelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(recordButtonPress:)];
        shellRecordLabelTap.numberOfTapsRequired = 1;
        shellRecordLabelTap.numberOfTouchesRequired = 1;
        [self.shellRecordLabel addGestureRecognizer:shellRecordLabelTap];
        
        // 王冠
        self.crownImageView = imageViewOfAutoScaleImage(@"d4 rank1.png");
        
        self.crownLabel = [[UILabel alloc] init];
        self.crownLabel.textAlignment = NSTextAlignmentCenter;
        self.crownLabel.numberOfLines = 0;
        self.crownLabel.font = [UIFont boldSystemFontOfSize:50 * RATIO];
        self.crownLabel.textColor = [UIColor redColor];
        self.crownLabel.text = @"99";
        self.crownLabel.adjustsFontSizeToFitWidth = YES;
        
        // 王冠下面的label
        self.shellDistanceLabel = [[UILabel alloc] init];
        self.shellDistanceLabel.textAlignment = NSTextAlignmentCenter;
        self.shellDistanceLabel.numberOfLines = 1;
        
        NSAttributedString        *componentStr  = [[NSAttributedString alloc] initWithString:@"距离前一位" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16*RATIO]}];
        NSAttributedString        *componentStr2  = [[NSAttributedString alloc] initWithString:@"1234" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16*RATIO], NSForegroundColorAttributeName:[UIColor colorWithRed:232.0/255 green:60.0/255 blue:46.0/255 alpha:1.0]}];
        NSAttributedString        *componentStr3  = [[NSAttributedString alloc] initWithString:@"漂贝" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16*RATIO]}];
        
        NSMutableAttributedString *stateStr = [[NSMutableAttributedString alloc] initWithString:@""];
        [stateStr appendAttributedString:componentStr];
        [stateStr appendAttributedString:componentStr2];
        [stateStr appendAttributedString:componentStr3];
        
        self.shellDistanceLabel.attributedText = stateStr;
        
        // 浪
        self.waveImageView = imageViewOfAutoScaleImage(@"d4 wave1.png");
        self.waveImageView.layer.contentsCenter = CGRectMake(0, 0.95, 0, 0.5);
        
        // 好友排行
        self.frendRankButton = [[UIButton alloc] init];
        [self.frendRankButton setTitle:@"好友排行" forState:UIControlStateNormal];
        [self.frendRankButton setTitle:@"好友排行" forState:UIControlStateHighlighted];
        [self.frendRankButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.frendRankButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        self.frendRankButton.titleLabel.font = [UIFont systemFontOfSize:16*RATIO];
        [self.frendRankButton addTarget:self action:@selector(frendRandButtonPress:) forControlEvents:UIControlEventTouchUpInside];
        
        // 总排行
        self.totalRankButton = [[UIButton alloc] init];
        [self.totalRankButton setTitle:@"总排行" forState:UIControlStateNormal];
        [self.totalRankButton setTitle:@"总排行" forState:UIControlStateHighlighted];
        [self.totalRankButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.totalRankButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        self.totalRankButton.titleLabel.font = [UIFont systemFontOfSize:16*RATIO];
        [self.totalRankButton addTarget:self action:@selector(totalRandButtonPress:) forControlEvents:UIControlEventTouchUpInside];
        
        // label frame image
        self.buttonFrameImageView = imageViewOfAutoScaleImage(@"d4 frame.png");
        
        // rankTableVCs
        self.rankTableVCs = [NSMutableDictionary dictionaryWithCapacity:2];
        [self viewControllerAtIndex:0];
        [self viewControllerAtIndex:1];
        
        // pageVC
        self.pageVC = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:@{UIPageViewControllerOptionInterPageSpacingKey:@0}];
        [self.pageVC setViewControllers:@[[self viewControllerAtIndex:0]] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
        self.pageVC.dataSource = self;
        self.pageVC.delegate = self;
        

    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    WS(ws);
    
    self.view.backgroundColor = [UIColor colorWithRed:35.0f/255.0f green:205.0f/255.0f blue:250.0f/255.0f alpha:1.0f];
    
    // 漂贝记录
    [self.view addSubview:self.shellRecordButton];
    [self.shellRecordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40*RATIO, 40*RATIO));
        make.top.mas_equalTo(ws.view).offset(64 + 6*RATIO_V);
        make.right.mas_equalTo(ws.view).offset(-40 * RATIO_V);
    }];
    
    [self.view addSubview:self.shellRecordLabel];
    [self.shellRecordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.shellRecordButton);
        make.top.mas_equalTo(ws.shellRecordButton.mas_bottom).offset(1*RATIO_V);
    }];
    
    // 王冠
    [self.view addSubview:self.crownImageView];
    [self.crownImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(162*RATIO, 150*RATIO));
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.view).offset(64 + 6*RATIO_V);
    }];
    
    [self.view addSubview:self.crownLabel];
    [self.crownLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@(55*RATIO));
        make.height.mas_equalTo(@(60*RATIO));
        make.centerX.mas_equalTo(ws.crownImageView);
        make.centerY.mas_equalTo(ws.crownImageView).offset(20 * RATIO);
    }];
    
    // 王冠下面的label
    [self.view addSubview:self.shellDistanceLabel];
    [self.shellDistanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(18*RATIO));
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.crownImageView.mas_bottom).offset(7*RATIO_V);
    }];
    
    // 浪
    [self.view addSubview:self.waveImageView];
    [self.waveImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(ws.view);
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.shellDistanceLabel.mas_bottom).offset(5*RATIO_V);
        make.bottom.mas_equalTo(ws.view);
    }];
    
    // 好友排行
    [self.view addSubview:self.frendRankButton];
    [self.frendRankButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(120*RATIO, 24*RATIO));
        make.right.mas_equalTo(ws.view.centerX).offset(-30*RATIO);
        make.top.mas_equalTo(ws.waveImageView).offset(24*RATIO_V);
    }];
    
    // 总排行
    [self.view addSubview:self.totalRankButton];
    [self.totalRankButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(120*RATIO, 24*RATIO));
        make.left.mas_equalTo(ws.view.centerX).offset(30*RATIO);
        make.top.mas_equalTo(ws.waveImageView).offset(24*RATIO_V);
    }];
    
    // button frame iamge
    [self.view insertSubview:self.buttonFrameImageView belowSubview:self.frendRankButton];
    [self.buttonFrameImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.frendRankButton);
    }];
    
    //pageVC
    [self addChildViewController:self.pageVC];
    [self.view addSubview:self.pageVC.view];
    [self.pageVC didMoveToParentViewController:self];
    [self.pageVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@(370*RATIO));
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.frendRankButton.mas_bottom).offset(7*RATIO_V);
        make.bottom.mas_equalTo(ws.view).offset(-7*RATIO_V);
    }];
}

#pragma mark ------------------button action--------------------
- (void)recordButtonPress:(UIButton *)button
{
    FBShellRecordTableViewController *shellRecordTableVC = [[FBShellRecordTableViewController alloc] init];
    
    [self.navigationController pushViewController:shellRecordTableVC animated:YES];
}

- (void)frendRandButtonPress:(UIButton *)button
{
    [self moveButtonAtIndex:0];
    [self.pageVC setViewControllers:@[[self viewControllerAtIndex:0]] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
}

- (void)totalRandButtonPress:(UIButton *)button
{
    [self moveButtonAtIndex:1];
    [self.pageVC setViewControllers:@[[self viewControllerAtIndex:1]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

#pragma mark ---------------------other---------------------------
- (void)moveButtonAtIndex:(NSInteger)index
{
    WS(ws);
    
    if (index == 0) {
        [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [ws.buttonFrameImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(ws.frendRankButton);
            }];
            
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            [self.view layoutIfNeeded];
            [self.frendRankButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [self.frendRankButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
            [self.totalRankButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self.totalRankButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        }];
    } else if (index == 1) {
        [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [ws.buttonFrameImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(ws.totalRankButton);
            }];
            
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            [self.frendRankButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self.frendRankButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
            [self.totalRankButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [self.totalRankButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        }];
    }
}

-(UIViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (self.rankTableVCs[@(index)] == nil) {
        FBRankTableViewController *tableVC = [[FBRankTableViewController alloc] init];
        tableVC.pageIndex = index;
        
        [self.rankTableVCs setObject:tableVC forKey:@(index)];
    }
    
    return self.rankTableVCs[@(index)];
}

#pragma mark ---------------UIPageViewControllerDataSource>---------------
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((FBRankTableViewController *)viewController).pageIndex;
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    index -= 1;
    
    return [self viewControllerAtIndex:index];
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((FBRankTableViewController *)viewController).pageIndex;
    if (index == NSNotFound || index == 1) {
        return nil;
    }
    index += 1;
    
    return [self viewControllerAtIndex:index];
}

#pragma mark ---------------UIPageViewControllerDelegate>---------------
NSInteger toRankVCIndex;

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers NS_AVAILABLE_IOS(6_0)
{
    toRankVCIndex = ((FBRankTableViewController *)pendingViewControllers[0]).pageIndex;
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed
{
    if (finished == YES && completed == YES) {
        [self moveButtonAtIndex:toRankVCIndex];
    }
}

@end
