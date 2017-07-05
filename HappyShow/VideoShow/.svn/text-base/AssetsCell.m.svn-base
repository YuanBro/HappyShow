//
//  AssetsCell.m
//  VideoShow
//
//  Created by lance on 15/4/13.
//  Copyright (c) 2015年 energy. All rights reserved.
//

#import "AssetsCell.h"

@implementation AssetsCell

@synthesize assetImage;
@synthesize labelTime;

/** 在之前的版本如果不这样调用会出现找不到cell中对应的组件 */
-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray * nibs=[[NSBundle mainBundle] loadNibNamed:@"AssetsCell" owner:self options:nil];
        for (id obj in nibs) {
            if([obj isKindOfClass:[AssetsCell class]]){
                self = obj;
                break;
            }
        }
    }
    
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

@end
