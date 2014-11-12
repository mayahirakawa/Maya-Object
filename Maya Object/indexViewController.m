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



}


- (void)tabBar:(UITabBar*)tabBar didSelectItem:(UITabBarItem*)item {
 
    NSLog(@"%d",item.tag);
    
    
    //tagバーの画面遷移
    if(item.tag ==0){
        newmakeViewController *nvc = [self.storyboard instantiateViewControllerWithIdentifier:@"newmakeViewController"];
        [self presentViewController:nvc animated:YES completion:nil];
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
