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
  
  
  CGRect frame = CGRectMake(0, 0, self.view.frame.size.width - 100, 40);
  
  NavigationTitleView * titleView = [[NavigationTitleView alloc]initWithFrame:frame Text:@"七里香" andTitleFont:nil andTitleColor:[UIColor redColor]];
//  NavigationTitleView * titleView = [[NavigationTitleView alloc]initWithFrame:frame Text:@"为你弹奏肖邦的夜曲，纪念我逝去的爱情" andTitleFont:nil andTitleColor:nil];
//  NavigationTitleView * titleView = [[NavigationTitleView alloc]initWithFrame:frame Text:@"七里香"];
  _titleView = titleView;
  self.navigationItem.titleView = titleView;
  
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
  
  [_titleView updateText:@"缓缓飘落的枫叶像思念，我点燃烛火温暖岁末的秋天" andTitleFont:nil andTitleColor:nil];
  
}

@end
