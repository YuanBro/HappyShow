//
//  HeadView.h
//  HappyShow
//
//  Created by Yuan on 2017/5/24.
//  Copyright © 2017年 Yuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HeadView;

@protocol HeadViewDelegate <NSObject>

-(void)didSelectIndex:(NSInteger)index;



@end


@interface HeadView : UIView

@property(nonatomic,weak)id<HeadViewDelegate>delegate;
@property(nonatomic) CALayer* line;
@property(nonatomic)UIButton* home;
-(id)initWithFrame:(CGRect)frame Name:(NSArray*)title;


@end
