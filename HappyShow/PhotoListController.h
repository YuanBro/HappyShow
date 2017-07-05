//
//  PhotoListController.h
//  HappyShow
//
//  Created by Yuan on 2017/6/5.
//  Copyright © 2017年 Yuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadTool.h"
#import "UINavigationBar+Util.h"
#import "Util.h"
typedef void(^imageBlock)(NSMutableArray *array);

@protocol LHCollectionViewControllerDelegate <NSObject>
-(void)backImage:(NSArray *)image;//
@end
@interface PhotoListController : UICollectionViewController

@property (nonatomic,strong) LoadTool *album;
@property (nonatomic,copy) imageBlock imageBlockArray;
@property (nonatomic,assign) NSInteger maxChooseNumber;//最多选择的数量
@end
