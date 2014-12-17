//
//  tutorialViewController.h
//  Maya Object
//
//  Created by Maya Hirakawa on 2014/12/16.
//  Copyright (c) 2014年 Maya Hirakawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tutorialViewController : UIViewController<UIScrollViewDelegate>


@property(nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,strong) UIPageControl *pageControl;

@property(nonatomic,strong) UIScrollView *canselView;


@end
