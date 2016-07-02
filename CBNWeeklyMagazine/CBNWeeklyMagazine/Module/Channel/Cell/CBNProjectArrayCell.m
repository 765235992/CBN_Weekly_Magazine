//
//  CBNProjectArrayCell.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/1.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNProjectArrayCell.h"
#define collection_width (((screen_Width - 45)/4.0)) + 20
@implementation CBNProjectArrayCell

- (void)dealloc
{
    CBNLog(@"正常新闻cell释放了");
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.dk_backgroundColorPicker = DKColorPickerWithKey(默认背景颜色);
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self addSubview:self.projectCollectionView];
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, screen_Width, collection_width/4+15);
        
    }
    
    return self;
}

- (CBNProjectBaseView *)projectCollectionView
{
    if (!_projectCollectionView) {
        
        self.projectCollectionView = [[CBNProjectBaseView alloc] initWithFrame:CGRectMake(0, 0, screen_Width, collection_width )];
        
        
    }
    return _projectCollectionView;
}

//- (void)setChannelNewsModel:(CBNChannelNewsModel *)channelNewsModel
//{
//    _channelNewsModel = channelNewsModel;
//    
//    _channelNewsModel.height = self.frame.size.height;
//}



@end
