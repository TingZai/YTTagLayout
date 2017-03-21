//
//  YTTTagsFrame.m
//  YTTagLayout
//
//  Created by 余婷 on 2017/3/21.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "YTTTagsFrame.h"

@implementation YTTTagsFrame

#pragma mark - 初始化
- (instancetype)init{

    if (self = [super init]) {
        
        self.tagMargin = 10;
        self.tagPadding = 10;
        self.tagFont = [UIFont systemFontOfSize:13];
        self.tagsMaxWidth = [UIScreen mainScreen].bounds.size.width;
        self.tagsFrameArray = [NSMutableArray new];
    }
    
    return self;
}

#pragma mark - 计算每个标签的坐标和大小
- (void)setTagsArray:(NSArray *)tagsArray{

    _tagsArray = tagsArray;
    
    //0.如果标签数组为空不需要计算
    if (tagsArray.count == 0 || tagsArray == nil) {
        
        return;
    }
    
    //1.声明通用的变量
    CGFloat currentTagW = 0;
    CGFloat currentTagH = 0;
    CGFloat currentTagX = 0;
    CGFloat currentTagY = 0;
    CGFloat preTagW = 0;
    CGFloat preTagH = 0;
    CGFloat preTagX = 0;
    CGFloat preTagY = 0;
    
    //2.遍历tag数组，计算其对应的frame
    for (NSString * tag in tagsArray) {
        
        //2.1计算当前tag的大小
        CGSize tagSize = [self p_getSizeWithTag:tag];
        currentTagW = tagSize.width + _tagPadding;
        currentTagH = tagSize.height + _tagPadding;
        //2.2计算当前tag的坐标
        currentTagX = preTagX + preTagW + _tagMargin;
        currentTagY = preTagY;
        //2.3判断是否需要换行
        if (currentTagX+currentTagW > _tagsMaxWidth) {
            //2.3.1换行后重新计算坐标
            currentTagX = _tagMargin;
            currentTagY = preTagY + preTagH + _tagMargin;
            //2.3.2更新所有内容的高度值
            _tagsHeight += currentTagH + _tagMargin;
        }
        //2.4更新上一个tag的frame值
        preTagW = currentTagW;
        preTagH = currentTagH;
        preTagX = currentTagX;
        preTagY = currentTagY;
        
        //2.5保存frame值
        [_tagsFrameArray addObject:NSStringFromCGRect(CGRectMake(currentTagX, currentTagY, currentTagW, currentTagH))];
    }
    
    //3.通过最后一行的标签更新总高度
    CGRect lastRect = CGRectFromString(_tagsFrameArray.lastObject);
    _tagsHeight += lastRect.size.height + _tagMargin;
    
}


///计算tag对应的大小
- (CGSize)p_getSizeWithTag:(NSString *)tag{

    return [tag boundingRectWithSize:CGSizeMake(_tagsMaxWidth - _tagPadding * 2 - _tagMargin * 2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_tagFont} context:nil].size;
}




@end
