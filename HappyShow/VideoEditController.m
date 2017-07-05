//
//  VideoEditController.m
//  HappyShow
//
//  Created by Yuan on 2017/6/2.
//  Copyright © 2017年 Yuan. All rights reserved.
//

#import "VideoEditController.h"
#import "UINavigationBar+Util.h"
#import "Util.h"
#import <Photos/Photos.h>
#import "AssetsCell.h"
#import "AlbumCell.h"
#import "LoadTool.h"
#import "PhotoListController.h"
typedef void(^backArrayBlock)(NSMutableArray *array);
@interface VideoEditController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,copy) backArrayBlock  mAlbums;
@property(nonatomic)NSMutableArray*listArray;
@end

@implementation VideoEditController
{
    CALayer* line;
    UIView* headview;
    CGFloat h;
    UITableView* tableview;
}

static NSString * cellIdentifier = @"AlbumCell";
- (void)viewDidLoad
{
    
    [super viewDidLoad];
   
    self.view.backgroundColor=[UIColor whiteColor];
    self.listArray=[NSMutableArray array];
    //设置导航
    [self setupNav];
    //头部按钮视图
    [self creatHeadView];
    //设置tableview
    [self setuptableview];
    
    
}
-(void)setuptableview
{
    CGFloat Y = headview.frame.size.height+h;
    CGFloat tableH = kScreen_height-Y;
    tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, Y, kScreen_width, tableH) style:UITableViewStylePlain];
    tableview.backgroundColor=[UIColor whiteColor];
    
    UINib *tableNib=[UINib nibWithNibName:cellIdentifier bundle:nil];
    [tableview registerNib:tableNib forCellReuseIdentifier:cellIdentifier];
    tableview.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:tableview];

    tableview.delegate=self;
    tableview.dataSource=self;
    [self loadAlbums];

}

-(void)creatHeadView
{
    NSArray * btnArray=@[@"全部",@"视频",@"图片"];
     h=self.navigationController.navigationBar.frame.size.height+ [[UIApplication sharedApplication] statusBarFrame].size.height;

     headview=[[UIView alloc]initWithFrame:CGRectMake(0, h, kScreen_width, 44)];
    headview.backgroundColor=[UIColor lightGrayColor];
    
    for(int i=0;i<btnArray.count;i++)
    {
    
        UIButton* btn=[[UIButton alloc]initWithFrame:CGRectMake(kScreen_width*i/3, 0, kScreen_width/3, 44)];
        [btn setTitle:btnArray[i] forState:0];
        [btn setTitleColor:[UIColor blackColor] forState:0];
        [btn setBackgroundColor:[UIColor clearColor]];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        
        if (i==0) {
            btn.selected=YES;
        }
        btn.tag=i;
        [btn addTarget:self action:@selector(didSelect:) forControlEvents:UIControlEventTouchUpInside];
        [headview addSubview:btn];
    }
    line=[CALayer layer];
    line.frame=CGRectMake(0, h-2-20, kScreen_width/3, 2);
    line.backgroundColor=[UIColor redColor].CGColor;
    
    [headview.layer addSublayer:line];
    [self.view addSubview:headview];

}
-(void)didSelect:(UIButton*)sender
{
   loadtool.TAG=(int)sender.tag;
    for (UIButton* btn in headview.subviews) {
        btn.selected=NO;
    }
    [loadtool.photoAblumList removeAllObjects];
    switch (sender.tag) {
        case 0:
        {
           [self.navigationController.navigationBar initWithViewController:self title:@"全部"];
            
       
          
              [self loadAlbums];
        }
            break;
        case 1:
        {
            [self.navigationController.navigationBar initWithViewController:self title:@"视频"];
              [self loadAlbums];
        }
            break;

        case 2:
        {
            [self.navigationController.navigationBar initWithViewController:self title:@"图片"];
              [self loadAlbums];
        }
            break;

            
        default:
            break;
    }
    
    sender.selected=YES;
    
    line.frame=CGRectMake(kScreen_width*sender.tag/3, h-2-20, kScreen_width/3, 2);
    


}
-(void)setupNav
{
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar initWithViewController:self leftText:NSLocalizedString(@"返回", nil) leftImageName:@"ic_back_arrow.png" action:@selector(fun)];
    
    [self.navigationController.navigationBar initWithViewController:self title:@"全部"];
}
-(void)fun
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"内存警告！");
}

-(void)loadAlbums
{
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied) {
        NSLog(@"暂无访问权限");
    }else{
        [self.listArray removeAllObjects];
        [self.listArray addObjectsFromArray:[[LoadTool sharePhotoTool]getPhotoAblumList]];
        [tableview reloadData];
    }
}
/** 加载相册中的内容 */
//-(void) loadAssets:(ALAssetsGroup *) group{
//   // self.storyPanel.view.hidden=NO;
//    
//    //[self.mAssets removeAllObjects];
//   // [self.mAssetsCollect reloadData];
//    
//    __weak VideoEditController * weakSelf = self;
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//        @autoreleasepool {
//            //这里是串行执行
//            [group enumerateAssetsUsingBlock:^(ALAsset * result,NSUInteger index, BOOL *stop) {
//                if (result == nil) {
//                    return;
//                }
//                [weakSelf.mAssets addObject:result];
//            }];
//        }
//        
//        //根据时间排序---最新排前
//        [weakSelf.mAssets sortUsingComparator:^NSComparisonResult(id obj0,id obj1){
//            ALAsset * a0=obj0;
//            ALAsset * a1=obj1;
//            NSDate * d0=[a0 valueForProperty:ALAssetPropertyDate];
//            NSDate * d1=[a1 valueForProperty:ALAssetPropertyDate];
//            return [d1 compare:d0];
//        }];
//        
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            [UIView animateWithDuration:animTime animations:^{
//                CGRect rect=weakSelf.mAlbumsTable.frame;
//                rect.origin.x-=rect.size.width;
//                weakSelf.mAlbumsTable.frame=rect;
//                weakSelf.mAlbumsTable.alpha=0.5;
//                [weakSelf.mAssetsCollect reloadSections:[NSIndexSet indexSetWithIndex:0]];
//            } completion:^(BOOL finished){
//                if (finished) {
//                    self.mAssetsCollect.hidden = NO;
//                    weakSelf.mAlbumsTable.hidden=YES;
//                    
//                }
//            }];
//            
//        });
//    });
//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.listArray==nil) {
        return 0;
    }
    return self.listArray.count;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AlbumCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    LoadTool* load = self.listArray[indexPath.row];
    
    [[LoadTool sharePhotoTool] requestImageForAsset:load.headImageAsset size:CGSizeMake(72*3, 72*3) resizeMode:PHImageRequestOptionsResizeModeFast completion:^(UIImage *image, NSDictionary *info) {
        cell.image.image = image;
    }];
    cell.subtitle.text=load.title;
    cell.detail.text=[NSString stringWithFormat:@"%ld",(long)load.count];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    PhotoListController *collect = [[PhotoListController alloc]init];
    __weak VideoEditController *weakSelf = self;
    collect.imageBlockArray = ^(NSMutableArray<PHAsset *>*array){
        __strong VideoEditController *strongSelf = weakSelf;
        if (array) {
            strongSelf.mAlbums(array);
        }
    };
    //collect.maxChooseNumber = self.maxChooseNumber;
    collect.album = _listArray[indexPath.row];

    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:collect] animated:YES completion:nil];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 105;
}

//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
//{
//    if (collectionView.tag==Assets_tag) {
//        return mAssets.count;
//    }
//    return 0;
//}
@end
