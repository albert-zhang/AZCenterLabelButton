//
//  AZCenterLabelButton.m
//  AZCenterLabelButton
//
//  Created by Yang Zhang on 12/18/14.
//  Copyright (c) 2014 landinggearup.com. All rights reserved.
//

#import "AZCenterLabelButton.h"

@implementation AZCenterLabelButton

- (void)setDefaluts{
    _imageLabelGap = 4;
    _padding = UIEdgeInsetsZero;
    [self titleLabel]; // force create title label
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setDefaluts];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setDefaluts];
    }
    return self;
}


- (BOOL)calcImageAndTitleSize:(CGRect *)titleRect imageSize:(CGSize *)imageSize{
    UIImage *img = [self imageForState:UIControlStateNormal];
    NSString *title = [self titleForState:UIControlStateNormal];
    if(img && title){
        CGRect titleR = [title boundingRectWithSize:CGSizeMake(INT_MAX, INT_MAX)
                                            options:NSStringDrawingTruncatesLastVisibleLine
                                         attributes:@{NSFontAttributeName: self.titleLabel.font}
                                            context:nil];
        titleRect->origin.x = titleR.origin.x;
        titleRect->origin.y = titleR.origin.y;
        titleRect->size.width = titleR.size.width;
        titleRect->size.height = titleR.size.height;

        imageSize->width = img.size.width;
        imageSize->height = img.size.height;

        return YES;
    }
    return NO;
}


- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGRect r = [super titleRectForContentRect:contentRect];

    CGRect titleRect;
    CGSize imgSize;
    BOOL b = [self calcImageAndTitleSize:&titleRect imageSize:&imgSize];

    if(b){
        CGFloat maxWidth;
        if(_fixedWidth > 0){
            maxWidth = _fixedWidth;
        }else{
            maxWidth = MAX(imgSize.width, titleRect.size.width);
        }

        r.origin.x = _padding.left + (maxWidth - titleRect.size.width) / 2;
        r.origin.y = _padding.top + imgSize.height + _imageLabelGap;
        r.size = titleRect.size;
    }

    return r;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGRect r = [super imageRectForContentRect:contentRect];

    CGRect titleRect;
    CGSize imgSize;
    BOOL b = [self calcImageAndTitleSize:&titleRect imageSize:&imgSize];

    if(b){
        CGFloat maxWidth;
        if(_fixedWidth > 0){
            maxWidth = _fixedWidth;
        }else{
            maxWidth = MAX(imgSize.width, titleRect.size.width);
        }

        r.origin.x = _padding.left + (maxWidth - imgSize.width) / 2;
        r.origin.y = _padding.top;
        r.size = imgSize;
    }

    return r;
}

- (CGSize)sizeThatFits:(CGSize)size{
    CGSize sz = [super sizeThatFits:size];

	CGSize sz1 = CGSizeZero;
	BOOL r = [self goodSize:&sz1];
	if(r){
		return sz1;
	}
	
    return sz;
}

- (CGSize)intrinsicContentSize{
	CGSize sz = CGSizeZero;
	[self goodSize:&sz];
	return sz;
}

- (BOOL)goodSize:(CGSize *)sz{
	CGRect titleRect;
	CGSize imgSize;
	BOOL b = [self calcImageAndTitleSize:&titleRect imageSize:&imgSize];
	
	if(b){
		CGFloat maxWidth;
		if(_fixedWidth > 0){
			maxWidth = _fixedWidth;
		}else{
			maxWidth = MAX(imgSize.width, titleRect.size.width);
		}
		
		sz->width = _padding.left + maxWidth + _padding.right;
		sz->height = _padding.top + imgSize.height + _imageLabelGap + titleRect.size.height + _padding.bottom;
		return YES;
	}
	
	return NO;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
