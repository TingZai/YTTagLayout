//
//  YTTagsView.m
//  YTTagLayout
//
//  Created by 余婷 on 2017/3/21.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "YTTagsView.h"
#import "YTTTagsFrame.h"

@implementation YTTagsView

#pragma mark - 初始化
- (instancetype)initWithTags:(NSArray *)tagsArray{
    
    if (self = [super init]) {
        
        YTTTagsFrame * tTagsFrame = [YTTTagsFrame new];
        tTagsFrame.tagsArray = tagsArray;
        self.tagsFrame = tTagsFrame;
        self.frame = CGRectMake(0, 0, tTagsFrame.tagsMaxWidth, tTagsFrame.tagsHeight);
        
        //初始化属性
        self.tagColor = [UIColor blackColor];
        self.tagBackgroundColor = [UIColor clearColor];
        self.boderColor = [UIColor colorWithWhite:0.7 alpha:1];
    }
    
    return self;
}

- (instancetype)init{

    if (self = [super init]) {
        
        self.tagColor = [UIColor blackColor];
        self.tagBackgroundColor = [UIColor clearColor];
        self.boderColor = [UIColor colorWithWhite:0.7 alpha:1];
    }
    
    return self;
}

#pragma mark - 根据tagsFramse创建界面
- (void)setTagsFrame:(YTTTagsFrame *)tagsFrame{

    _tagsFrame = tagsFrame;
}

- (void)layoutSubviews{

    [super layoutSubviews];
    [self creatUI];
    //通过标签内容的最大宽度和高度设置当前视图的frame
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, _tagsFrame.tagsMaxWidth, _tagsFrame.tagsHeight);
    
}

- (void)creatUI{

    //1.数组拿到对应的标签值和标签frame
    for (int i = 0; i < _tagsFrame.tagsArray.count; i++) {
        //1.1拿到标签值和其frame
        NSString * tag = _tagsFrame.tagsArray[i];
        CGRect tagRect = CGRectFromString(_tagsFrame.tagsFrameArray[i]);
        //1.2创建对应的UILabel
        UILabel * label = [[UILabel alloc] initWithFrame:tagRect];
        label.text = tag;
        label.textColor = _tagColor;
        label.backgroundColor = _tagBackgroundColor;
        label.font = _tagsFrame.tagFont;
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 0;
        //1.3Label切圆角
        label.layer.masksToBounds = YES;
        label.layer.borderColor = _boderColor.CGColor;
        label.layer.borderWidth = 1;
        label.layer.cornerRadius = tagRect.size.height/2.0;
        
        [self addSubview:label];
    }

}


@end
