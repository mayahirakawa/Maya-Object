//
//  ViewController.m
//  Maya Object
//
//  Created by Maya Hirakawa on 2014/11/04.
//  Copyright (c) 2014年 Maya Hirakawa. All rights reserved.
//

#import "menuViewController.h"
#import "indexViewController.h"

@interface menuViewController ()

@end

@implementation menuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
