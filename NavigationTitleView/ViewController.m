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

@property (weak, nonatomic)NavigationTitleView *titleView;

@end

@implementation ViewController

- (void)viewDidLoad {
  
  [super viewDidLoad];
  
  
  CGRect frame = CGRectMake(30, 100, self.view.frame.size.width - 100, 40);
  
  NavigationTitleView * titleView = [[NavigationTitleView alloc]initWithFrame:frame Text:@"缓缓飘落的枫叶像思念，我点燃烛火温暖岁末的秋天" andTitleFont:nil andTitleColor:[UIColor redColor]];
  _titleView = titleView;
  [self.view addSubview:titleView];
  
}

@end
