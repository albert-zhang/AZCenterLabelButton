//
//  AZCenterLabelButton.h
//  AZCenterLabelButton
//
//  Created by Yang Zhang on 12/18/14.
//  Copyright (c) 2014 landinggearup.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AZCenterLabelButton : UIButton
{
@private
    BOOL hasImageSet;
    BOOL hasTitleSet;
}

/**
 The vertical gap between the image and the label
 */
@property (nonatomic, assign) int imageLabelGap;

/**
 Set a positive value makes the calculation ignore the size of both the image and the label
 */
@property (nonatomic, assign) int fixedWidth;

/**
 The padding around the whole button
 */
@property (nonatomic, assign) UIEdgeInsets padding;

@end
