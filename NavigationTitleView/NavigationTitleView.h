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
 *  update label text
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
