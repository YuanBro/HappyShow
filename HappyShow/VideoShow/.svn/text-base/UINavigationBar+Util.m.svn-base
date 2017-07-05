//
//  UINavigationBar+Util.m
//  VideoShow
//
//  Created by lance on 15/5/12.
//  Copyright (c) 2015年 energy. All rights reserved.
//

#import "UINavigationBar+Util.h"
#import "UIColor+Util.h"

#define NavigationTintColor @"#ffffff"
#define backButtonOffset 5

@implementation UINavigationBar (Util)

-(void) initWithViewController:(UIViewController *)control title:(NSString *)title
{
    control.title=title;
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor blackColor];
    shadow.shadowOffset = CGSizeMake(0.f, 0.f);
    
    [self setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     [UIColor whiteColor], NSForegroundColorAttributeName,
                                                                     shadow, NSShadowAttributeName,
                                                                     [UIFont boldSystemFontOfSize:17], NSFontAttributeName,
                                                                     nil]];
    [self setTintColor:[UIColor whiteColor]];
    
}

-(void) initWithViewController:(UIViewController *)control leftText:(NSString *)leftText leftImageName:(NSString*)imageName action:(SEL) action
{
    UIView *leftBtnView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    leftBtnView.userInteractionEnabled = YES;
    UITapGestureRecognizer *backBtnTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:control action:action];
    [leftBtnView addGestureRecognizer:backBtnTapGesture];
    
    CGRect arrowRect=CGRectMake(backButtonOffset, 0, 11, 19);;
    UIImageView *leftArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    leftArrow.frame = arrowRect;
    [leftBtnView addSubview:leftArrow];
    leftArrow.center = CGPointMake(leftArrow.center.x, leftBtnView.center.y);
    
    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(arrowRect.origin.x+arrowRect.size.width+5, 0, 45, 44)];
    leftLabel.backgroundColor = [UIColor clearColor];
    leftLabel.text = leftText;
    leftLabel.font = [UIFont boldSystemFontOfSize:17];
    leftLabel.textColor = [UIColor colorWithHexString:backTextColor];
    [leftLabel sizeToFit];
    [leftBtnView addSubview:leftLabel];
    leftLabel.center = CGPointMake(leftLabel.center.x, leftBtnView.center.y);
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:leftBtnView];
    leftBarButton.style = UIBarButtonItemStylePlain;
    control.navigationItem.leftBarButtonItem = leftBarButton;
}

-(void) initWithViewController:(UIViewController *)control leftImageName:(NSString*)imageName action:(SEL) action
{
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(backButtonOffset+5, 0, 22, 38)];
    [leftButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [leftButton addTarget:control action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    control.navigationItem.leftBarButtonItem=leftBarButton;
}

-(void) initWithViewController:(UIViewController *)control rightText:(NSString *)rightText rightImageName:(NSString*)imageName action:(SEL) action
{
    UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
    rightLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *nextBtnTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:control action:action];
    [rightLabel addGestureRecognizer:nextBtnTapGesture];
    rightLabel.backgroundColor = [UIColor clearColor];
    rightLabel.textAlignment = NSTextAlignmentRight;
    rightLabel.font = [UIFont boldSystemFontOfSize:17];
    rightLabel.text = rightText;
    rightLabel.textColor = [UIColor colorWithRed:221/255.0 green:107/255.0 blue:111/255.0 alpha:1.0];
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithCustomView:rightLabel];
    control.navigationItem.rightBarButtonItem = nextButton;
    
}

-(void) initWithViewController:(UIViewController *)control rightImageName:(NSString*)imageName action:(SEL) action
{
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    [rightButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [rightButton addTarget:control action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    control.navigationItem.rightBarButtonItem=rightBarButton;

}

-(void) initWithViewController:(UIViewController *)control title:(NSString *)title leftAction:(SEL) action
{
    [self initWithViewController:control title:title];
    [self initWithViewController:control leftImageName:@"ic_back_arrow.png" action:action];
}

-(void) initWithViewController:(UIViewController *)control title:(NSString *)title leftImageName:(NSString*)leftImageName leftAction:(SEL) leftAction rightImageName:(NSString*)rightImageName rightAction:(SEL) rightAction
{
    [self initWithViewController:control title:title];
    [self initWithViewController:control leftImageName:leftImageName action:leftAction];
    [self initWithViewController:control rightImageName:rightImageName action:rightAction];
}

@end
