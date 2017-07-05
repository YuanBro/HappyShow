//
//  HomeButton.h
//  HappyShow
//
//  Created by Yuan on 2017/6/1.
//  Copyright © 2017年 Yuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeButton : UIButton

@property(nonatomic,copy)NSString* title;

-(id)initWithFrame:(CGRect)frame Title:(NSString*)title Image:(NSString*)image;

@end
