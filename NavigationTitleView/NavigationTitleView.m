//
//  NavigationTitleView.m
//  NavigationTitleView
//
//  Created by fantasy on 16/2/25.
//  Copyright © 2016年 fantasy. All rights reserved.
//

#import "NavigationTitleView.h"

#define  WKFColor(a,b,c,d) [UIColor colorWithRed:(a)/255. green:(b)/255. blue:(c)/255. alpha:(d)]

#define defaultColor WKFColor(81, 81, 81, 1)
#define defaultFont  [UIFont systemFontOfSize:17]
#define labelMargin  20

@interface NavigationTitleView ()<UIScrollViewDelegate>

@property (weak, nonatomic) UILabel * lableFirst;
@property (weak, nonatomic) UILabel * lableSecond;
@property (weak, nonatomic) UIView * containerView;

@end

@implementation NavigationTitleView

- (instancetype)initWithFrame:(CGRect)frame Text:(NSString *)text{
  
  return [self initWithFrame:frame Text:text andTitleFont:defaultFont];
  
}

- (instancetype)initWithFrame:(CGRect)frame Text:(NSString *)text andTitleFont:(UIFont *)font{

  return [self initWithFrame:frame Text:text andTitleFont:font andTitleColor:defaultColor];
  
}

- (instancetype)initWithFrame:(CGRect)frame Text:(NSString *)text andTitleFont:(UIFont *)font andTitleColor:(UIColor *)color{

  if (self = [super initWithFrame:frame]) {
    
    self.clipsToBounds = YES;
    self.userInteractionEnabled = NO;
    
    font = font ? font : defaultFont;
    color = color ? color : defaultColor;
    
    [self setupChildViewFrame:(CGRect)frame Text:text andTitleFont:font andTitleColor:color];
    
  }
  return self;
  
}


- (void)setupChildViewFrame:(CGRect)frame Text:(NSString *)text andTitleFont:(UIFont *)font andTitleColor:(UIColor *)color{
  
  NSAssert1(text.length, @"%@ textlength == 0", self);
  
  UIView * containerView = [[UIView alloc]initWithFrame:frame];
  containerView.backgroundColor = [UIColor clearColor];
  _containerView = containerView;
  [self addSubview:containerView];
  
  UILabel * labelFirst = [[UILabel alloc]init];
  labelFirst.textAlignment = NSTextAlignmentCenter;
  labelFirst.font = font;
  labelFirst.textColor = color;
  labelFirst.text = text;
  _lableFirst = labelFirst;
  [_containerView addSubview:labelFirst];
  
  UILabel * labelSecond = [[UILabel alloc]init];
  labelSecond.textAlignment = NSTextAlignmentCenter;
  labelSecond.font = font;
  labelSecond.text = text;
  labelSecond.textColor = color;
  _lableSecond = labelSecond;
  [_containerView addSubview:labelSecond];
  
  [self beReadyToAnimateFrame:frame];
}

- (void)beReadyToAnimateFrame:(CGRect)frame {

  
  CGRect rect = [self.lableFirst.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.lableFirst.font} context:nil];
  
  
  
  if (rect.size.width <= frame.size.width) {
    
    _lableFirst.frame = frame;
    [_lableSecond removeFromSuperview];
    
  } else {
    
    _lableFirst.frame = CGRectMake(0, 0, rect.size.width, self.frame.size.height);
    _lableSecond.frame = CGRectMake(rect.size.width+labelMargin,0 , rect.size.width, self.frame.size.height);
    [self startToAnimate];
  }

}

- (void)startToAnimate{

  //每秒移动20个点
  CGFloat speed = 20.0;
  CABasicAnimation * animate = [CABasicAnimation animation];
  animate.fromValue = @(0);
  animate.toValue=@(-self.lableFirst.frame.size.width - labelMargin);
  animate.keyPath = @"transform.translation.x";
  animate.duration = (_lableFirst.frame.size.width + labelMargin) / speed;
  animate.removedOnCompletion = YES;
  animate.repeatCount = MAXFLOAT;
  [_containerView.layer addAnimation:animate forKey:@"containerView animation"];
  
}


@end
