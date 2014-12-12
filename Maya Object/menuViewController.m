//
//  ViewController.m
//  Maya Object
//
//  Created by Maya Hirakawa on 2014/11/04.
//  Copyright (c) 2014年 Maya Hirakawa. All rights reserved.
//

#import "menuViewController.h"
#import "indexViewController.h"
#import "AppDelegate.h"
@interface menuViewController ()

@end

@implementation menuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //バーのカラーカスタマイズ
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];  // バーアイテムカラー
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.211 green:0.8 blue:1.0 alpha:1.000];  // バー背景色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

}
//画面開いた時
- (void)viewWillAppear:(BOOL)animated  {

    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];//117
    //searchKeywordのリセット
    app.searchKeyword = nil;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (IBAction)tapmovie:(id)sender {
    
       NSLog(@"Tap");
    
    //ボタンを押された時のナビゲーションコントローラーでの画面遷移
    indexViewController *ivc = [self.storyboard instantiateViewControllerWithIdentifier:@"indexViewController"];
    [[self navigationController] pushViewController:ivc animated:YES];
    
   
    //画面遷移の時に移動先indexのファーストセレクトナムという変数にタグのナンバーを代入
    ivc.first_select_num = self.movie.tag;
}

- (IBAction)tapbook:(id)sender {
   
    indexViewController *ivc = [self.storyboard instantiateViewControllerWithIdentifier:@"indexViewController"];
    [[self navigationController] pushViewController:ivc animated:YES];
    ivc.first_select_num = self.book.tag;
    
}
- (IBAction)tapmusic:(id)sender {
    
    indexViewController *ivc = [self.storyboard instantiateViewControllerWithIdentifier:@"indexViewController"];
    [[self navigationController] pushViewController:ivc animated:YES];
    ivc.first_select_num = self.music.tag;
}
- (IBAction)tapfood:(id)sender {
    
    indexViewController *ivc = [self.storyboard instantiateViewControllerWithIdentifier:@"indexViewController"];
    [[self navigationController] pushViewController:ivc animated:YES];
    ivc.first_select_num = self.food.tag;
}
- (IBAction)tapplace:(id)sender {
    
    indexViewController *ivc = [self.storyboard instantiateViewControllerWithIdentifier:@"indexViewController"];
    [[self navigationController] pushViewController:ivc animated:YES];
    ivc.first_select_num = self.place.tag;
}
- (IBAction)tapother:(id)sender {
    
    indexViewController *ivc = [self.storyboard instantiateViewControllerWithIdentifier:@"indexViewController"];
    [[self navigationController] pushViewController:ivc animated:YES];
    ivc.first_select_num = self.other.tag;
    }
- (IBAction)tapinformation:(id)sender {
}


@end
