//
//  HeaderAnimationVC.m
//  First
//
//  Created by kurusagi on 16/7/5.
//  Copyright © 2016年 kurusagi. All rights reserved.
//

#import "HeaderAnimationVC.h"
#import "headerCell.h"

@interface HeaderAnimationVC ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation HeaderAnimationVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.alpha = 0;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId = @"cell";
    headerCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    [cell.button addTarget:self action:@selector(Click) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)Click{
    NSLog(@"click");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%@",[scrollView class]);
    NSLog(@"%f",scrollView.contentOffset.y);
    float y = 0;
    if (scrollView.contentOffset.y > 100) {
        y = 100;
    }else{
        y = scrollView.contentOffset.y;
    }
    self.navigationController.navigationBar.alpha = y / 100.0;
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
