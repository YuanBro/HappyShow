//
//  HomeViewController.m
//  HappyShow
//
//  Created by Yuan on 2017/6/1.
//  Copyright © 2017年 Yuan. All rights reserved.
//

#import "HomeViewController.h"
#import "SDCycleScrollView.h"
#import "VideoEditController.h"
#import "RotateNavigationController.h"
#import "HomeButton.h"
#define NavHeight    self.navigationController.navigationBar.frame.size.height

@interface HomeViewController ()<SDCycleScrollViewDelegate>

@end

@implementation HomeViewController
CGFloat H;
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self setupPlayPicture];
    [self setupButton];
    UIView* view1=[[UIView alloc]initWithFrame:CGRectMake(0, H/3, kScreen_width, H*2/3)];
    view1.backgroundColor=[UIColor redColor];
    // [self.view addSubview:view1];
    
    
}
-(void)setupPlayPicture
{
    
    H  = kScreen_height-NavHeight;
    // 情景二：采用网络图片实现
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    
    // 情景三：图片配文字
    NSArray *titles = @[@"新建交流QQ群：185534916 ",
                        @"感谢您的支持，如果下载的",
                        @"如果代码在使用过程中出现问题",
                        @"您可以发邮件到gsdios@126.com"
                        ];
    
    // 网络加载 --- 创建带标题的图片轮播器
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreen_width, self.view.frame.size.height-kScreen_width-NavHeight) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.titlesGroup = titles;
    cycleScrollView2.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    [self.view addSubview:cycleScrollView2];
    
    //         --- 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
    });
    
}
-(void)setupButton
{
    NSArray* array1=@[@"视频编辑",@"音乐相册",@"超级相册"];
    NSArray* array2=@[@"素材商店",@"我的工作室",@"视频压缩"];
    NSArray* array3=@[@"视频倒放",@"快慢放",@"Pro"];
    NSArray* imagearray=@[@"emoji1f004",@"emoji1f005",@"emoji1f006",@"emoji1f007",@"emoji1f010",@"emoji1f011",@"emoji1f012",@"emoji1f014",@"emoji1f015"];
   
    
    CGFloat w= (kScreen_width-40)/3;
    CGFloat h=self.view.frame.size.height-kScreen_width-NavHeight;
    for (int i=0; i<3; i++) {
        
        HomeButton* btn=[[HomeButton alloc]initWithFrame:CGRectMake(10+(w+10)*i,h+10 , w, w) Title:array1[i] Image:imagearray[i]];
        
        [btn setBackgroundColor:[UIColor clearColor]];
        
        [btn addTarget:self action:@selector(didSelect:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.tag=i;
        
        [self.view addSubview:btn];
        
    }
    for (int i=0; i<3; i++) {
        
        HomeButton* btn=[[HomeButton alloc]initWithFrame:CGRectMake(10+(w+10)*i,h+w+10+10 , w, w) Title:array2[i] Image:imagearray[i+3]];
        
        [btn setBackgroundColor:[UIColor clearColor]];
        btn.tag=3+i;
        [btn addTarget:self action:@selector(didSelect:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
    }
    for (int i=0; i<3; i++) {
        
        HomeButton* btn=[[HomeButton alloc]initWithFrame:CGRectMake(10+(w+10)*i,h+(w+10)*2+10 , w, w) Title:array3[i] Image:imagearray[i+6]];
        
        [btn setBackgroundColor:[UIColor clearColor]];
        btn.tag=6+i;
        [btn addTarget:self action:@selector(didSelect:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
    }
    
    
    
    
}

-(void)didSelect:(UIButton*)sender
{
    
    switch (sender.tag) {
        case 0:
        {
            UINavigationController* nav=[[RotateNavigationController alloc]initWithRootViewController:[VideoEditController new]];
            nav.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:nav animated:YES completion:nil];
        }
            break;
        case 1:
        {
            UINavigationController* nav=[[RotateNavigationController alloc]initWithRootViewController:[VideoEditController new]];
            nav.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:nav animated:YES completion:nil];
        }
            break;
        case 2:
        {
            UINavigationController* nav=[[RotateNavigationController alloc]initWithRootViewController:[VideoEditController new]];
            nav.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:nav animated:YES completion:nil];
        }
            break;
        case 3:
        {
            
        }
            break;
        case 4:
        {
            
        }
            break;
        case 5:
        {
            
        }
            break;
        case 6:
        {
            
        }
            break;
        case 7:
        {
            
        }
            break;
        case 8:
        {
            
        }
            break;
            
        default:
            break;
    }
    
}
@end
