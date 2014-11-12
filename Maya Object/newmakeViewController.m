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
    
 self.myimage1.image = [UIImage imageNamed:@"staroff.gif"];
 self.myimage2.image = [UIImage imageNamed:@"staroff.gif"];
 self.myimage3.image = [UIImage imageNamed:@"staroff.gif"];
 self.myimage4.image = [UIImage imageNamed:@"staroff.gif"];
 self.myimage5.image = [UIImage imageNamed:@"staroff.gif"];

    _twinkleflag1 = NO;
    _twinkleflag2 = NO;
    _twinkleflag3 = NO;
    _twinkleflag4 = NO;
    _twinkleflag5 = NO;
  
    
}
    //imageにタップが出来る
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   
    UITouch *touch = [[event allTouches] anyObject];
    //touch.view.tagはimageのtag番号を取得する
    NSLog(@"%ld",touch.view.tag);
    NSLog(@"tap");

 
    switch (touch.view.tag) {
        case 1:
            if (_twinkleflag1) {
            self.myimage1.image = [UIImage imageNamed:@"staroff.gif"];
                _twinkleflag1 = NO;
            }else{
                
            self.myimage1.image = [UIImage imageNamed:@"staron.gif"];
                _twinkleflag1 = YES;
            }
            break;
        case 2:
            if (_twinkleflag2) {
                self.myimage2.image = [UIImage imageNamed:@"staroff.gif"];
                _twinkleflag2 = NO;
            }else{
                
                self.myimage2.image = [UIImage imageNamed:@"staron.gif"];
                _twinkleflag2 = YES;
            }
            break;
        case 3:
            if (_twinkleflag3) {
                self.myimage3.image = [UIImage imageNamed:@"staroff.gif"];
                _twinkleflag3 = NO;
            }else{
                
                self.myimage3.image = [UIImage imageNamed:@"staron.gif"];
                _twinkleflag3 = YES;
            }
            break;
        case 4:
            if (_twinkleflag4) {
                self.myimage4.image = [UIImage imageNamed:@"staroff.gif"];
                _twinkleflag4 = NO;
            }else{
                
                self.myimage4.image = [UIImage imageNamed:@"staron.gif"];
                _twinkleflag4 = YES;
            }

            break;
        case 5:
            if (_twinkleflag5) {
                self.myimage5.image = [UIImage imageNamed:@"staroff.gif"];
                _twinkleflag5 = NO;
            }else{
                
                self.myimage5.image = [UIImage imageNamed:@"staron.gif"];
                _twinkleflag5 = YES;
            }
            break;
            
        default:
        break;
}
    
    
    
    //tapされた時に星が黄色になる
//    if (self.myimage1.tag == touch.view.tag) {
//        self.myimage1.image = [UIImage imageNamed:@"staron.gif"];
//    }
//    if (self.myimage2.tag == touch.view.tag) {
//        self.myimage2.image = [UIImage imageNamed:@"staron.gif"];
//    }
//    if (self.myimage3.tag == touch.view.tag) {
//        self.myimage3.image = [UIImage imageNamed:@"staron.gif"];
//    }
//    if (self.myimage4.tag == touch.view.tag) {
//        self.myimage4.image = [UIImage imageNamed:@"staron.gif"];
//    }
//    if (self.myimage5.tag == touch.view.tag) {
//        self.myimage5.image = [UIImage imageNamed:@"staron.gif"];
//    }
}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  }


- (IBAction)tapcancell:(id)sender {
    
  [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)taplistadd:(id)sender {
    
    
    
}

@end
