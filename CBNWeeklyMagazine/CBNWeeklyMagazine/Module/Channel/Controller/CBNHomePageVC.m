//
//  CBNHomePageVC.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/27.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNHomePageVC.h"
#import "CBNHomePageNewsRequest.h"
#import "CBNRecommendHeaderView.h"
#import "CBNProjectArrayCell.h"
#import "CBNWebNewsDetailVC.h"


@interface CBNHomePageVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *aTableView;
@property (nonatomic, strong) CBNRecommendHeaderView *headerView;
@property (nonatomic, strong) NSMutableArray *sourceArray;

@end

@implementation CBNHomePageVC

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    self.view.backgroundColor = [UIColor whiteColor];

  
    [self setUpTableView];

    
    
}
#define 添加刷新效果和加载更多效果
- (void)setUpTableView
{
    
    [self.view addSubview:self.aTableView];
    
    _aTableView.tableHeaderView = self.headerView;
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHomePageDataFromSever)];
    
    // 设置文字
    [header setTitle:@"下拉开始刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"正在刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"正在加载中......" forState:MJRefreshStateRefreshing];
    // 设置字体
    header.stateLabel.font = font_px_Medium(fontSize(36.0,36.0,36.0));;
    header.lastUpdatedTimeLabel.font = font_px_Medium(fontSize(32.0,32.0,32.0));;
    // 设置颜色
    header.stateLabel.dk_textColorPicker = DKColorPickerWithKey(新闻大标题字体颜色);
    header.lastUpdatedTimeLabel.dk_textColorPicker = DKColorPickerWithKey(新闻大标题字体颜色);
    // 设置刷新控件
    self.aTableView.mj_header = header;
    [_aTableView.mj_header beginRefreshing];
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreHomePageDataFromSever)];
    [footer setTitle:@" " forState:MJRefreshStateIdle];
    [footer setTitle:@"正在加载更多数据……" forState:MJRefreshStateRefreshing];
    [footer setTitle:@"没有更多数据" forState:MJRefreshStateNoMoreData];
    // 设置字体
    footer.stateLabel.font = font_px_Medium(fontSize(32.0,32.0,32.0));;
    // 设置颜色
    footer.stateLabel.dk_textColorPicker = DKColorPickerWithKey(新闻大标题字体颜色);
    
    // 设置footer
    self.aTableView.mj_footer = footer;
    

}
#define 数据加载和刷新
- (void)refreshHomePageDataFromSever
{
    
    __weak typeof(self) weakSelf = self;
    
    [CBNHomePageNewsRequest GET:[CBNHomePageNewsRequest getHomePageNewsURL] parameters:[CBNHomePageNewsRequest getHomePageNewsParameters] success:^(id result) {
        
        if ([[result objectForKey:@"Code"] integerValue] == 200) {
            
            [self.sourceArray removeAllObjects];

            [_sourceArray addObjectsFromArray:[[[result objectForKey:@"DataList"] objectForKey:@"List"] objectForKey:@"data"]];
            
        }
        [weakSelf refreshFinished];
        
    } failed:^(NSError *error) {
        
    }];
}
- (void)refreshFinished
{
    [_aTableView reloadData];
    [_aTableView.mj_header endRefreshing];
}
- (void)loadMoreHomePageDataFromSever
{
    __weak typeof(self) weakSelf = self;
    
    [CBNHomePageNewsRequest GET:[CBNHomePageNewsRequest getHomePageNewsURL] parameters:[CBNHomePageNewsRequest getHomePageNewsParameters] success:^(id result) {
        if ([[result objectForKey:@"Code"] integerValue] == 200) {
            [_sourceArray addObjectsFromArray:[[[result objectForKey:@"DataList"] objectForKey:@"List"] objectForKey:@"data"]];
        }
        [weakSelf loadMoreFinished];
        
    } failed:^(NSError *error) {
        
    }];
}
- (void)loadMoreFinished
{
    [_aTableView reloadData];
    [_aTableView.mj_footer endRefreshing];
}
#define mark aTableView

- (UITableView *)aTableView
{
    if (!_aTableView) {
        self.aTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_Width, screen_Height)];
        
        _aTableView.contentInset = UIEdgeInsetsMake(64+35.0*screen_Width/320, 0, 0, 0);
        
        _aTableView.delegate = self;
        
        _aTableView.dataSource = self;
    }
    
    return _aTableView;
}
#define markaTableView delegate dataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        static NSString *identifier = @"CBNProjectArrayCell";
        
        CBNProjectArrayCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        __weak typeof(self) weakSelf = self;
        
        if (cell == nil) {
            CBNLog(@"创建");
            
            cell = [[CBNProjectArrayCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            
            cell.projectCollectionView.projectCellClicked = ^(NSIndexPath *indexPath, CBNProjectNewsItemModel *projectModel)
            {
                
                [weakSelf goToWebNewsDetailVCWithProjectNewsItem:projectModel];
                
            };
        }
//        cell.channelNewsModel = channelModel;
//        
//        channelModel = cell.channelNewsModel ;
//        [_sourceArray replaceObjectAtIndex:indexPath.row withObject:channelModel];
        return cell;

    }
    static NSString *str = @"da";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    cell.backgroundColor = [self randomColor];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return (((screen_Width - 45)/4.0)) + 20;
    }
    
    return 50;
}
-(UIColor *) randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
};
- (void)goToWebNewsDetailVCWithProjectNewsItem:(CBNProjectNewsItemModel *)projectNewsItem
{
    CBNWebNewsDetailVC *webNewsDetailVC = [[CBNWebNewsDetailVC alloc]init];
    
    webNewsDetailVC.projectNewsItemModel = projectNewsItem;
    
    [self.navigationController pushViewController:webNewsDetailVC animated:YES];
}
#define markheaderView
- (CBNRecommendHeaderView *)headerView
{
    if (!_headerView) {
        
        self.headerView = [[CBNRecommendHeaderView alloc] initWithFrame:CGRectMake(0, 0, screen_Width, 200 )];
//        __weak typeof(self) weakSelf = self;
        
        _headerView.sliderView.shufflingView.imageViewDidTapAtIndex = ^(CBNShufflingModel *shufflingModel){

        };
        
    }
    
    return _headerView;
}
#define 创建用来装数据的数组
- (NSMutableArray *)sourceArray
{
    if (!_sourceArray) {
        
        self.sourceArray = [[NSMutableArray alloc] init];
        
    }
    
    return _sourceArray;
}
@end