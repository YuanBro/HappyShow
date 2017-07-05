
//  MainViewController.m
//  HappyShow
//
//  Created by Yuan on 2017/5/24.
//  Copyright © 2017年 Yuan. All rights reserved.

#import "MainViewController.h"
#import "HeadView.h"
#import "HomeViewController.h"
#import "FeatViewController.h"

@interface MainViewController ()<HeadViewDelegate,UIScrollViewDelegate>
@property(nonatomic)NSArray* array;
@property(nonatomic)UIButton* Home;
@property(nonatomic)UIButton* Featured;
@property(nonatomic)UIView*   Line;
@property(nonatomic)HeadView*   headview;


@end

@implementation MainViewController
{
    UIScrollView* scroview;
    HomeViewController* home;
    FeatViewController* feat;
    CGFloat offX;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;
    self.headview.delegate=self;
    [self.view addSubview:self.headview];
    
    home=[HomeViewController new];
    feat=[FeatViewController new];
    [self addChildViewController:home];
    [self addChildViewController:feat];
    [self setscroview];
    UIButton * setBut = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-54, 5, 44, 44)];
    [setBut setImage:[UIImage imageNamed:@"bt_setting_normal.png"] forState:UIControlStateNormal];
    [setBut addTarget:self action:@selector(setViewAction) forControlEvents:UIControlEventTouchUpInside];
    [self.headview addSubview:setBut];
    
}

-(void)setscroview
{
    
    scroview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 50, kScreen_width, kScreen_height)];
    [self.view addSubview:scroview];
    scroview.bounces=NO;
    scroview.pagingEnabled=YES;
    scroview.userInteractionEnabled=YES;
    scroview.delegate=self;
    
    for(int i=0;i<self.childViewControllers.count;i++)
    {
        
        UIViewController* vc=self.childViewControllers[i];
        vc.view.frame=CGRectMake(i*kScreen_width, 0, kScreen_width, kScreen_height);
        
        [scroview addSubview:vc.view];
        
    }
    scroview.contentSize=CGSizeMake(self.childViewControllers.count*kScreen_width, kScreen_height);
    
}
-(NSArray*)array
{
    
    if(!_array)
    {
        
        _array=@[@"首页",@"社区"];
    }
    
    return _array;
    
}

-(void)didSelectIndex:(NSInteger)index
{
    switch (index) {
        case 0:
        {
            if (offX==0) {
                feat.view.frame=CGRectMake(kScreen_width*1, 0, kScreen_width, kScreen_height);
                home.view.frame=CGRectMake(kScreen_width*0, 0, kScreen_width, kScreen_height);

            }
            else
            {
                home.view.frame=CGRectMake(kScreen_width*1, 0, kScreen_width, kScreen_height);
                feat.view.frame=CGRectMake(kScreen_width*0, 0, kScreen_width, kScreen_height);

            }
        }
            break;
        case 1:
        {
            if (offX==0) {
                feat.view.frame=CGRectMake(kScreen_width*0, 0, kScreen_width, kScreen_height);
                home.view.frame=CGRectMake(kScreen_width*1, 0, kScreen_width, kScreen_height);

            }
            else
            {
                home.view.frame=CGRectMake(kScreen_width*0, 0, kScreen_width, kScreen_height);
                feat.view.frame=CGRectMake(kScreen_width*1, 0, kScreen_width, kScreen_height);

            }
        }
            break;
            
        default:
            break;
    }
    
    
    
}
-(HeadView*)headview
{
    CGFloat N_H = self.navigationController.navigationBar.frame.size.height;
    CGFloat N_W = self.view.frame.size.width;
    if (!_headview) {
        _headview=[[HeadView alloc]initWithFrame:CGRectMake(0, 0, N_W, N_H+5) Name:self.array];
        
    }
    return _headview;
}

-(void)setViewAction
{
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"内存警告！");
}
/*************************ScroViewDelegate***********************************/

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    
     offX=scrollView.contentOffset.x;
    
    if (offX==kScreen_width) {
        self.headview.line.frame=CGRectMake((kScreen_width-80*self.array.count)*0.5+80+15, 42, 50, 2);
    }
    else
    {
        self.headview. line.frame=CGRectMake((kScreen_width-80*self.array.count)*0.5+15, 44, 50, 2);
    }
}

@end
