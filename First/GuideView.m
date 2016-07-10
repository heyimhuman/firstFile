//
//  GuideView.m
//  First
//
//  Created by kurusagi on 16/7/7.
//  Copyright © 2016年 kurusagi. All rights reserved.
//

#import "GuideView.h"

@interface GuideView ()<UIScrollViewDelegate>

@end

@implementation GuideView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#define DEF_GUIDE_COUNT 3
#define DEF_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define DEF_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define DEF_WIDTH(key) key.frame.size.width
#define DEF_HEIGHT(key) key.frame.size.height



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.bounces=NO;
        self.contentSize = CGSizeMake(DEF_WIDTH(self)*DEF_GUIDE_COUNT, DEF_HEIGHT(self));
        self.backgroundColor = [UIColor blackColor];
        self.showsHorizontalScrollIndicator = NO;
        self.pagingEnabled = YES;
        self.delegate=self;
        self.backgroundColor = [UIColor clearColor];
        
        for (int i=0; i<DEF_GUIDE_COUNT; i++)
        {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(DEF_SCREEN_WIDTH*i, 0, DEF_SCREEN_WIDTH,DEF_SCREEN_HEIGHT)];
            [imageView setBackgroundColor:[UIColor redColor]];
            [imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"timg.png"]]];
            if ([UIScreen mainScreen].bounds.size.height == 480) {
                [imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"timg.png"]]];
            }
            [self addSubview:imageView];
            if (i==2) {
                UIButton*button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.frame = CGRectMake(0,0, DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT);
                button.alpha = 0.5;
                [button addTarget:self action:@selector(beginClick) forControlEvents:UIControlEventTouchUpInside];
                imageView.userInteractionEnabled = YES;
                [imageView addSubview:button];
            }
        }
    }
    return self;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x>DEF_SCREEN_WIDTH*3+20) {
        [UIView animateWithDuration:0.3 animations:^{
            self.alpha = 0.0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
        
    }
}
#pragma mark - 点击事件

- (void)beginClick
{
    self.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
