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
    
//    //背景画像を設置
//    UIImage *backgroundImage  = [UIImage imageNamed:@"G5.png"];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
//    
    //背景画像を設置
    UIImage *backgroundImage  = [UIImage imageNamed:@"水玉ライムブルー.gif"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    
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
   
    //appに入っている変数を取り出せる
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //セカンドナムをひっぱる
    NSLog(@"%d",app.second_select_num);

    //ユーーザーデフォルトからデータを取り出す
    //宣言
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *boxname = @"favoritelist";
    //グローバ変数を扱うオブジェクト

    //番号にそった名前を代入
    boxname = [self returnBoxName:app.second_select_num];
    //保存されたデータを取り出す
    _listArray = [defaults objectForKey:boxname];
    _listArray = _listArray.mutableCopy;
    
    //初期化
    if (_listArray == nil) {
        _listArray = [[NSMutableArray alloc] init];
    
    }
    
    if (_library ==nil) {
            _library = [[ALAssetsLibrary alloc]init];
        
    }
    
//    if (_searchKeyword ==nil) {
//        _searchKeyword = [[NSString alloc]init];
//    }
    
    //ソート対象となるキーを指定した、NSSortDescriptorの生成
    NSSortDescriptor *sortDescNumber;
    
    // NSSortDescriptorは配列に入れてNSArrayに渡す
    NSArray *sortDescArray;
    
    NSArray *sortArray;
    
    
    
    
    switch (self.sortno) {
        case 0:
            NSLog(@"▲星が多い順");
            sortDescNumber = [[NSSortDescriptor alloc] initWithKey:@"review" ascending:NO];
            
            
            sortDescArray = [NSArray arrayWithObjects:sortDescNumber, nil];
            
            // ソートの実行
            sortArray = [_listArray sortedArrayUsingDescriptors:sortDescArray];
            
            break;
        case 1:
            NSLog(@"▼星が少ない順");
            
            sortDescNumber = [[NSSortDescriptor alloc] initWithKey:@"review" ascending:YES];
            
            
            sortDescArray = [NSArray arrayWithObjects:sortDescNumber, nil];
            
            // ソートの実行
            sortArray = [_listArray sortedArrayUsingDescriptors:sortDescArray];
            
            
            break;
        case 2:
            NSLog(@"△数字が大きい順");
            
            sortDescNumber = [[NSSortDescriptor alloc] initWithKey:@"point" ascending:NO];
            
            
            sortDescArray = [NSArray arrayWithObjects:sortDescNumber, nil];
            
            // ソートの実行
            sortArray = [_listArray sortedArrayUsingDescriptors:sortDescArray];
            
            
            break;
        case 3:
            NSLog(@"▽数字が小さい順");
            
            sortDescNumber = [[NSSortDescriptor alloc] initWithKey:@"point" ascending:YES];
            
            
            sortDescArray = [NSArray arrayWithObjects:sortDescNumber, nil];
            
            // ソートの実行
            sortArray = [_listArray sortedArrayUsingDescriptors:sortDescArray];
            
            
            
            break;
            
        default:
            NSLog(@"何か押されました");
            sortArray = _listArray;
            
            
            break;
            
    
            
           

                      
    }
    
   // キーボードが表示されたときのNotificationをうけとります。（後で）
   [self registerForKeyboardNotifications];

    
    // UIPanGestureRecognizer をインスタンス化します。また、イベント発生時に呼び出すメソッドを selector で指定します。
    UISwipeGestureRecognizer* swipeDownGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(selfSwipeDownGesture:)];
    
    // 下スワイプのイベントを指定します。
    swipeDownGesture.direction = UISwipeGestureRecognizerDirectionDown;
    
    // Viewへ関連付けします。
    [self.view addGestureRecognizer:swipeDownGesture];

    
    _listArray = sortArray.mutableCopy;
    
    
    //前の画面で検索した字をもってくる
    NSString *searchKeyword = app.searchKeyword;
    
    NSArray *checkarry = _listArray.copy;
    
    if (searchKeyword != nil) {
        
        
        //tmp １つずつ取り出す
        
        for (NSDictionary *tmp in checkarry) {
            
            NSRange range = [tmp[@"title"] rangeOfString:searchKeyword];
            if (range.location == NSNotFound) {
                //リストアレイからいらないものを削除
                [_listArray removeObject:tmp];
            }
        }
        
    }
    
    
    //ナビゲーションのバー？にタイトルを表示する
    [[self navigationItem] setTitle:_listArray[_select_num][@"title"]];
    //保存されているサブタイトルを表示する
    [[self subtitle] setText:_listArray[_select_num][@"subtitle"]];
    //保存されている数字を表示する
    [[self pointtext] setText:_listArray[_select_num][@"point"]];
    //保存されているコメントを表示する
    [[self textview] setText:_listArray[_select_num][@"comment"]];
    
    self.textview.delegate = self;
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

    
    
   
    
    
    //写真が指定されていたら表示
    [self showPhoto:_listArray[_select_num][@"picture"]];
    //保存ボタンを押された時に空にならないように代入
    _assetsUrl = _listArray[_select_num][@"picture"];
    
//    [[self myimage1] setImage:_listArray[_select_num][@"picture"]];
//    [[self myimage2] setImage:_listArray[_select_num][@"picture"]];
//    [[self myimage3] setImage:_listArray[_select_num][@"picture"]];
//    [[self myimage4] setImage:_listArray[_select_num][@"picture"]];
//    [[self myimage5] setImage:_listArray[_select_num][@"picture"]];
//    
   
//    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    
    _visibleflag = YES;
}

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
//    if (_visibleflag) {
//
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:0.3];
//    
//    
//   
//    _textview.frame = CGRectMake(_textview.frame.origin.x, _textview.frame.origin.y - 220, _textview.frame.size.width , _textview.frame.size.height);
//    _subtitle.frame = CGRectMake(_subtitle.frame.origin.x, _subtitle.frame.origin.y - 200, _subtitle.frame.size.width , _subtitle.frame.size.height);
//    _pointtext.frame = CGRectMake(_pointtext.frame.origin.x, _pointtext.frame.origin.y - 200, _pointtext.frame.size.width , _pointtext.frame.size.height);
//    _myimage1.frame = CGRectMake(_myimage1.frame.origin.x, _myimage1.frame.origin.y - 200, _myimage1.frame.size.width , _myimage1.frame.size.height);
//    _myimage2.frame = CGRectMake(_myimage2.frame.origin.x, _myimage2.frame.origin.y - 200, _myimage2.frame.size.width , _myimage2.frame.size.height);
//    _myimage3.frame = CGRectMake(_myimage3.frame.origin.x, _myimage3.frame.origin.y - 200, _myimage3.frame.size.width , _myimage3.frame.size.height);
//    _myimage4.frame = CGRectMake(_myimage4.frame.origin.x, _myimage4.frame.origin.y - 200, _myimage4.frame.size.width , _myimage4.frame.size.height);
//     _myimage5.frame = CGRectMake(_myimage5.frame.origin.x, _myimage5.frame.origin.y - 200, _myimage5.frame.size.width , _myimage5.frame.size.height);
//     _Share.frame = CGRectMake(_Share.frame.origin.x, _Share.frame.origin.y - 200, _Share.frame.size.width , _Share.frame.size.height);
//     _delete.frame = CGRectMake(_delete.frame.origin.x, _delete.frame.origin.y - 200, _delete.frame.size.width , _delete.frame.size.height);
//     _update.frame = CGRectMake(_update.frame.origin.x, _update.frame.origin.y - 200, _update.frame.size.width , _update.frame.size.height);
//    _cameraroll.frame = CGRectMake(_cameraroll.frame.origin.x, _cameraroll.frame.origin.y - 330, _cameraroll.frame.size.width , _cameraroll.frame.size.height);
//    
//    [UIView commitAnimations];
//        _visibleflag = NO;
//    
//    }
}




- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    [_textview setContentOffset:CGPointZero animated:YES];
    
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    if (_visibleflag) {
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        
        
        
        _textview.frame = CGRectMake(_textview.frame.origin.x, _textview.frame.origin.y - 220, _textview.frame.size.width , _textview.frame.size.height);
        _subtitle.frame = CGRectMake(_subtitle.frame.origin.x, _subtitle.frame.origin.y - 200, _subtitle.frame.size.width , _subtitle.frame.size.height);
        _pointtext.frame = CGRectMake(_pointtext.frame.origin.x, _pointtext.frame.origin.y - 200, _pointtext.frame.size.width , _pointtext.frame.size.height);
        _myimage1.frame = CGRectMake(_myimage1.frame.origin.x, _myimage1.frame.origin.y - 200, _myimage1.frame.size.width , _myimage1.frame.size.height);
        _myimage2.frame = CGRectMake(_myimage2.frame.origin.x, _myimage2.frame.origin.y - 200, _myimage2.frame.size.width , _myimage2.frame.size.height);
        _myimage3.frame = CGRectMake(_myimage3.frame.origin.x, _myimage3.frame.origin.y - 200, _myimage3.frame.size.width , _myimage3.frame.size.height);
        _myimage4.frame = CGRectMake(_myimage4.frame.origin.x, _myimage4.frame.origin.y - 200, _myimage4.frame.size.width , _myimage4.frame.size.height);
        _myimage5.frame = CGRectMake(_myimage5.frame.origin.x, _myimage5.frame.origin.y - 200, _myimage5.frame.size.width , _myimage5.frame.size.height);
        _Share.frame = CGRectMake(_Share.frame.origin.x, _Share.frame.origin.y - 200, _Share.frame.size.width , _Share.frame.size.height);
        _delete.frame = CGRectMake(_delete.frame.origin.x, _delete.frame.origin.y - 200, _delete.frame.size.width , _delete.frame.size.height);
        _update.frame = CGRectMake(_update.frame.origin.x, _update.frame.origin.y - 200, _update.frame.size.width , _update.frame.size.height);
        _cameraroll.frame = CGRectMake(_cameraroll.frame.origin.x, _cameraroll.frame.origin.y - 330, _cameraroll.frame.size.width , _cameraroll.frame.size.height);
        
        [UIView commitAnimations];
        _visibleflag = NO;
        
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


- (void)selfSwipeDownGesture:(UISwipeGestureRecognizer *)sender {
    // 下スワイプされた時にログに表示
    if (!_visibleflag) {
    NSLog(@"Notice Down Gesture");
    [_textview resignFirstResponder];


    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    
    _textview.frame = CGRectMake(_textview.frame.origin.x, _textview.frame.origin.y + 220, _textview.frame.size.width , _textview.frame.size.height);
    _subtitle.frame = CGRectMake(_subtitle.frame.origin.x, _subtitle.frame.origin.y + 200, _subtitle.frame.size.width , _subtitle.frame.size.height);
    _pointtext.frame = CGRectMake(_pointtext.frame.origin.x, _pointtext.frame.origin.y + 200, _pointtext.frame.size.width , _pointtext.frame.size.height);
    _myimage1.frame = CGRectMake(_myimage1.frame.origin.x, _myimage1.frame.origin.y + 200, _myimage1.frame.size.width , _myimage1.frame.size.height);
    _myimage2.frame = CGRectMake(_myimage2.frame.origin.x, _myimage2.frame.origin.y + 200, _myimage2.frame.size.width , _myimage2.frame.size.height);
    _myimage3.frame = CGRectMake(_myimage3.frame.origin.x, _myimage3.frame.origin.y + 200, _myimage3.frame.size.width , _myimage3.frame.size.height);
    _myimage4.frame = CGRectMake(_myimage4.frame.origin.x, _myimage4.frame.origin.y + 200, _myimage4.frame.size.width , _myimage4.frame.size.height);
    _myimage5.frame = CGRectMake(_myimage5.frame.origin.x, _myimage5.frame.origin.y + 200, _myimage5.frame.size.width , _myimage5.frame.size.height);
    _Share.frame = CGRectMake(_Share.frame.origin.x, _Share.frame.origin.y + 200, _Share.frame.size.width , _Share.frame.size.height);
    _delete.frame = CGRectMake(_delete.frame.origin.x, _delete.frame.origin.y + 200, _delete.frame.size.width , _delete.frame.size.height);
    _update.frame = CGRectMake(_update.frame.origin.x, _update.frame.origin.y + 200, _update.frame.size.width , _update.frame.size.height);
    _cameraroll.frame = CGRectMake(_cameraroll.frame.origin.x, _cameraroll.frame.origin.y + 330, _cameraroll.frame.size.width , _cameraroll.frame.size.height);
    
    [UIView commitAnimations];

        _visibleflag = YES;
    }
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
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapdelete:(id)sender {
 //削除しますか？アラート表示
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"履歴を削除" message:@"こちらの履歴を削除してもよろしいですか？" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    [alert show];
    
  }

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
  
    //アラートビューの削除でオッケーが押されたらインデックスに画面遷移
    
    if (buttonIndex == 1) {

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
        
 
        
        indexViewController *ivc = [self.storyboard   instantiateViewControllerWithIdentifier:@"indexViewController"];
        
        //[self.navigationController pushViewController:ivc animated:YES];
       
        //ひとつ前の画面に戻る画面遷移
        [self.navigationController popViewControllerAnimated:YES];
        
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
    
    if (_assetsUrl == nil) {
        _assetsUrl = @"";
    }
    
    //新しい箱に置き換える
    [favoritedata setObject:_listArray[_select_num][@"title"] forKey:@"title"];
    [favoritedata setObject:self.subtitle.text forKey:@"subtitle"];
    [favoritedata setObject:self.pointtext.text forKey:@"point"];
    [favoritedata setObject:[NSString stringWithFormat:@"%d", starcount]forKey:@"review"];
    
    [favoritedata setObject:self.textview.text forKey:@"comment"];
    [favoritedata setObject:_assetsUrl forKey:@"picture"];
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
           
   
    NSInteger count = self.navigationController.viewControllers.count -2;
    
    indexViewController *ivc = [self.navigationController.viewControllers objectAtIndex:count];
    
    [self.navigationController popToViewController:ivc animated:YES];
    
//    indexViewController *ivc = [self.storyboard   instantiateViewControllerWithIdentifier:@"indexViewController"];
//   
//    [self.navigationController pushViewController:ivc animated:YES];

    
}

- (IBAction)tapShare:(id)sender {
//    
//    NSString *message; //シェアしたいメッセージ
//    NSURL *url;//シェアしたいURL
//    UIImage *myImage;
//    
//    
//    message = @"my recommendation.";
//    url = [NSURL URLWithString:@"http://google.com"];
//    myImage = [UIImage imageNamed:@"bluem.jpg"];
//    
//    //todo:配列に画像ファイルも含める
//    
//    //アクティビティビューに渡す情報を配列に格納
//    NSArray *actItems = @[message,url,myImage];//この配列には画像セットも可能
//    
//    //アクティビティビューの作成
//    
//    UIActivityViewController *activityView =
//    [[UIActivityViewController alloc] initWithActivityItems:
//     actItems applicationActivities:nil];
//    //モーダル処理でアクティビティヴビューを表示
//    [self presentViewController:activityView animated:YES completion:nil];
    //Facebookボタンをタップ時
   
    NSString *textToShare = @"my recommendation";
    UIImage *imageToShare = [self screenshotWithView:self.view];
    NSArray *itemsToShare = @[textToShare, imageToShare];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];
    activityVC.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeCopyToPasteboard, UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll]; //or whichever you don't need
    [self presentViewController:activityVC animated:YES completion:nil];
    
   
    
}

//スクリーンショットを取る
- (UIImage *)screenshotWithView:(UIView *)view
{
    CGSize imageSize = [view bounds].size;
    if (NULL != UIGraphicsBeginImageContextWithOptions)
        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    else
        UIGraphicsBeginImageContext(imageSize);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, [view center].x, [view center].y);
    CGContextConcatCTM(context, [view transform]);
    CGContextTranslateCTM(context,
                          -[view bounds].size.width * [[view layer] anchorPoint].x - view.frame.origin.x,
                          -[view bounds].size.height * [[view layer] anchorPoint].y - view.frame.origin.y);
    
    [[view layer] renderInContext:context];
    
    CGContextRestoreGState(context);
    
    // Retrieve the screenshot image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
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



@end
