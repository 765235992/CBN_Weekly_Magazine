//
//  JHScrollPageView.m
//  频道切换
//
//  Created by 滑现伟 on 16/5/17.
//  Copyright © 2016年 Aubrey. All rights reserved.
//

#import "JHScrollPageView.h"
@interface JHScrollPageView ()
@property (strong, nonatomic) JHSegmentStyle *segmentStyle;
@property (weak, nonatomic) JHScrollSegmentView *segmentView;
@property (weak, nonatomic) JHContentView *contentView;

@property (weak, nonatomic) UIViewController *parentViewController;
@property (strong, nonatomic) NSArray *childVcs;
@property (strong, nonatomic) NSArray *titlesArray;

@end
@implementation JHScrollPageView

#pragma mark - life cycle

- (instancetype)initWithFrame:(CGRect)frame segmentStyle:(JHSegmentStyle *)segmentStyle childVcs:(NSArray *)childVcs parentViewController:(UIViewController *)parentViewController {
    
    if (self = [super initWithFrame:frame]) {
        self.childVcs = childVcs;
        self.segmentStyle = segmentStyle;
        self.parentViewController = parentViewController;
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    
    NSMutableArray *tempTitles = [NSMutableArray array];
    for (UIViewController *childVc in self.childVcs) {
        NSAssert(childVc.title, @"子控制器的title没有正确设置!!");
        if (childVc.title) {
            [tempTitles addObject:childVc.title];
        }
    }
    
    self.titlesArray = [NSArray arrayWithArray:tempTitles];
    [self addSubview:self.contentView];
    [self addSubview:self.segmentView];
    // 触发懒加载
//
    self.contentView.backgroundColor = [UIColor whiteColor];
}

- (void)dealloc {
    NSLog(@"JHScrollPageView--销毁");
}

#pragma mark - public helper

/** 给外界设置选中的下标的方法 */
- (void)setSelectedIndex:(NSInteger)selectedIndex animated:(BOOL)animated {
    [self.segmentView setSelectedIndex:selectedIndex animated:animated];
}

/**  给外界重新设置视图内容的标题的方法 */
- (void)reloadChildVcsWithNewChildVcs:(NSArray *)newChildVcs {
    
    self.childVcs = nil;
    self.titlesArray = nil;
    self.childVcs = newChildVcs;
    
    NSMutableArray *tempTitles = [NSMutableArray array];
    for (UIViewController *childVc in self.childVcs) {
        NSAssert(childVc.title, @"子控制器的title没有正确设置!!");
        if (childVc.title) {
            [tempTitles addObject:childVc.title];
        }
    }
    self.titlesArray = [NSArray arrayWithArray:tempTitles];
    
    [self.segmentView reloadTitlesWithNewTitles:self.titlesArray];
    [self.contentView reloadAllViewsWithNewChildVcs:self.childVcs];
}


#pragma mark - getter ---- setter

- (JHContentView *)contentView {
    if (!_contentView) {
        JHContentView *content = [[JHContentView alloc] initWithFrame:CGRectMake(0.0, 0, self.bounds.size.width, self.bounds.size.height ) childVcs:self.childVcs segmentView:self.segmentView parentViewController:self.parentViewController];
        [self addSubview:content];
        _contentView = content;
    }
    
    return  _contentView;
}


- (JHScrollSegmentView *)segmentView {
    if (!_segmentView) {
        __weak typeof(self) weakSelf = self;
        JHScrollSegmentView *segment = [[JHScrollSegmentView alloc] initWithFrame:CGRectMake(0, 64, self.bounds.size.width, 35*screen_Width/320) segmentStyle:self.segmentStyle titles:self.titlesArray titleDidClick:^(UILabel *label, NSInteger index) {
            [weakSelf.contentView setContentOffSet:CGPointMake(weakSelf.contentView.bounds.size.width * index, 0.0) animated:NO];
            if (weakSelf.currentTitleInfo!=nil) {
                weakSelf.currentTitleInfo(label,index);
            }
            
        }];
        [self addSubview:segment];
        _segmentView = segment;
    }
    return _segmentView;
}


- (NSArray *)childVcs {
    if (!_childVcs) {
        _childVcs = [NSArray array];
    }
    return _childVcs;
}

- (NSArray *)titlesArray {
    if (!_titlesArray) {
        _titlesArray = [NSArray array];
    }
    return _titlesArray;
}

- (void)setExtraBtnOnClick:(ExtraBtnOnClick)extraBtnOnClick {
    _extraBtnOnClick = extraBtnOnClick;
    self.segmentView.extraBtnOnClick = extraBtnOnClick;
}

- (void)setCurrentTitleInfo:(CurrentTitleInfo)currentTitleInfo
{
    _currentTitleInfo = currentTitleInfo;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
