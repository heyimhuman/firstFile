//
//  CATransitionViewController.m
//  First
//
//  Created by kurusagi on 16/7/8.
//  Copyright © 2016年 kurusagi. All rights reserved.
//

#import "CATransitionViewController.h"

#define kMaxNumberPic 6

@interface CATransitionViewController ()

@property (weak, nonatomic)UIImageView * imageV;
@property (assign, nonatomic)NSInteger currentIndex;

@end

@implementation CATransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setSwipe];
}

- (UIImageView *)imageV{
    if (_imageV == nil) {
        NSString * imageName = [NSString stringWithFormat:@"Irelia_%d",_currentIndex];
        UIImageView * imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageV.frame = self.view.bounds;
        imageV.userInteractionEnabled = YES;
        [self.view addSubview:imageV];
        _imageV = imageV;
    }
    return _imageV;
}

- (void)setSwipe{
    [self.imageV addGestureRecognizer:[self swipeWithDirection:UISwipeGestureRecognizerDirectionLeft]];
    
    [self.imageV addGestureRecognizer:[self swipeWithDirection:UISwipeGestureRecognizerDirectionRight]];
}

- (UISwipeGestureRecognizer *)swipeWithDirection:(UISwipeGestureRecognizerDirection)direction{
    UISwipeGestureRecognizer * swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandle:)];
    swipe.direction = direction;
    return swipe;
}

- (void)swipeHandle:(UISwipeGestureRecognizer *)gesture{
    UISwipeGestureRecognizerDirection direction = gesture.direction;
    CATransition * animation = [CATransition animation];
    animation.duration = 1;
//    pageCurl            向上翻一页
//    pageUnCurl          向下翻一页
//    rippleEffect        滴水效果
//    suckEffect          收缩效果，如一块布被抽走
//    cube                立方体效果
//    oglFlip             上下翻转效果
    //动画类型
    animation.type = @"pageUnCurl";
    
    //动画方向
    NSString *subType = nil;
    
    
    //翻页
    if (direction == UISwipeGestureRecognizerDirectionLeft)
    {
        NSLog(@"向左滑");
        
        _currentIndex++;
        
        if (_currentIndex == kMaxNumberPic)
        {
            _currentIndex = 0;
        }
        NSLog(@"%d",_currentIndex);
        
        //方向
        subType = kCATransitionFromLeft;
        
    }
    //返回
    else if(direction == UISwipeGestureRecognizerDirectionRight)
    {
        NSLog(@"向右滑");
        
        _currentIndex--;
        
        if (_currentIndex < 0)
        {
            _currentIndex = kMaxNumberPic - 1;
        }
        NSLog(@"%d",_currentIndex);
        //方向
        subType = kCATransitionFromRight;
    }
    
    //设置动画方向
    animation.subtype = subType;
    
    //执行动画
    [self.imageV.layer addAnimation:animation forKey:nil];
    
    
    NSString *imageName = [NSString stringWithFormat:@"Irelia_%ld",_currentIndex];
    NSLog(@"%@",imageName);
    //修改图片
    self.imageV.image = [UIImage imageNamed:imageName];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
