//
//  tutorialViewController.m
//  Maya Object
//
//  Created by Maya Hirakawa on 2014/12/16.
//  Copyright (c) 2014年 Maya Hirakawa. All rights reserved.
//

#import "tutorialViewController.h"

@interface tutorialViewController ()

@end

@implementation tutorialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSInteger pageSize = 6; // ページ数
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    
    // UIScrollViewのインスタンス化
    scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.bounds;
    
    // 横スクロールのインジケータを非表示にする
    scrollView.showsHorizontalScrollIndicator = NO;
    
    // ページングを有効にする
    scrollView.pagingEnabled = YES;
    
    scrollView.userInteractionEnabled = YES;
    scrollView.delegate = self;
    
    // スクロールの範囲を設定
    [scrollView setContentSize:CGSizeMake((pageSize * width), height)];
    
    // スクロールビューを貼付ける
    [self.view addSubview:scrollView];
    
    // スクロールビューにラベルを貼付ける
    for (int i = 0; i < pageSize; i++) {
       UIImage *image = [[UILabel alloc]initWithFrame:CGRectMake(i * width, 0, width, height)];
//        image.text = [NSString stringWithFormat:@"%d", i + 1];
//        image.font = [UIFont fontWithName:@"Arial" size:92];
//        image.backgroundColor = [UIColor yellowColor];
//        image.textAlignment = UITextAlignmentCenter;
//        [scrollView addSubview:label];
        
//        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(i * width, 0, width, height)];
//        label.text = [NSString stringWithFormat:@"%d", i + 1];
//        label.font = [UIFont fontWithName:@"Arial" size:92];
//        label.backgroundColor = [UIColor yellowColor];
//        label.textAlignment = UITextAlignmentCenter;
//        [scrollView addSubview:label];

        
    }
    
    // ページコントロールのインスタンス化
    CGFloat x = (width - 300) / 2;
    pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(x, 350, 300, 50)];
    
    // 背景色を設定
    pageControl.backgroundColor = [UIColor blackColor];
    
    // ページ数を設定
    pageControl.numberOfPages = pageSize;
    
    // 現在のページを設定
    pageControl.currentPage = 0;
    
    // ページコントロールをタップされたときに呼ばれるメソッドを設定
    pageControl.userInteractionEnabled = YES;
    [pageControl addTarget:self
                    action:@selector(pageControl_Tapped:)
          forControlEvents:UIControlEventValueChanged];
    
    // ページコントロールを貼付ける
    [self.view addSubview:pageControl];

    
    

}

/**
 * スクロールビューがスワイプされたとき
 * @attention UIScrollViewのデリゲートメソッド
 */
- (void)scrollViewDidScroll:(UIScrollView *)_scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    if ((NSInteger)fmod(scrollView.contentOffset.x , pageWidth) == 0) {
        // ページコントロールに現在のページを設定
        pageControl.currentPage = scrollView.contentOffset.x / pageWidth;
    }
}

/**
 * ページコントロールがタップされたとき
 */
- (void)pageControl_Tapped:(id)sender
{
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * pageControl.currentPage;
    [scrollView scrollRectToVisible:frame animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
