//
//  ViewController.m
//  ScrolllerView
//
//  Created by Mac on 15-3-12.
//  Copyright (c) 2015年 wmeng. All rights reserved.
//

#import "ViewController.h"
#import "PhotosView.h"

@interface ViewController ()<photosViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
      NSMutableArray *arr=[[NSMutableArray alloc]initWithObjects:@"http://d.hiphotos.baidu.com/image/pic/item/9d82d158ccbf6c8103573d5bbf3eb13533fa4024.jpg",@"http://d.hiphotos.baidu.com/image/pic/item/9d82d158ccbf6c8103573d5bbf3eb13533fa4024.jpg",@"http://d.hiphotos.baidu.com/image/pic/item/9d82d158ccbf6c8103573d5bbf3eb13533fa4024.jpg",@"http://d.hiphotos.baidu.com/image/pic/item/9d82d158ccbf6c8103573d5bbf3eb13533fa4024.jpg",@"http://d.hiphotos.baidu.com/image/pic/item/9d82d158ccbf6c8103573d5bbf3eb13533fa4024.jpg",@"http://d.hiphotos.baidu.com/image/pic/item/9d82d158ccbf6c8103573d5bbf3eb13533fa4024.jpg",@"http://d.hiphotos.baidu.com/image/pic/item/9d82d158ccbf6c8103573d5bbf3eb13533fa4024.jpg",nil];
    //添加你需要的滑动的控件
    PhotosView *photo = [[PhotosView alloc]initWithFrame:CGRectMake(0,20,self.view.frame.size.width, 300)];
    photo.delegate = self;
    [self.view addSubview:photo];
    photo.ListAry = arr;//一个封装了url的string数组
    
}
#pragma mark - photosViewDelegate
- (void)touchesEventBYIndex:(int)index
{
//    inde 为0，1，2，3.。。。。
//    实现你的点击事件
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
