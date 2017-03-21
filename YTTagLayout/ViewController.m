//
//  ViewController.m
//  YTTagLayout
//
//  Created by 余婷 on 2017/3/21.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "ViewController.h"
#import "YTTagsView.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray * tagsArray;

@end

@implementation ViewController

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self creatUI];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 创建界面
- (void)creatUI{
    
    ///使用方式1:
    YTTagsView * tagsView = [[YTTagsView alloc] initWithTags:self.tagsArray];
    //设置frame只有x和y有效
    tagsView.frame = CGRectMake(0, 50, 0, 0);
    [self.view addSubview:tagsView];
    
    
    ///使用方式2:
    YTTagsView * tagsView2 = [[YTTagsView alloc] initWithTags:self.tagsArray];
    //设置frame只有x和y有效
    tagsView2.frame = CGRectMake(0, 250, 0, 0);
    tagsView2.tagColor = [UIColor redColor];
    tagsView2.boderColor = [UIColor greenColor];
    tagsView2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tagsView2];
    
    
}

#pragma mark - 懒加载
- (NSMutableArray *)tagsArray{

    if (!_tagsArray) {
        
        _tagsArray = [[NSMutableArray alloc] initWithObjects:@"哈哈",@"呵呵呵",@"嘻嘻",@"呜呜呜",@"接收到加法",@"萨科技恢复健康撒很费劲",@"化合物诶嘿黄金时代胡椒粉不男不女拜拜撒放假啊上返回",@"卡号是的看法哈萨克烦得很爱上对方空间撒谎发点击返回结合实际横幅",nil];
        
    }
    
    return _tagsArray;
}

@end
