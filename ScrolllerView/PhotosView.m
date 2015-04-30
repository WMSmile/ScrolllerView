//
//  PhotosView.m
//  ScrolllerView
//
//  Created by Mac on 15-3-12.
//  Copyright (c) 2015年 wmeng. All rights reserved.
//

#import "PhotosView.h"
#define TimeInterval 1 //动画的间隔时间

@interface PhotosView()<UIScrollViewDelegate>
{
    int _totalCount;
    NSTimer *_timer;
    float offSet;
}
@end


@implementation PhotosView
- (id)initWithFrame:(CGRect)frame
{
   self =  [super initWithFrame:frame];
    if (self) {
        [self layoutViews];
    }
    return self;
    
}
/**
 *  布局界面
 */
- (void)layoutViews
{
   
    //加载_imgaSV
    self.imgSV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _imgSV.backgroundColor = [UIColor clearColor];
    _imgSV.pagingEnabled = YES;
    _imgSV.delegate = self;
    _imgSV.showsHorizontalScrollIndicator = NO;
    _imgSV.showsVerticalScrollIndicator = NO;
    [self addSubview:_imgSV];
    
    
    
    //增加显示第几张的label
    self.imgCountLB = [[UILabel alloc]initWithFrame:CGRectMake(15, self.frame.size.height-20, 30, 20)];
    _imgCountLB.text = @"0/0";
    _imgCountLB.backgroundColor = [UIColor lightGrayColor];
    _imgCountLB.font = [UIFont systemFontOfSize:10];
    _imgCountLB.textColor = [UIColor whiteColor];
    _imgCountLB.textAlignment = UITextAlignmentCenter;
    [self addSubview:_imgCountLB];
    
}

- (void)setListAry:(NSArray *)ListAry
{
    if ([_ListAry isEqualToArray:ListAry]) {
        return;
    }
    _ListAry = ListAry;
    
    for (int i = 0; i<ListAry.count; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(self.frame.size.width * i, 0, self.frame.size.width, self.frame.size.height);
        btn.tag = 100 + i;
        [btn addTarget:self action:@selector(BtnsClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:ListAry[i]]]] forState:UIControlStateNormal];
        [self.imgSV addSubview:btn];
        
        self.imgSV.contentSize = CGSizeMake(self.frame.size.width*ListAry.count, self.frame.size.height);
    }
    _totalCount = ListAry.count;
    _imgCountLB.text = [NSString stringWithFormat:@"%@/%d",@"1",_totalCount];
    //添加定时器
    if (_timer) {
        [_timer timeInterval];
        _timer = nil;
    }
    else
    {
        _timer =   [NSTimer scheduledTimerWithTimeInterval:TimeInterval target:self selector:@selector(ScrollNext) userInfo:nil repeats:YES];

    }
}

#pragma mark - scrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int count = scrollView.contentOffset.x/self.frame.size.width;
    _imgCountLB.text = [NSString stringWithFormat:@"%d/%d",count+1,_totalCount];
}
/**
 *  btn的点击时间
 *
 *  @param sender 按钮自身
 */
- (void)BtnsClick:(UIButton *)sender
{
    if([self.delegate respondsToSelector:@selector(touchesEventBYIndex:)])
    {
        [self.delegate touchesEventBYIndex:sender.tag - 100];
    }
}

/**
 *  定时器调用的方法
 */
- (void)ScrollNext
{
    CGPoint point = self.imgSV.contentOffset;
    if (point.x == self.frame.size.width*(self.ListAry.count-1))
    {
       offSet  = -self.frame.size.width;
    }
    else if (point.x == 0)
    {
        offSet = self.frame.size.width;
    }
    point.x += offSet;
    [UIView animateWithDuration:TimeInterval animations:^{
        self.imgSV.contentOffset = point;
    }];
    
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
