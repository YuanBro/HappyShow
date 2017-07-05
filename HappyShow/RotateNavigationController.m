//
//  RotateNavigationController.m
//  VideoShow
//
//  Created by Jerry Chen  on 14/12/24.
//  Copyright (c) 2014年 energy. All rights reserved.
//

#import "RotateNavigationController.h"

@interface RotateNavigationController ()

@end

@implementation RotateNavigationController

-(void) viewDidLoad
{
    [super viewDidLoad];
    //self.hidesBarsOnSwipe=YES;
}

-(BOOL)shouldAutorotate {
    return [[self.viewControllers lastObject] shouldAutorotate];
}

//-(NSUInteger)supportedInterfaceOrientations {
//    return [[self.viewControllers lastObject] supportedInterfaceOrientations];
//}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [[self.viewControllers lastObject] preferredInterfaceOrientationForPresentation];
}

@end
