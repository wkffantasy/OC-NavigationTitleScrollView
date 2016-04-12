//
//  NavigationTitleView.h
//  NavigationTitleView
//
//  Created by fantasy on 16/2/25.
//  Copyright © 2016年 fantasy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationTitleView : UIView

/**
 *  更新label的文字内容
 */
- (void)updateText:(NSString *)text
      andTitleFont:(UIFont *)font
     andTitleColor:(UIColor *)color;


- (instancetype)initWithFrame:(CGRect)frame
                         Text:(NSString *)text;

- (instancetype)initWithFrame:(CGRect)frame
                         Text:(NSString *)text
                 andTitleFont:(UIFont *)font;

- (instancetype)initWithFrame:(CGRect)frame
                         Text:(NSString *)text
                 andTitleFont:(UIFont *)font
                andTitleColor:(UIColor *)color;

@end
