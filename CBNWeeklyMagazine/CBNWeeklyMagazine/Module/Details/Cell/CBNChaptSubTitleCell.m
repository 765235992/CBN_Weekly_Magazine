//
//  CBNChaptSubTitleCell.m
//  CBNMagazine
//
//  Created by huaxianwei on 16/6/19.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNChaptSubTitleCell.h"

@implementation CBNChaptSubTitleCell

- (void)dealloc
{
    NSLog(@"释放%@",self);
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.blockTextView];
        
    }
    
    return self;
}

- (CBNChaptBlockTextView *)blockTextView
{
    if (!_blockTextView) {
        
        self.blockTextView = [[CBNChaptBlockTextView alloc] initWithFrame:CGRectMake(screen_Width*0.05, 10, screen_Width-2*screen_Width*0.05, 0)];
        _blockTextView.backgroundColor = [UIColor clearColor];

        _blockTextView.font = font_px_Medium(fontSize(52.0,42.0,38.0));
        
        
        [_blockTextView CBNChaptKeyWordClicked:^(NSDictionary *keyWordInfo) {
            
        } copyAction:^(NSDictionary *copyInfo) {
            
        } readPressedAction:^(NSDictionary *readPressedInfo) {
            
        } cancleReadPressedAction:^(NSDictionary *cancleReadPressedInfo) {
            
        }];
    }
    
    return _blockTextView;
}



- (void)setChaptBlockModel:(CBNChaptBlockModel *)chaptBlockModel
{
    
    
    _chaptBlockModel = chaptBlockModel;
    
    _blockTextView.chaptBlockModel = chaptBlockModel;
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, _blockTextView.frame.size.height + 10);
    
    _chaptBlockModel.height =  _blockTextView.frame.size.height;
    [self setNeedsDisplay];
    
    [self setNeedsLayout];
    
}






@end
