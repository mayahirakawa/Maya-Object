//
//  newmakeViewController.m
//  Maya Object
//
//  Created by Maya Hirakawa on 2014/11/06.
//  Copyright (c) 2014年 Maya Hirakawa. All rights reserved.
//

#import "newmakeViewController.h"
//#import "indexViewController.h"
#import "AppDelegate.h"
//テーブルビューのコメント入力画面に枠をつけるための準備
#import "QuartzCore/QuartzCore.h"
//ライブラリーをインポート



@interface newmakeViewController ()
//NSUserDefaultsをViewController内で宣言します
@property NSUserDefaults *defaults;

@end

@implementation newmakeViewController
  




- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    
    //textViewに黒色の枠を付ける
    [[self.textview layer] setCornerRadius:10.0];
    [self.textview setClipsToBounds:YES];
    [[self.textview layer] setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [[self.textview layer] setBorderWidth:1.5];
    
    //appに入っている変数を取り出せる
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //セカンドナムをひっぱる
    NSLog(@"%d",app.second_select_num);
    
    //ユーーザーデフォルトからデータを取り出す
    //宣言
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *boxname = @"favoritelist";
    //番号にそった名前を代入
    boxname = [self returnBoxName:app.second_select_num];
    NSArray *favorite;
    //保存されたデータを取り出す
    favorite = [defaults objectForKey:boxname];
    _listArray = favorite.mutableCopy;
   
    //初期化
    if (_listArray == nil) {
        _listArray = [[NSMutableArray alloc] init];
    
    
    }
    
    
    if (_library ==nil) {
        _library = [[ALAssetsLibrary alloc]init];
    }
 
    
    
    // キーボードが表示されたときのNotificationをうけとります。（後で）
    [self registerForKeyboardNotifications];
}


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
// キーボードが表示された時に画面を動かす
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    CGPoint scrollPoint = CGPointMake(0.0,200.0);
    [_textview setContentOffset:scrollPoint animated:YES];
    }

- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    [_textview setContentOffset:CGPointZero animated:YES];
    
   }


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


//imageにタップが出来る
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   
    UITouch *touch = [[event allTouches] anyObject];
    //touch.view.tagはimageのtag番号を取得する
    NSLog(@"%ld",touch.view.tag);
    NSLog(@"tap");

    UIImagePickerControllerSourceType sourceType = -1;
    
    //イメージピッカーの生成
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];

    
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
        case 100:
            //カメラロールに起動する
            sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            
            //その機能が使えなかったら、処理を中止する。
            if(![UIImagePickerController isSourceTypeAvailable:sourceType])
            {
                return;
            }
            
            
            imagePicker.sourceType = sourceType;
            imagePicker.delegate = (id)self;
            
            //イメージピッカー表示
            [self presentViewController:imagePicker animated:YES completion:nil];
            
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
   
}

- (IBAction)tapcancell:(id)sender {
    NSLog(@"tapcancell");
    //キャンセルを押したら前の画面に戻る
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)taplistadd:(id)sender {
    NSLog(@"taplist");
    
    if ([_titletext.text isEqualToString:@""]){
        
        UIAlertView *alert =
        [[UIAlertView alloc] initWithTitle:@"NO TITLE" message:@"タイトルを入力して下さい。"
                              delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;

    }
    
 NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

 NSMutableDictionary *favoritedata= [[NSMutableDictionary alloc] init];
    
    
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
    
    if (_assetsUrl == nil) {
        _assetsUrl = @"";
    }


    
    [favoritedata setObject:self.titletext.text forKey:@"title"];
    [favoritedata setObject:self.subtitletext.text forKey:@"subtitle"];
    [favoritedata setObject:self.pointtext.text forKey:@"point"];
    [favoritedata setObject:[NSString stringWithFormat:@"%d", starcount]forKey:@"review"];
    
    [favoritedata setObject:self.commenttext.text forKey:@"comment"];
    [favoritedata setObject:_assetsUrl forKey:@"picture"];
    //グローバ変数を扱うオブジェクト
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [_listArray addObject:favoritedata];
    
////////////////1117
//[FavoriteList setObject:favoritedata forKey:num];
//favoritelist = FavoriteList;
//@"favoritelist";は仮の名前。上書きされるので何でOK　宣言
    NSString *boxname = @"favoritelist";
    //番号にそった名前を代入
    boxname = [self returnBoxName:app.second_select_num];
    
    [defaults setObject:_listArray forKey:boxname];
    
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

//撮影終了後に「use」を押すと呼び出されるメソッド。
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //カメラライブラリから選んだ写真のURLを取得。
    _assetsUrl = [(NSURL *)[info objectForKey:@"UIImagePickerControllerReferenceURL"] absoluteString];
    [self showPhoto:_assetsUrl];
    
    [picker dismissViewControllerAnimated:YES completion:nil];  //元の画面に戻る
}

//assetsから取得した画像を表示する
-(void)showPhoto:(NSString *)url
{
    //URLからALAssetを取得
    [_library assetForURL:[NSURL URLWithString:url]
             resultBlock:^(ALAsset *asset) {
                 
                 //画像があればYES、無ければNOを返す
                 if(asset){
                     NSLog(@"データがあります");
                     //ALAssetRepresentationクラスのインスタンスの作成
                     ALAssetRepresentation *assetRepresentation = [asset defaultRepresentation];
                     
                     //ALAssetRepresentationを使用して、フルスクリーン用の画像をUIImageに変換
                     //fullScreenImageで元画像と同じ解像度の写真を取得する。
                     UIImage *fullscreenImage = [UIImage imageWithCGImage:[assetRepresentation fullScreenImage]];
                     self.cameraroll.image = fullscreenImage; //イメージをセット
                 }else{
                     NSLog(@"データがありません");
                 }
                 
             } failureBlock: nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
