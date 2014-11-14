//
//  ViewController2.m
//  Maya Object
//
//  Created by Maya Hirakawa on 2014/11/05.
//  Copyright (c) 2014年 Maya Hirakawa. All rights reserved.
//

#import "indexViewController.h"
#import "newmakeViewController.h"
@interface indexViewController ()

@end

@implementation indexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view. 
    self.movieadd.delegate = self;

    self.tableview.separatorColor = [UIColor clearColor];
}


- (void)tabBar:(UITabBar*)tabBar didSelectItem:(UITabBarItem*)item {
 
    NSLog(@"%ld",item.tag);
    
    
    //tagバーの画面遷移
    //インスタンス化したモノを代入
    if(item.tag ==0){
        newmakeViewController *nvc = [self.storyboard instantiateViewControllerWithIdentifier:@"newmakeViewController"];
        [self presentViewController:nvc animated:YES completion:nil];
}


    if (item.tag ==1) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc]init];
        //        UIActionSheet *actionSheet = [self.storyboard
//            instantiateViewControllerWithIdentifier:@"UIActionSheet"];
        //[self presentViewController:actionSheet animated:YES completion:nil];
   
        actionSheet.title = @"リスト並び替え";
        actionSheet.delegate = self;
        
        [actionSheet addButtonWithTitle:@"▲星が多い順"];
        [actionSheet addButtonWithTitle:@"▼星が少ない順"];
        [actionSheet addButtonWithTitle:@"△数字が大きい順"];
        [actionSheet addButtonWithTitle:@"▽数字が小さい順"];
       
        [actionSheet addButtonWithTitle:@"キャンセル"];
        //[actionSheet setDestructiveButtonIndex:1];
        [actionSheet setCancelButtonIndex:5];
        [actionSheet showInView:self.view];
        
}
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
