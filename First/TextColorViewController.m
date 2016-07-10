//
//  TextColorViewController.m
//  First
//
//  Created by kurusagi on 16/7/7.
//  Copyright © 2016年 kurusagi. All rights reserved.
//

#import "TextColorViewController.h"

@interface TextColorViewController ()

@property (strong, nonatomic)CAGradientLayer * gradientLayer;

@end

@implementation TextColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label=[[UILabel alloc]init];
    label.text=@"药药切克闹，煎饼果子来一套！";
    label.font=[UIFont systemFontOfSize:25];
    [label sizeToFit];
    label.center=CGPointMake(200, 100);
    [self.view addSubview:label];
    //No.1
    //开始写代码，实现文字横向渐变效果，颜色：通过randomColor方法随机。利用定时器（CADisplayLink）快速的切换渐变颜色，定时器的方法已经给出（textColorChange）。
//    CAGradientLayer
    //初始化渐变层
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = label.bounds;
    _gradientLayer.colors = @[ (id)[self randomColor].CGColor,
//                               (id)[self randomColor].CGColor,
//                               (id)[self randomColor].CGColor,
                               (id)[self randomColor].CGColor,
                               (id)[self randomColor].CGColor];
    [self.view.layer addSublayer:self.gradientLayer];
    
    self.gradientLayer.mask = label.layer;
    
    label.frame = self.gradientLayer.bounds;
    
    CADisplayLink * link = [CADisplayLink displayLinkWithTarget:self selector:@selector(textColorChange)];
    
    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
    
    
    
    
    
    
    //end_code
}
-(UIColor *)randomColor{
    CGFloat r=arc4random_uniform(256)/255.0;
    CGFloat g=arc4random_uniform(256)/255.0;
    CGFloat b=arc4random_uniform(256)/255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}
-(void)textColorChange
{
    _gradientLayer.colors = @[ (id)[self randomColor].CGColor,
                               (id)[self randomColor].CGColor,
//                               (id)[self randomColor].CGColor,
//                               (id)[self randomColor].CGColor,
                               (id)[self randomColor].CGColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
