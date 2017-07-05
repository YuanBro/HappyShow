//
//  HeadView.m
//  HappyShow
//
//  Created by Yuan on 2017/5/24.
//  Copyright © 2017年 Yuan. All rights reserved.
//

#import "HeadView.h"

@implementation HeadView
{

    NSArray* headtitle;
    
   
    

}
CGFloat width=80;
CGFloat staff=5;
-(id)initWithFrame:(CGRect)frame Name:(NSArray *)title
{
    if (self==[super initWithFrame:frame])
    {
        headtitle=title;
        
        self.backgroundColor=[UIColor blackColor];
        
        [self creatui];
    }

    return self;
}

-(void)creatui
{
    self.line=[CALayer layer];
    self.line.frame=CGRectMake((kScreen_width-width*headtitle.count)*0.5+15, 44, 50, 2);
    self.line.backgroundColor=[UIColor redColor].CGColor;
    [self.layer addSublayer:self.line];
    if (headtitle)
    {
        for(int i=0;i<headtitle.count;i++)
        {
            UIButton* btn=[UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame=CGRectMake((kScreen_width-width*headtitle.count)*0.5+width*i, staff, width, 42);
            [btn setTitle:headtitle[i] forState:0];
            
            [btn setTitleColor:[UIColor grayColor] forState:0];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            [btn setBackgroundColor:[UIColor clearColor]];
            btn.tag=i;
            [btn addTarget:self action:@selector(confirm:) forControlEvents:UIControlEventTouchUpInside];
            
            if (i==0)
            {
                btn.selected=YES;
            }
            [self addSubview:btn];
        }
    }
}
-(void)confirm:(UIButton*)sender
{
    __weak typeof (HeadView*)view=self;

   view.line.frame=CGRectMake((kScreen_width-width*headtitle.count)*0.5+width*sender.tag+15, 42, 50, 2);
    
        for (UIButton* btn in view.subviews)
        {
            btn.selected=NO;

        }
    
       [self.delegate didSelectIndex:sender.tag];

       sender.selected=YES;
}


@end
