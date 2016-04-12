//
//  NavigationTitleView.m
//  NavigationTitleView
//
//  Created by fantasy on 16/2/25.
//  Copyright © 2016年 fantasy. All rights reserved.
//

#import "NavigationTitleView.h"

#define  WKFColor(a,b,c,d) [UIColor colorWithRed:(a)/255. green:(b)/255. blue:(c)/255. alpha:(d)]
#define padding 1
#define labelMargin 10

@interface NavigationTitleView ()<UIScrollViewDelegate>

@property (weak, nonatomic) UILabel * lableFirst;
@property (weak, nonatomic) UILabel * lableSecond;
@property (weak, nonatomic) UIScrollView * scrollView;

@property (strong, nonatomic) NSTimer *myTimer;

@property (assign, nonatomic) CGFloat textWidth;


#warning 待优化
@end

@implementation NavigationTitleView

- (instancetype)initWithFrame:(CGRect)frame{
  
  if (self = [super initWithFrame:frame]) {
    
    self.userInteractionEnabled = NO;
    
  }
  return self;
  
}

- (void)setupChildView{
  
  UIScrollView * scrollView = [[UIScrollView alloc]init];
  scrollView.pagingEnabled = NO;
  scrollView.showsHorizontalScrollIndicator = NO;
  scrollView.bounces = NO;
  _scrollView = scrollView;
  [self addSubview:scrollView];
  
  UILabel * labelFirst = [[UILabel alloc]init];
  labelFirst.textAlignment = NSTextAlignmentCenter;
  _lableFirst = labelFirst;
  [scrollView addSubview:labelFirst];
  
  UILabel * labelSecond = [[UILabel alloc]init];
  labelSecond.textAlignment = NSTextAlignmentCenter;
  _lableSecond = labelSecond;
  [scrollView addSubview:labelSecond];
  
}

- (void)setTitleName:(NSString *)titleName{
  
  _titleName = titleName;
  [self setupChildView];
  
  self.lableFirst.text = _titleName;
  self.lableSecond.text = _titleName;
  
}
#pragma mark - 计时器
//添加计时器
- (void)addTimer {
  
  self.myTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(runTimer) userInfo:nil repeats:YES];
  [[NSRunLoop currentRunLoop] addTimer:_myTimer forMode:NSRunLoopCommonModes];
  
}

//移除计时器
- (void)removeTimer {
  
  [self.myTimer invalidate];
  
  self.myTimer = nil;
  
}

//计时器运行的方法
-(void)runTimer{
  
  CGFloat x = self.scrollView.contentOffset.x;
  
  x += padding;
  
  if (x <= self.textWidth && x + padding >= self.textWidth) {
    
    x = 0;
    
  }
  
  [self.scrollView setContentOffset:CGPointMake(x, 0) animated:NO];
  
  
  
}

- (void)dealloc{
  
  [self removeTimer];
  
}

- (void)layoutSubviews{
  
  [super layoutSubviews];
  
  NSAssert(_titleName.length, @"");
  
  if (_titleColor == nil) {
    _titleColor = WKFColor(80, 80, 80, 1);
  }
  
  if (_titleFont == nil) {
    _titleFont = [UIFont systemFontOfSize:17];
  }
  
  self.lableFirst.textColor = _titleColor;
  self.lableSecond.textColor = _titleColor;
  
  self.lableFirst.font = _titleFont;
  self.lableSecond.font = _titleFont;
  
  CGRect rect = [_titleName boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_titleFont} context:nil];
  
  
  _textWidth = rect.size.width + labelMargin + self.scrollView.frame.size.width;
  
  _scrollView.frame = self.bounds;
  
  if (rect.size.width <= self.frame.size.width) {
    
    _scrollView.contentSize = self.frame.size;
    _lableFirst.frame = self.bounds;
    [_lableSecond removeFromSuperview];
    
  } else {
    
    _scrollView.contentSize = CGSizeMake(rect.size.width * 2 + labelMargin, self.frame.size.height);
    _lableFirst.frame = CGRectMake(0, 0, rect.size.width, self.frame.size.height);
    _lableSecond.frame = CGRectMake(rect.size.width+labelMargin,0 , rect.size.width, self.frame.size.height);
    if (self.myTimer == nil) {
      [self addTimer];
    }
    
  }
  
  
  
}


@end
