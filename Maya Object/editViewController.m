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
//    [[self navigationItem] setTitle:boxname];
//    [[self navigationItem] setTitle:_select_num];
//
//    cell.textLabel.text = [NSString stringWithFormat:@"%@",_listArray[_select_num;][@"title"]];
//    return cell;
    
    
    
    //バーのカラーカスタマイズ
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];  // バーアイテムカラー
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.211 green:0.8 blue:1.0 alpha:1.000];  // バー背景色
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    
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


- (IBAction)tapcancell:(id)sender {
}
- (IBAction)tapdelete:(id)sender {
 //削除しますか？アラート表示
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"履歴を削除" message:@"こちらの履歴を削除してもよろしいですか？" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    [alert show];

}
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    //NSLog(@"%d",buttonIndex);
    
//    if (buttonIndex == 0){
//        //キャンセル
//    }else{
//        //OK
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        
//       _listArray =[defaults dictionaryForKey:@"listarray"];
//        NSMutableDictionary *ret_dictionary = [[NSMutableDictionary alloc] initWithDictionary:_listArray];
//        
//        //データを削除
//        [ret_dictionary removeObjectForKey:self.listKey];
//        _listArray = ret_dictionary;
//        [defaults setObject:_listArray forKey:@"listarray"];
//        [defaults synchronize];
//        
//        //画像ファイルを削除
//        // ファイルマネージャを作成
//        NSFileManager *fileManager = [NSFileManager defaultManager];
//        
//        // 削除したいファイルのパスを作成
//        NSString *FileName = self.listName;
//        // Documentsディレクトリに保存
//        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//        
//        NSString *FullPath = [NSString stringWithFormat:@"%@/%@",path,FileName];
//        
//        
//        NSError *error;
//        
//        // ファイルを移動
//        BOOL result = [fileManager removeItemAtPath:FullPath error:&error];
//        if (result) {
//            NSLog(@"ファイルを削除に成功：%@", FullPath);
//        } else {
//            NSLog(@"ファイルの削除に失敗：%@", error.description);
//        }
//        
//        indexViewController *ivc = [self.storyboard instantiateViewControllerWithIdentifier:@"indexViewController"];
//        
//        //前の画面に戻る
//        [self.navigationController pushViewController:ivc animated:YES];
//        
//}
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
}
@end
