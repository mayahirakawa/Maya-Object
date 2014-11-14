//
//  newmakeViewController.m
//  Maya Object
//
//  Created by Maya Hirakawa on 2014/11/06.
//  Copyright (c) 2014年 Maya Hirakawa. All rights reserved.
//

#import "newmakeViewController.h"
#import "indexViewController.h"
//テーブルビューのコメント入力画面に枠をつけるための準備
#import "QuartzCore/QuartzCore.h"

@interface newmakeViewController ()
//NSUserDefaultsをViewController内で宣言します
@property NSUserDefaults *defaults;

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

    [[self.textview layer] setCornerRadius:10.0];
    [self.textview setClipsToBounds:YES];
    
    //textViewに黒色の枠を付ける
    [[self.textview layer] setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [[self.textview layer] setBorderWidth:1.5];
 
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSMutableDictionary *favoritedata= [[NSMutableDictionary alloc]init];
//
//    [favoritedata setObject:self.titletext.text forKey:@"title"];
//    [favoritedata setObject:self.subtitletext.text forKey:@"subtitle"];
//    [favoritedata setObject:self.pointtext.text forKey:@"point"];
//    [favoritedata setObject:self.myimage1.image forKey:@"review"];
//    [favoritedata setObject:self.myimage2.image forKey:@"review"];
//    [favoritedata setObject:self.myimage3.image forKey:@"review"];
//    [favoritedata setObject:self.myimage4.image forKey:@"review"];
//    [favoritedata setObject:self.myimage5.image forKey:@"review"];
//    [favoritedata setObject:self.commenttext.text forKey:@"comment"];
//    [favoritedata setObject:@"" forKey:@"picture"];
  
//    [_listArray replaceObjectAtIndex:self.select_num withObject:favoritedata];
    

//    //文字を保存
//    [defaults setObject:_listArray forKey:@"listtext"];
//    [defaults synchronize];
   
//UserDefaultからデータを取り出す
//   NSString *list = [defaults stringForKey:@"list"];
//   NSArray *favorite;
//  //保存されたデータを取り出す
//  favorite = [defaults objectForKey:@"favoritelist"];
//    _listArray = favorite.mutableCopy;
//   
//   self.textview.text = _listArray[self.select_num][@"desc"];
//    
//   id favoriteflag = _listArray[self.select_num][@"favoriteflag"];
//   
//   int intFavFlag = [favoriteflag intValue];
//  if (intFavFlag == 0) {
//      //[self.listadd setTitle:@"お気に入り追加" forState:UIControlStateNormal];
//  }else{
//      // [self.listadd setTitle:@"お気に入り解除" forState:UIControlStateNormal];
//
//}
//
//    
}
    //imageにタップが出来る
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   
    UITouch *touch = [[event allTouches] anyObject];
    //touch.view.tagはimageのtag番号を取得する
    NSLog(@"%ld",touch.view.tag);
    NSLog(@"tap");

    //NOの時には星が灰色、YESの時には星が黄色
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

    //20141114try
    NSLog(@"%d",self.select_num);
    _listArray =
    @[@"movie",@"book",@"music",@"food",@"place",@"other"];
}

- (IBAction)tapcancell:(id)sender {
    NSLog(@"tapcancell");
    //キャンセルを押したら前の画面に戻る
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)taplistadd:(id)sender {
    NSLog(@"taplist");
    
 NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
 NSMutableDictionary *favoritedata= [[NSMutableDictionary alloc] init];
    
    [favoritedata setObject:self.titletext.text forKey:@"title"];
    [favoritedata setObject:self.subtitletext.text forKey:@"subtitle"];
    [favoritedata setObject:self.pointtext.text forKey:@"point"];
    [favoritedata setObject:@2 forKey:@"review"];
    
    [favoritedata setObject:self.commenttext.text forKey:@"comment"];
    [favoritedata setObject:@"" forKey:@"picture"];
    //保存
    [defaults setObject:favoritedata forKey:@"favoritedata"];
    [defaults synchronize];
    
//    NSDictionary *selectedlist = _listArray[self.select_num];
//    
//    NSMutableDictionary *changedlist = selectedlist.mutableCopy;
//    
//    id favoriteflag = _listArray[self.select_num][@"favoriteflag"];
//    
//    int intFavFlag = [favoriteflag intValue];
//    
//    if (intFavFlag == 0) {
//        [changedlist setObject:@1 forKey:@"favoriteflag"];
//            }else{
//        [changedlist setObject:@0 forKey:@"favoriteflag"];
//               
//}
//    
//    [_listArray replaceObjectAtIndex:self.select_num withObject:changedlist];
//    
//    //UserDefaultObjectを用意する
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    

 
    //親画面に戻る
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
