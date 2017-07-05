//
//  PhotoListController.m
//  HappyShow
//
//  Created by Yuan on 2017/6/5.
//  Copyright © 2017年 Yuan. All rights reserved.
//

#import "PhotoListController.h"
#import "AssetsCell.h"

@interface PhotoListController ()
@property (nonatomic,strong) NSArray<PHAsset *>*assetArray;//相册集里面的所有图片
@property (nonatomic,strong) NSMutableArray *selectedFalgList;//是否选中标记
@property (nonatomic,strong) NSMutableArray <PHAsset *>*assArray;//选中的图片
@end

@implementation PhotoListController


static NSString * const reuseIdentifier = @"Cell";

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

- (instancetype)init
{
    CGFloat imageSpacing=4;
    CGFloat maxCountInLine=4;
    //创建一个流式布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //每张图片的宽度
    CGFloat width = (kScreen_width - imageSpacing*(maxCountInLine - 1))/maxCountInLine;
    layout.itemSize = CGSizeMake(width, width);
    layout.minimumLineSpacing = imageSpacing;
    layout.minimumInteritemSpacing = imageSpacing;
//    //设置每个cell的大小
//    layout.itemSize = CGSizeMake(80, 80);
//    //设置每个cell间的最小水平间距
//    layout.minimumInteritemSpacing = 0;
//    //设置每个cell间的行间距
//    layout.minimumLineSpacing = 5;
//    //设置每一组距离四周的内边距
    layout.sectionInset = UIEdgeInsetsMake(5, 0, 0, 0);
    layout.headerReferenceSize = CGSizeMake(0, 40);
    layout.footerReferenceSize = CGSizeMake(0, 40);
    
    //返回
    return [super initWithCollectionViewLayout:layout];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
    self.collectionView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    
     [self.collectionView registerClass:[AssetsCell class] forCellWithReuseIdentifier:@"AssetsCell"];
    self.selectedFalgList = [NSMutableArray new];

//    self.fuzzyImageArray = [NSMutableArray new];
//    [self.fuzzyImageArray removeAllObjects];
    self.assArray = [NSMutableArray new];
    self.assetArray =  [[LoadTool sharePhotoTool]getAssetsInAssetCollection:self.album.assetCollection ascending:NO];
    NSLog(@"%@",self.assetArray);
//    [self.assetArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
//       
////            ALAssetsGroup * a0=obj0;
////            ALAssetsGroup * a1=obj1;
//        
////            return a1.numberOfAssets>a0.numberOfAssets;
//        
//    }];
    for (int i = 0;i<self.assetArray.count;i++) {
        [self.selectedFalgList addObject:@(0)];//首先默认是没有被选中的
    }

    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return self.assetArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"时间：%@",self.assetArray[indexPath.row].creationDate);

    AssetsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AssetsCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [AssetsCell new];
    }
    
//    __strong typeof(self) weakSelf = self;
    [[LoadTool sharePhotoTool] requestImageForAsset:self.assetArray[indexPath.row] size:CGSizeMake(65*3, 65*3) resizeMode:PHImageRequestOptionsResizeModeFast completion:^(UIImage *image, NSDictionary *info) {
//        __strong typeof(weakSelf) strongSelf = weakSelf;
        cell.assetImage.image = image;

//        [strongSelf.fuzzyImageArray addObject:image];
    }];
    
//    cell.isChoose = [_selectedFalgList[indexPath.row]boolValue];
//    cell.btnChooseBlock = ^{
//        __strong typeof(weakSelf) strongSelf = weakSelf;
//        [strongSelf isChooseOrNot:indexPath];
//
//     };
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
