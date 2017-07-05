//
//  ModelPhoto.h
//  HappyShow
//
//  Created by Taiping002 on 2017/7/4.
//  Copyright © 2017年 Yuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>
@interface ModelPhoto : NSObject
//相册名字
@property (nonatomic, copy) NSString *title;
//相册数量
@property (nonatomic, assign) NSInteger count;

@property (nonatomic,copy)  NSDate *time;

@property (nonatomic, strong) PHAsset *headImageAsset;

@property (nonatomic, strong) PHAssetCollection *assetCollection;
@end
