//
//  YTTTagsFrame.h
//  YTTagLayout
//
//  Created by 余婷 on 2017/3/21.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YTTTagsFrame : NSObject

///标签数组
@property (nonatomic, strong) NSArray * tagsArray;
///标签外边距(默认是10)
@property (nonatomic, assign) CGFloat tagMargin;
///标签内边距(默认是10)
@property (nonatomic, assign) CGFloat tagPadding;
///标签字体(默认是系统字体13号)
@property (nonatomic, strong) UIFont * tagFont;
///所有标签的整体高度
@property (nonatomic, assign) CGFloat tagsHeight;
///标签容器的最大宽度(默认是屏幕宽度)
@property (nonatomic, assign) CGFloat tagsMaxWidth;


///每个标签对应的frame所在的数组
@property(nonatomic, strong) NSMutableArray * tagsFrameArray;

@end
