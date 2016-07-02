//
//  CBNRecommendSliderView.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/30.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNRecommendSliderView.h"

@implementation CBNRecommendSliderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.shufflingView];
        
    }
    return self;
}

- (CBNBaseShufflingView *)shufflingView
{
    if (!_shufflingView) {
        
        self.shufflingView = [[CBNBaseShufflingView alloc] initWithFrame:self.bounds andDefaultImage:[UIImage imageNamed:@"1111.jpg"]];
        
        _shufflingView.AutoScrollDelay = 5.0f;
        
        _shufflingView.style = PageControlAtCenter;
        __weak typeof(self) weakSelf = self;
        
        NSMutableArray *arr1 = [NSMutableArray array];
        
        /*
         *  设置默认的数量以及对应的内容
         */
        for (NSInteger i = 0; i < 5; i++) {
            
            CBNShufflingModel *itemModel = [[CBNShufflingModel alloc] init];
            
            itemModel.newsThumbStr =@" ";
            
            itemModel.newsTitleStr = @" ";
            
            itemModel.newsDefaultImage = [UIImage imageNamed:@"defaultImage.jpg"];
            
            itemModel.index = i;
            
            [arr1 addObject:itemModel];
            
        }
        
        _shufflingView.sourceModelArray = arr1;
        
        
        
        [_shufflingView setImageViewDidTapAtIndex:^(CBNShufflingModel *shufflingModel) {
            
            NSLog(@" %ld  ",(long)shufflingModel.index);
            
        }];
        
    }
    return _shufflingView;
}


@end
