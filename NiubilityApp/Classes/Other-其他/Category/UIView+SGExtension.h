//
//  UIView+SGExtension.h
//  NiubilityApp
//
//  Created by 吕阳 on 16/3/1.
//  Copyright © 2016年 DeveloperYoung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SGExtension)
@property (nonatomic, assign)CGSize  size;
@property (nonatomic, assign)CGFloat width;
@property (nonatomic, assign)CGFloat height;
@property (nonatomic, assign)CGFloat x;
@property (nonatomic, assign)CGFloat y;
@property (nonatomic, assign)CGFloat centerX;
@property (nonatomic, assign)CGFloat centerY;

@property (nonatomic, assign) BOOL masksToBoundsWH;
@property (nonatomic, assign) CGFloat cornerRadiusWH;

@end
