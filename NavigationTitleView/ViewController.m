//
//  ViewController.m
//  NavigationTitleView
//
//  Created by fantasy on 16/2/25.
//  Copyright © 2016年 fantasy. All rights reserved.
//

#import "ViewController.h"

#import "NavigationTitleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  
  [super viewDidLoad];
  
  NavigationTitleView * titleView = [[NavigationTitleView alloc]init];
//  titleView.titleColor = [UIColor redColor];
//  titleView.titleName = @"父亲牵着我的双手静静走过清晨那安安静静的石板路";
//  titleView.titleName = @"缓缓飘落的枫叶像思念";
  titleView.titleName = @"为你弹奏肖邦的夜曲，纪念我逝去的爱情";
  titleView.frame = CGRectMake(0, 0, self.view.frame.size.width - 100, 40);
  self.navigationItem.titleView = titleView;
  
}


@end
