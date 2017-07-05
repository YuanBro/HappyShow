//
//  NavigationBarUtil.h
//  VideoShow
//
//  Created by lance on 15/4/13.
//  Copyright (c) 2015年 energy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/** 通用的导航栏工具 */
@interface NavigationBarUtil : NSObject

+(UINavigationItem*) initNavigationBar:(UIViewController *)control leftAction:(SEL)leftAction rightAction:(SEL)rightAction;

+(UINavigationItem*) initNavigationBar:(UIViewController *)control title:(NSString*)title leftTitle:(NSString*)leftTitle rightTitle:(NSString*)rightTitle leftAction:(SEL)leftAction rightAction:(SEL)rightAction;

@end
