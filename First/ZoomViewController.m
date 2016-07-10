//
//  ZoomViewController.m
//  First
//
//  Created by kurusagi on 16/7/8.
//  Copyright © 2016年 kurusagi. All rights reserved.
//

#import "ZoomViewController.h"

@interface ZoomViewController ()<UIScrollViewDelegate>

@end

@implementation ZoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setImage];
}

- (void)setImage{
    UIScrollView * sview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64)];
    [self.view addSubview:sview];
    sview.maximumZoomScale = 2;
    sview.minimumZoomScale = 1;
    sview.delegate = self;
    UIImageView * imageV = [[UIImageView alloc] initWithFrame:sview.frame];
    imageV.tag = 101;
    imageV.image = [UIImage imageNamed:@"timg.png"];
    [sview addSubview:imageV];
    
    [sview addGestureRecognizer:[[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateView:)]];
}

- (void) rotateView:(UIRotationGestureRecognizer *)rotationGestureRecognizer
{
    UIView *view = rotationGestureRecognizer.view;
    if (rotationGestureRecognizer.state == UIGestureRecognizerStateBegan || rotationGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        view.transform = CGAffineTransformRotate(view.transform, rotationGestureRecognizer.rotation);
        [rotationGestureRecognizer setRotation:0];
    }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    UIImageView * imageV = [self.view viewWithTag:101];
    return imageV;
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
