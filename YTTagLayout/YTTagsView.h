//
//  YTTagsView.h
//  YTTagLayout
//
//  Created by 余婷 on 2017/3/21.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YTTTagsFrame;

@interface YTTagsView : UIView

///标签颜色（默认是色）
@property(nonatomic, strong, nullable)UIColor * tagColor;

///标签的边框颜色(默认是灰色)
@property(nonatomic, strong, nullable) UIColor * boderColor;

///标签的背景颜色(默认是透明色)
@property(nonatomic, strong, nullable) UIColor * tagBackgroundColor;

///可以通过外部直接设置tagsFrame的值
@property(nonatomic, strong, nullable) YTTTagsFrame * tagsFrame;

///通过标签数组创建对象
- (nonnull instancetype)initWithTags:(nonnull NSArray *)tagsArray;



@end
