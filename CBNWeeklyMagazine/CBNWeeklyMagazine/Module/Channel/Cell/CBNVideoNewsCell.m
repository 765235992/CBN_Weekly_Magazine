//
//  CBNVideoNewsCell.m
//  CBNMagazine
//
//  Created by Jim on 16/6/17.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNVideoNewsCell.h"
#import "CBNImageAndTextLabel.h"
#define imageView_Height 0.4*(320-20)*screen_Width/320

@interface CBNVideoNewsCell ()
@property (nonatomic, strong) CBNImageView *newsThumbImageView;

@property (nonatomic, strong) CBNLabel *newsTitleLabel;

@property (nonatomic, strong) UILabel *timelabel;

@property (nonatomic, strong) UIImageView *playImageView;

@property (nonatomic, strong) UIImageView *lineImageView;

@property (nonatomic, strong) CBNImageAndTextLabel *praiseLabel;

@property (nonatomic, strong) CBNImageAndTextLabel *commentsCountLabel;

@property (nonatomic, strong) CBNImageAndTextLabel *videoTimeLabel;

@property (nonatomic, strong) CBNImageView *videoIconImageView;

@end
@implementation CBNVideoNewsCell
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
        
        [self addSubview:self.newsThumbImageView];
        
        [self addSubview:self.newsTitleLabel];
        
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, _newsTitleLabel.frame.origin.y + _newsTitleLabel.frame.size.height+10);
        [self addSubview:self.lineImageView];

    }
    
    return self;
}

- (CBNImageView *)newsThumbImageView
{
    if (!_newsThumbImageView) {
        
        self.newsThumbImageView = [[CBNImageView alloc] initWithFrame:CGRectMake(10, 15, screen_Width-20, imageView_Height)];
        
        _newsThumbImageView.image = [UIImage imageNamed:@"defaultImage.jpg"];
        _newsThumbImageView.nightMaskImageView.dk_backgroundColorPicker= DKColorPickerWithColors(RGBColor(0, 0, 0, 0.26),RGBColor(0, 0, 0, 0.5),RGBColor(0, 0, 0, 0.26));

        [_newsThumbImageView addSubview:self.playImageView];
        
        _playImageView.center = CGPointMake((screen_Width-20)/2, imageView_Height/2 );
        
        [_newsThumbImageView addSubview:self.videoTimeLabel];
        
        [_newsThumbImageView addSubview:self.praiseLabel];
        
        [_newsThumbImageView addSubview:self.commentsCountLabel];
        
        [_newsThumbImageView addSubview:self.timelabel];

        [_newsThumbImageView addSubview:self.videoIconImageView];
    }
    
    return _newsThumbImageView;
}
- (CBNImageView *)videoIconImageView
{
    if (!_videoIconImageView) {
        
        self.videoIconImageView = [[CBNImageView alloc] initWithFrame:CGRectMake(10, 8, 23*screen_Width/320, 18*screen_Width/320)];
        
        _videoIconImageView.backgroundColor = [UIColor clearColor];
        
        _videoIconImageView.dk_imagePicker = DKImagePickerWithImages([UIImage imageNamed:@"video_white_Day.png"],[UIImage imageNamed:@"video_white_Day.png"],[UIImage imageNamed:@"video_white_Day.png"]);
    }
    
    return _videoIconImageView;
}
- (UILabel *)timelabel
{
    if (!_timelabel) {
        
        self.timelabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        
        _timelabel.dk_textColorPicker = DKColorPickerWithKey(图片上的默认标签字体颜色);
        
        _timelabel.font = font_px_Medium(fontSize(36.0,31.0,26.0));
        
        _timelabel.numberOfLines = 0;
    }
    
    return _timelabel;
}
- (UIImageView *)playImageView
{
    if (!_playImageView) {
        
        self.playImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 44*screen_Width/320, 44*screen_Width/320)];
        
        _playImageView.backgroundColor = RGBColor(0, 0, 0, 0);
        
        _playImageView.dk_imagePicker = DKImagePickerWithImages([UIImage imageNamed:@"play_pause_Day.png"],[UIImage imageNamed:@"play_pause_Day.png"],[UIImage imageNamed:@"play_pause_Day.png"]);

    }
    
    return _playImageView;
}
- (CBNLabel *)newsTitleLabel
{
    if (!_newsTitleLabel) {
        
        self.newsTitleLabel = [[CBNLabel alloc] initWithFrame:CGRectMake( 10, imageView_Height + 30, screen_Width - 20, 0)];
        _newsTitleLabel.dk_textColorPicker = DKColorPickerWithKey(新闻大标题字体颜色);
        
        _newsTitleLabel.font = font_px_Medium(fontSize(44.0,40.0,36.0));
        
        _newsTitleLabel.lineSpace = 2.0;
        
        _newsTitleLabel.numberOfLines = 0;

        }
    
    return _newsTitleLabel;
}
- (CBNImageAndTextLabel *)videoTimeLabel
{
    if (!_videoTimeLabel) {
        
        self.videoTimeLabel = [[CBNImageAndTextLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) image:[RGBColor(102, 198, 118, 1.0) colorImage]];
        
        _videoTimeLabel.contentLabel.dk_textColorPicker = DKColorPickerWithKey(图片上的默认标签字体颜色);
        
        _videoTimeLabel.iconImageView.dk_imagePicker = DKImagePickerWithImages([UIImage imageNamed:@"audioTime_white_Day.png"],[UIImage imageNamed:@"audioTime_white_Day.png"],[UIImage imageNamed:@"audioTime_white_Day.png"]);
    }
    
    return _videoTimeLabel;
}

- (CBNImageAndTextLabel *)praiseLabel
{
    if (!_praiseLabel) {
        
        self.praiseLabel = [[CBNImageAndTextLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) image:[RGBColor(102, 198, 118, 1.0) colorImage]];
        
        _praiseLabel.contentLabel.dk_textColorPicker = DKColorPickerWithKey(图片上的默认标签字体颜色);
        
        _praiseLabel.iconImageView.dk_imagePicker = DKImagePickerWithImages([UIImage imageNamed:@"praiseCount_white_Day.png"],[UIImage imageNamed:@"praiseCount_white_Day.png"],[UIImage imageNamed:@"praiseCount_white_Day.png"]);
    }
    
    return _praiseLabel;
}

- (CBNImageAndTextLabel *)commentsCountLabel
{
    if (!_commentsCountLabel) {
        
        self.commentsCountLabel = [[CBNImageAndTextLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) image:[RGBColor(102, 198, 118, 1.0) colorImage]];
        
        _commentsCountLabel.contentLabel.dk_textColorPicker = DKColorPickerWithKey(图片上的默认标签字体颜色);
        
        _commentsCountLabel.iconImageView.dk_imagePicker = DKImagePickerWithImages([UIImage imageNamed:@"commentsCount_white_Day.png"],[UIImage imageNamed:@"commentsCount_white_Day.png"],[UIImage imageNamed:@"commentsCount_white_Day.png"]);
    }
    
    return _commentsCountLabel;
}

- (UIImageView *)lineImageView
{
    if (!_lineImageView) {
        
        self.lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, self.frame.size.height -1, screen_Width-20, 1)];
        
        _lineImageView.dk_backgroundColorPicker = DKColorPickerWithKey(新闻列表分割线颜色);
    }
    
    return _lineImageView;
}
- (void)setNewsItemModel:(CBNNewsItemModel *)newsItemModel
{
    [_newsThumbImageView sd_setImageWithURL:[NSURL URLWithString:newsItemModel.cover_img_big] placeholderImage:[UIImage imageNamed:@"defaultImage.jpg"]];
    
    _timelabel.frame = CGRectMake(0, 0, 0, 0);
    
    _timelabel.text = [NSDate getUTCFormateDate:newsItemModel.renewtime];
    
    [_timelabel sizeToFit];
    
    _timelabel.frame = CGRectMake(12, imageView_Height - 10 - _timelabel.frame.size.height, _timelabel.frame.size.width, _timelabel.frame.size.height);
    
    _videoTimeLabel.text = [NSString stringWithFormat:@"%@",newsItemModel.Time];;

    CGFloat audioTimeWidth = _videoTimeLabel.frame.size.width +10;
    
    _videoTimeLabel.frame = CGRectMake(_newsThumbImageView.frame.size.width - audioTimeWidth  , imageView_Height - 10 - _videoTimeLabel.frame.size.height, _videoTimeLabel.frame.size.width, _videoTimeLabel.frame.size.height);
    _commentsCountLabel.frame = CGRectMake(0, 0, 0, 0);
    
    _commentsCountLabel.text = [NSString stringWithFormat:@"%ld",[newsItemModel.Comments integerValue]];
    
    CGFloat commentCountWidth = _commentsCountLabel.frame.size.width +10;
    
    _commentsCountLabel.frame = CGRectMake(_newsThumbImageView.frame.size.width - audioTimeWidth - commentCountWidth, imageView_Height - 10 - _commentsCountLabel.frame.size.height, _commentsCountLabel.frame.size.width, _commentsCountLabel.frame.size.height);
    _praiseLabel.frame = CGRectMake(0, 0, 0, 0);
    
    _praiseLabel.text =  [NSString stringWithFormat:@"%ld",[newsItemModel.Like integerValue]];;
    
    CGFloat praiseWidth = _praiseLabel.frame.size.width +10;
    
    _praiseLabel.frame = CGRectMake(_newsThumbImageView.frame.size.width-audioTimeWidth - commentCountWidth-praiseWidth, imageView_Height - 10 - _praiseLabel.frame.size.height, _praiseLabel.frame.size.width, _praiseLabel.frame.size.height);
    
    
    _newsTitleLabel.content = newsItemModel.chapt_title;
    
    [_newsTitleLabel sizeToFit];
    _newsTitleLabel.frame = CGRectMake(_newsTitleLabel.frame.origin.x, _newsTitleLabel.frame.origin.y, screen_Width  - 20, _newsTitleLabel.frame.size.height);
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, screen_Width-20, _newsTitleLabel.frame.origin.y + _newsTitleLabel.frame.size.height+16);
    
    _lineImageView.frame = CGRectMake(10, self.frame.size.height -1, screen_Width -20, 1);
    
    _newsItemModel = newsItemModel;
    
    _newsItemModel.height = self.frame.size.height;
    [self setNeedsDisplay];
    
    [self setNeedsLayout];
    
    [_newsThumbImageView setNeedsLayout];
    
    [_newsThumbImageView setNeedsDisplay];
    

}



@end
