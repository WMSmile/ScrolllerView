//
//  PhotosView.h
//  ScrolllerView
//
//  Created by Mac on 15-3-12.
//  Copyright (c) 2015年 wmeng. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol photosViewDelegate <NSObject>
- (void)touchesEventBYIndex:(int)index;
@end


@interface PhotosView : UIView
@property (nonatomic,strong)UIScrollView  *imgSV;
@property (nonatomic,strong)UILabel  *imgCountLB;
@property (nonatomic,strong)NSArray *ListAry;//url的数组
@property (nonatomic,assign)id<photosViewDelegate>delegate;

@end
