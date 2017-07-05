//
//  HomeButton.m
//  HappyShow
//
//  Created by Yuan on 2017/6/1.
//  Copyright © 2017年 Yuan. All rights reserved.
//

#import "HomeButton.h"

@implementation HomeButton

-(id)initWithFrame:(CGRect)frame Title:(NSString *)title Image:(NSString *)image
{

    if (self=[super initWithFrame:frame]) {
        
        UIImageView* imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*2/3)];
        imageview.image=[UIImage imageNamed:image];
        imageview.contentMode=UIViewContentModeScaleAspectFit;
        UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height*2/3, self.frame.size.width, self.frame.size.height*1/3)];
        label.text=title;
        label.textColor=[UIColor blackColor];
        label.textAlignment=NSTextAlignmentCenter;
        
        [self addSubview:imageview];
        [self addSubview:label];
    }


    return self;
}

@end
