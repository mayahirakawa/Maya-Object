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
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapmovie:(id)sender {
    
       NSLog(@"Tap");
    
    //ボタンを押された時のナビゲーションコントローラーでの画面遷移
    indexViewController *ivc = [self.storyboard instantiateViewControllerWithIdentifier:@"indexViewController"];
    [[self navigationController] pushViewController:ivc animated:YES];

}
- (IBAction)tapbook:(id)sender {
   
    indexViewController *ivc = [self.storyboard instantiateViewControllerWithIdentifier:@"indexViewController"];
    [[self navigationController] pushViewController:ivc animated:YES];
    
}
- (IBAction)tapmusic:(id)sender {
    
    indexViewController *ivc = [self.storyboard instantiateViewControllerWithIdentifier:@"indexViewController"];
    [[self navigationController] pushViewController:ivc animated:YES];
    
}
- (IBAction)tapfood:(id)sender {
    
    indexViewController *ivc = [self.storyboard instantiateViewControllerWithIdentifier:@"indexViewController"];
    [[self navigationController] pushViewController:ivc animated:YES];
                              
}
- (IBAction)tapplace:(id)sender {
    
    indexViewController *ivc = [self.storyboard instantiateViewControllerWithIdentifier:@"indexViewController"];
    [[self navigationController] pushViewController:ivc animated:YES];
}
- (IBAction)tapother:(id)sender {
    
    indexViewController *ivc = [self.storyboard instantiateViewControllerWithIdentifier:@"indexViewController"];
    [[self navigationController] pushViewController:ivc animated:YES];
    
    }
- (IBAction)tapinformation:(id)sender {
}
@end
