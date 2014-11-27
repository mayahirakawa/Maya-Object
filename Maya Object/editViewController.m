//
//  editViewController.m
//  Maya Object
//
//  Created by Maya Hirakawa on 2014/11/20.
//  Copyright (c) 2014年 Maya Hirakawa. All rights reserved.
//

#import "editViewController.h"
#import "indexViewController.h"
#import "AppDelegate.h"
//テーブルビューのコメント入力画面に枠をつけるための準備
#import "QuartzCore/QuartzCore.h"
@interface editViewController ()

@end

@implementation editViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.newmakeViewController.dataSource = self;
    //self.newmakeViewController.delegate = self;
    
    
    //textViewに黒色の枠を付ける
    [[self.textview layer] setCornerRadius:10.0];
    [self.textview setClipsToBounds:YES];
    [[self.textview layer] setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [[self.textview layer] setBorderWidth:1.5];
    
    //評価の星の部分
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
   

  
    
    
    //ユーーザーデフォルトからデータを取り出す
    //宣言
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *boxname = @"favoritelist";
    //グローバ変数を扱うオブジェクト
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //番号にそった名前を代入
    boxname = [self returnBoxName:app.second_select_num];
    //保存されたデータを取り出す
    _listArray = [defaults objectForKey:boxname];
    _listArray = _listArray.mutableCopy;
    
    //初期化
    if (_listArray == nil) {
        _listArray = [[NSMutableArray alloc] init];
        
      
    
}
    //ナビゲーションのバー？にタイトルを表示する
    [[self navigationItem] setTitle:_listArray[_select_num][@"title"]];
    //保存されているサブタイトルを表示する
    [[self subtitle] setText:_listArray[_select_num][@"subtitle"]];
    //保存されている数字を表示する
    [[self pointtext] setText:_listArray[_select_num][@"point"]];
    //保存されているコメントを表示する
    [[self textview] setText:_listArray[_select_num][@"comment"]];
    //保存されている星を編集画面にも反映させたいが出来ていない
    NSLog(@"%@",_listArray[_select_num][@"c"]);
   
    // starcountを整数に変換
    int starcount = [_listArray[_select_num][@"review"] intValue];
   //星を光らせる
    switch (starcount) {
        case 1:
                
                self.myimage1.image = [UIImage imageNamed:@"staron.gif"];
                _twinkleflag1 = YES;
            
            break;
        case 2:
            
                self.myimage1.image = [UIImage imageNamed:@"staron.gif"];
                _twinkleflag1 = YES;
            
            
                self.myimage2.image = [UIImage imageNamed:@"staron.gif"];
                _twinkleflag2 = YES;
            
            break;
        case 3:
            
                self.myimage1.image = [UIImage imageNamed:@"staron.gif"];
                _twinkleflag1 = YES;
            
            
                self.myimage2.image = [UIImage imageNamed:@"staron.gif"];
                _twinkleflag2 = YES;
    
                self.myimage3.image = [UIImage imageNamed:@"staron.gif"];
                _twinkleflag3 = YES;
            
            break;
        case 4:

                self.myimage1.image = [UIImage imageNamed:@"staron.gif"];
                _twinkleflag1 = YES;
            
            
                self.myimage2.image = [UIImage imageNamed:@"staron.gif"];
                _twinkleflag2 = YES;
            
                self.myimage3.image = [UIImage imageNamed:@"staron.gif"];
                _twinkleflag3 = YES;

            
                self.myimage4.image = [UIImage imageNamed:@"staron.gif"];
                _twinkleflag4 = YES;
            
            
            break;
        case 5:

                self.myimage1.image = [UIImage imageNamed:@"staron.gif"];
                _twinkleflag1 = YES;
            
            
                self.myimage2.image = [UIImage imageNamed:@"staron.gif"];
                _twinkleflag2 = YES;
            
                self.myimage3.image = [UIImage imageNamed:@"staron.gif"];
                _twinkleflag3 = YES;
            
            
                self.myimage4.image = [UIImage imageNamed:@"staron.gif"];
                _twinkleflag4 = YES;
            
                self.myimage5.image = [UIImage imageNamed:@"staron.gif"];
                _twinkleflag5 = YES;
            
            break;
            
            
        default:
            break;
    }

//    [[self myimage1] setImage:_listArray[_select_num][@"picture"]];
//    [[self myimage2] setImage:_listArray[_select_num][@"picture"]];
//    [[self myimage3] setImage:_listArray[_select_num][@"picture"]];
//    [[self myimage4] setImage:_listArray[_select_num][@"picture"]];
//    [[self myimage5] setImage:_listArray[_select_num][@"picture"]];
//    
    //バーのカラーカスタマイズ
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];  // バーアイテムカラー
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.211 green:0.8 blue:1.0 alpha:1.000];  // バー背景色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    
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
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapdelete:(id)sender {
 //削除しますか？アラート表示
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"履歴を削除" message:@"こちらの履歴を削除してもよろしいですか？" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    [alert show];
    
   //ユーザーデフォルトを使えるようにする
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //_listArray = [defaults objectForKey:@"_listArray"];
    //NSMutableDictionary *list = [[NSMutableDictionary alloc]initWithDictionary:_listArray];
    //消したいデーターをセレクトナムを使って消す
    [_listArray removeObject:_listArray[_select_num]];
   
    NSString *boxname = @"favoritelist";
    //グローバ変数を扱うオブジェクト
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //番号にそった名前を代入
    boxname = [self returnBoxName:app.second_select_num];
     
     //選択したセル番号を持ってくる
     //NSInteger selectindex = indexPath.row;
     //NSMutableArray *listArray = [[NSMutableArray alloc] initWithArray:_listArray];
     
     
     //_listArray = list;
     
     [defaults setObject:_listArray forKey:boxname];
     [defaults synchronize];
    
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
  
    //アラートビューの削除でオッケーが押されたらインデックスに画面遷移
    
    if (buttonIndex == 1) {
        
        indexViewController *ivc = [self.storyboard   instantiateViewControllerWithIdentifier:@"indexViewController"];
        
        [self.navigationController pushViewController:ivc animated:YES];
        
    }
    
 }
//番号によってboxnameを返すメソッド
-(NSString *)returnBoxName:(int)boxNumber{
    
   NSString *boxName;
    
    switch (boxNumber) {
        case 1:
            boxName = @"Movie";
            break;
            
        case 2:
            boxName = @"Book";
            break;
            
        case 3:
            boxName = @"Music";
            break;
            
        case 4:
            boxName = @"Food";
            break;
            
        case 5:
            boxName = @"Place";
            break;
            
        case 6:
            boxName = @"Other";
            break;
            
        default:
            break;
            
    }
    
    
    return boxName;
    
}




- (IBAction)tapupdate:(id)sender {
    
    
    NSMutableDictionary *favoritedata= [[NSMutableDictionary alloc] init];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    


    
    //光っている星の数を数える
    int starcount = 0;
    
    if (_twinkleflag1) {
        starcount++;
    }
    
    if (_twinkleflag2) {
        starcount++;
    }
    
    if (_twinkleflag3) {
        starcount++;
    }
    
    if (_twinkleflag4) {
        starcount++;
    }
    
    if (_twinkleflag5) {
        starcount++;
    }
    
    
    //新しい箱に置き換える
    [favoritedata setObject:_listArray[_select_num][@"title"] forKey:@"title"];
    [favoritedata setObject:self.subtitle.text forKey:@"subtitle"];
    [favoritedata setObject:self.pointtext.text forKey:@"point"];
    [favoritedata setObject:[NSString stringWithFormat:@"%d", starcount]forKey:@"review"];
    
    [favoritedata setObject:self.textview.text forKey:@"comment"];
    [favoritedata setObject:@"" forKey:@"picture"];
    //グローバ変数を扱うオブジェクト
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    //[_listArray addObject:favoritedata];
    [_listArray replaceObjectAtIndex:self.select_num withObject:favoritedata];
    
    //@"favoritelist";は仮の名前。上書きされるので何でOK　宣言
    NSString *boxname = @"favoritelist";
    //番号にそった名前を代入
    boxname = [self returnBoxName:app.second_select_num];
    
    [defaults setObject:_listArray forKey:boxname];
    
    [defaults synchronize];
    
    //画面遷移
           
   indexViewController *ivc = [self.storyboard   instantiateViewControllerWithIdentifier:@"indexViewController"];
   
    [self.navigationController pushViewController:ivc animated:YES];

    
}
@end
