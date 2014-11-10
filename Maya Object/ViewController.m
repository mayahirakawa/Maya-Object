//
//  ViewController.m
//  Maya Object
//
//  Created by Maya Hirakawa on 2014/11/04.
//  Copyright (c) 2014年 Maya Hirakawa. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
#import "bookViewController.h"
#import "musicViewController.h"
#import "foodViewController.h"
#import "placeViewController.h"
#import "otherViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapmovie:(id)sender {
    
       NSLog(@"Tap");
    
     ViewController2 *vc2 = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController2"];
    [[self navigationController] pushViewController:vc2 animated:YES];
    

}
- (IBAction)tapbook:(id)sender {
   
   bookViewController *bvc = [self.storyboard instantiateViewControllerWithIdentifier:@"bookViewController"];
    [[self navigationController] pushViewController:bvc animated:YES];
    
}
- (IBAction)tapmusic:(id)sender {
    
   musicViewController *mvc = [self.storyboard
      instantiateViewControllerWithIdentifier:@"musicViewController"];
    [[self navigationController] pushViewController:mvc animated:YES];
    
}
- (IBAction)tapfood:(id)sender {
    
   foodViewController *fvc = [self.storyboard
      instantiateViewControllerWithIdentifier:@"foodViewController"];
    [[self navigationController] pushViewController:fvc animated:YES];
                              
}
- (IBAction)tapplace:(id)sender {
    
    placeViewController *pvc = [self.storyboard
      instantiateViewControllerWithIdentifier:@"placeViewController"];
    [[self navigationController] pushViewController:pvc animated:YES];
}
- (IBAction)tapother:(id)sender {
    
    otherViewController *ovc = [self.storyboard
      instantiateViewControllerWithIdentifier:@"otherViewController"];
    [[self navigationController] pushViewController:ovc animated:YES];
}
- (IBAction)tapinformation:(id)sender {
}
@end
