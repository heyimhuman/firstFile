//
//  HudViewController.m
//  First
//
//  Created by kurusagi on 16/7/5.
//  Copyright © 2016年 kurusagi. All rights reserved.
//

#import "HudViewController.h"
#import <Masonry/Masonry.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface HudViewController ()

@property (strong, nonatomic)MBProgressHUD * hud;

@end

@implementation HudViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载提示动画
    NSLog(@"this");
    NSLog(@"this");
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _hud.mode = MBProgressHUDModeCustomView;
    
    _hud.labelText = @"加载中";
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        sleep(3);
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
//    UIView *sv = [UIView new];
//    sv.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:sv];
//    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.size.mas_equalTo(CGSizeMake(300, 300));
//    }];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}

/**
 *  点击按钮出现提示框
 */
- (void)click{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = @"Some message...";
    hud.margin = 10.f;
    hud.yOffset = 150.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1];
}

- (void)testMBProgressHUD
{
    NSLog(@"test  MBProgressHUD ");
    /*
     要将一个MBProgressHUD显示出来，1，创建对象；2，将HUD添加到view上；3，调用show方法
     隐藏，1，hide:方法；  2，hide: afterDelay: 方法
     其它的用法都是特殊的设置等
     */
    
    MBProgressHUD * HUD = [[MBProgressHUD alloc] init];
    [self.view addSubview:HUD];
    //    HUD.mode = MBProgressHUDModeIndeterminate;//菊花，默认值
    //    HUD.mode = MBProgressHUDModeDeterminate;//圆饼，饼状图
    //    HUD.mode = MBProgressHUDModeDeterminateHorizontalBar;//进度条
    HUD.mode = MBProgressHUDModeAnnularDeterminate;//圆环作为进度条
    //    HUD.mode = MBProgressHUDModeCustomView; //需要设置自定义视图时候设置成这个
    //    HUD.mode = MBProgressHUDModeText; //只显示文本
    
    //1,设置背景框的透明度  默认0.8
//    HUD.opacity = 0.5;
    //2,设置背景框的背景颜色和透明度， 设置背景颜色之后opacity属性的设置将会失效
//    HUD.color = [UIColor redColor];
//    HUD.color = [HUD.color colorWithAlphaComponent:1];
    //3,设置背景框的圆角值，默认是10
    HUD.cornerRadius = 20.0;
    //4,设置提示信息 信息颜色，字体
    HUD.labelColor = [UIColor blueColor];
    HUD.labelFont = [UIFont systemFontOfSize:13];
    HUD.labelText = @"Loading...";
    //5,设置提示信息详情 详情颜色，字体
    HUD.detailsLabelColor = [UIColor blueColor];
    HUD.detailsLabelFont = [UIFont systemFontOfSize:13];
    HUD.detailsLabelText = @"LoadingLoading...";
    //6，设置菊花颜色  只能设置菊花的颜色
    HUD.activityIndicatorColor = [UIColor blackColor];
    //7,设置一个渐变层
    HUD.dimBackground = YES;
    //8,设置动画的模式
    //    HUD.mode = MBProgressHUDModeIndeterminate;
    //9，设置提示框的相对于父视图中心点的便宜，正值 向右下偏移，负值左上
    HUD.xOffset = -80;
    HUD.yOffset = -100;
    //10，设置各个元素距离矩形边框的距离
    HUD.margin = 0;
    //11，背景框的最小大小
    HUD.minSize = CGSizeMake(50, 50);
    //12设置背景框的实际大小   readonly
//    CGSize size = HUD.size;
    //13,是否强制背景框宽高相等
    HUD.square = YES;
    //14,设置显示和隐藏动画类型  有三种动画效果，如下
    //    HUD.animationType = MBProgressHUDAnimationFade; //默认类型的，渐变
    //    HUD.animationType = MBProgressHUDAnimationZoomOut; //HUD的整个view后退 然后逐渐的后退
    HUD.animationType = MBProgressHUDAnimationZoomIn; //和上一个相反，前近，最后淡化消失
    //15,设置最短显示时间，为了避免显示后立刻被隐藏默认是0
    //    HUD.minShowTime = 10;
    //16,
    /*
     // 这个属性设置了一个宽限期，它是在没有显示HUD窗口前被调用方法可能运行的时间。
     // 如果被调用方法在宽限期内执行完，则HUD不会被显示。
     // 这主要是为了避免在执行很短的任务时，去显示一个HUD窗口。
     // 默认值是0。只有当任务状态是已知时，才支持宽限期。具体我们看实现代码。
     @property (assign) float graceTime;
     
     // 这是一个标识位，标明执行的操作正在处理中。这个属性是配合graceTime使用的。
     // 如果没有设置graceTime，则这个标识是没有太大意义的。在使用showWhileExecuting:onTarget:withObject:animated:方法时，
     // 会自动去设置这个属性为YES，其它情况下都需要我们自己手动设置。
     @property (assign) BOOL taskInProgress;
     */
    //17,设置隐藏的时候是否从父视图中移除，默认是NO
    HUD.removeFromSuperViewOnHide = NO;
    //18,进度指示器  模式是0，取值从0.0————1.0
    //    HUD.progress = 0.5;
    //19,隐藏时候的回调 隐藏动画结束之后
    HUD.completionBlock = ^(){
        NSLog(@"abnnfsfsf");
    };
    //设置任务，在hud上显示任务的进度
//    [HUD showWhileExecuting:@selector(myProgressTask) onTarget:self withObject:nil animated:YES];
    
    //    [HUD show:YES];
    
    
    //两种隐藏的方法
    //    [HUD hide:YES];
    [HUD hide:YES afterDelay:5];
    
    
    
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
