//
//  VideoEditController.h
//  HappyShow
//
//  Created by Yuan on 2017/6/2.
//  Copyright © 2017年 Yuan. All rights reserved.
//

#import "BasicViewController.h"
#import "Util.h"

typedef NS_ENUM(NSUInteger, ButtonType) {
    AllButton,
  VideoButton,
    PictureButton,
};

@interface VideoEditController : BasicViewController
@property (assign,nonatomic) int sortType;//排序方式
@property (assign,nonatomic) FilterType filterType;

@end
