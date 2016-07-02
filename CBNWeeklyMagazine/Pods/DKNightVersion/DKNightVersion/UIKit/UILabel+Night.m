//
//  UILabel+Night.m
//  UILabel+Night
//
//  Copyright (c) 2015 Draveness. All rights reserved.
//
//  These files are generated by ruby script, if you want to modify code
//  in this file, you are supposed to update the ruby code, run it and
//  test it. And finally open a pull request.

#import "UILabel+Night.h"
#import "DKNightVersionManager.h"
#import <objc/runtime.h>

@interface UILabel ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, DKColorPicker> *pickers;

@end

@implementation UILabel (Night)
- (DKColorPicker)dk_borderColorPicker
{
    return objc_getAssociatedObject(self, @selector(dk_borderColorPicker));

}
- (void)dk_setborderColorPicker:(DKColorPicker)picker
{
    objc_setAssociatedObject(self, @selector(dk_borderColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    self.layer.borderColor = picker(self.dk_manager.themeVersion).CGColor;
    
    
    [self.pickers setValue:[picker copy] forKey:@"setBorderColor:"];
}

- (DKColorPicker)dk_textColorPicker {
    return objc_getAssociatedObject(self, @selector(dk_textColorPicker));
}

- (void)dk_setTextColorPicker:(DKColorPicker)picker {
    objc_setAssociatedObject(self, @selector(dk_textColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.textColor = picker(self.dk_manager.themeVersion);
    [self.pickers setValue:[picker copy] forKey:@"setTextColor:"];
}

- (DKColorPicker)dk_shadowColorPicker {
    return objc_getAssociatedObject(self, @selector(dk_shadowColorPicker));
}

- (void)dk_setShadowColorPicker:(DKColorPicker)picker {
    objc_setAssociatedObject(self, @selector(dk_shadowColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.shadowColor = picker(self.dk_manager.themeVersion);
    [self.pickers setValue:[picker copy] forKey:@"setShadowColor:"];
}

- (DKColorPicker)dk_highlightedTextColorPicker {
    return objc_getAssociatedObject(self, @selector(dk_highlightedTextColorPicker));
}

- (void)dk_setHighlightedTextColorPicker:(DKColorPicker)picker {
    objc_setAssociatedObject(self, @selector(dk_highlightedTextColorPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.highlightedTextColor = picker(self.dk_manager.themeVersion);
    [self.pickers setValue:[picker copy] forKey:@"setHighlightedTextColor:"];
}


@end
