//
//  newmakeViewController.m
//  Maya Object
//
//  Created by Maya Hirakawa on 2014/11/06.
//  Copyright (c) 2014年 Maya Hirakawa. All rights reserved.
//

#import "newmakeViewController.h"
#import "indexViewController.h"

@interface newmakeViewController ()

@end

@implementation newmakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 self.myimage1.image = [UIImage imageNamed:@"ranking07-023.gif"];
 self.myimage2.image = [UIImage imageNamed:@"ranking07-023.gif"];
 self.myimage3.image = [UIImage imageNamed:@"ranking07-023.gif"];
 self.myimage4.image = [UIImage imageNamed:@"ranking07-031.gif"];
 self.myimage5.image = [UIImage imageNamed:@"ranking07-031.gif"];

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

- (IBAction)tapcancell:(id)sender {
    
  [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)taplistadd:(id)sender {
}
@end
