//
//  LoadTool.h
//  HappyShow
//
//  Created by Yuan on 2017/6/2.
//  Copyright © 2017年 Yuan. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ModelPhoto.h"
#import <Photos/Photos.h>
@interface LoadTool : NSObject
@property (nonatomic, assign) int TAG;
//相册名字
@property (nonatomic, copy) NSString *title;
//相册数量
@property (nonatomic, assign) NSInteger count;

@property (nonatomic,copy)  NSDate *time;

@property (nonatomic, strong) PHAsset *headImageAsset;

@property (nonatomic, strong) PHAssetCollection *assetCollection;

@property(nonatomic) NSMutableArray<ModelPhoto*> *photoAblumList;

/************************** 方法事件 **************************/

+ (instancetype)sharePhotoTool;
/**
 * @brief Save the photo albums to the system
 */
- (void)saveImageToAblum:(UIImage *)image completion:(void (^)(BOOL suc, PHAsset *asset))completion;
/**
 * @brief Get the user list all albums
 */
- (NSMutableArray<LoadTool *> *)getPhotoAblumList;
/**
 * @brief For all images resources in the album
 * @param ascending Whether the positive sequence arrangement created time YES, creation time is (l) sequence arrangement;NO, creation time fell (fall) sequence alignment
 */
- (NSArray<PHAsset *> *)getAllAssetInPhotoAblumWithAscending:(BOOL)ascending;
/**
 * @brief For all images within a specified album
 */
- (NSArray<PHAsset *> *)getAssetsInAssetCollection:(PHAssetCollection *)assetCollection ascending:(BOOL)ascending;
/**
 * @brief Each Asset obtained the corresponding pictures
 */
- (void)requestImageForAsset:(PHAsset *)asset size:(CGSize)size resizeMode:(PHImageRequestOptionsResizeMode)resizeMode completion:(void (^)(UIImage *image, NSDictionary *info))completion;
/**
 * @brief Click ok, to get each Asset corresponding pictures (imageData)
 */
- (void)requestImageForAsset:(PHAsset *)asset scale:(CGFloat)scale resizeMode:(PHImageRequestOptionsResizeMode)resizeMode completion:(void (^)(UIImage *image))completion;
/**
 * @brief Get the size, in bytes array images
 */
//- (void)getPhotosBytesWithArray:(NSArray *)photos completion:(void (^)(NSString *photosBytes))completion;

/**
 * @brief Access to an array of image size for an array of bytes in a byte size
 */
- (BOOL)judgeAssetisInLocalAblum:(PHAsset *)asset ;
;
@end
