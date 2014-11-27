//
//  ViewController2.m
//  Maya Object
//
//  Created by Maya Hirakawa on 2014/11/05.
//  Copyright (c) 2014年 Maya Hirakawa. All rights reserved.
//

#import "indexViewController.h"
#import "newmakeViewController.h"
#import "AppDelegate.h"//1117
#import "editViewController.h"
@interface indexViewController ()

@end

@implementation indexViewController{

    NSString *boxname;//1122 メンバ変数にした
}




- (void)viewDidLoad {
    [super viewDidLoad];
  
//    self.movieadd.delegate = self;
//
//    self.tableview.separatorColor = [UIColor clearColor];
//
//    NSLog(@"%d",self.first_select_num);

//    //appに入っている変数を取り出せる
//    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];//117
//    //appのセカンドセレクトナムにファーストセレクトナムの数字を代入
//    app.second_select_num = self.first_select_num;//117
//    NSString *num = [NSString stringWithFormat:@"%d",app.second_select_num];
//    boxname = [self returnBoxName:app.second_select_num];
//    
////    //宣言文
////        boxname = @"favoritelist";
////    
////       switch ([num intValue]) {
////        case 1:
////            boxname = @"Movie";
////
////            break;
////               
////        case 2:
////            boxname = @"Book";
////           
////            break;
////            
////        case 3:
////            boxname = @"Music";
////          
////            break;
////            
////        case 4:
////            boxname = @"Food";
////           
////            break;
////            
////        case 5:
////            boxname = @"Place";
////         
////            break;
////            
////        case 6:
////            boxname = @"Other";
////            break;
////            
////        default:
////            break;
////            
////    }
//    
//    //UserDefaultからデータを取り出す
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    //保存されたデータを取り出す
//     _listArray = [defaults objectForKey:boxname];
//    //テーブルビューに表示する
//    self.tableview.dataSource = self;
//    self.tableview.delegate = self;
//    
//
//   //ナビゲーションのバー？にタイトルを表示する
//    [[self navigationItem] setTitle:boxname];
//  
}


- (void)viewWillAppear:(BOOL)animated  {
    

    self.movieadd.delegate = self;
    
    self.tableview.separatorColor = [UIColor clearColor];
    
    NSLog(@"%d",self.first_select_num);
    
    
    
   
    
        //appに入っている変数を取り出せる
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];//117
    //appのセカンドセレクトナムにファーストセレクトナムの数字を代入
    
    if (self.first_select_num != 0) {
        
    
        app.second_select_num = self.first_select_num;//117
        
    }
    NSString *num = [NSString stringWithFormat:@"%d",app.second_select_num];
    boxname = [self returnBoxName:app.second_select_num];
    
    
    //UserDefaultからデータを取り出す
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //保存されたデータを取り出す
    NSArray *Array = [defaults objectForKey:boxname];
    //変更可能なデータに変換して代入
    _listArray = Array.mutableCopy;

    
    [self.tableview reloadData];
    
//    [self.tableview reloadData];
    
    if (_listArray.count == 0) {
        
        _nolistlabel.alpha = 1.0;

    
    }else{
        
        _nolistlabel.alpha = 0.0;
    
    }
    
   
    
    //テーブルビューに表示する
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    
    
    //ナビゲーションのバー？にタイトルを表示する
    [[self navigationItem] setTitle:boxname];
    
  
    
}



//横スワイプで削除ボタンを表示
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    
{
    
    //ユーザーデフォルトを使えるようにする
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //_listArray = [defaults objectForKey:@"_listArray"];
    //NSMutableDictionary *list = [[NSMutableDictionary alloc]initWithDictionary:_listArray];
    //消したいデーターをセレクトナムを使って消す
    NSDictionary *delDec =_listArray[indexPath.row];
    [_listArray removeObject:delDec];
    
   // NSString *boxname = @"favoritelist";
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
    
    if (_listArray.count == 0) {
        
        _nolistlabel.alpha = 1.0;
        
        
    }else{
        
        _nolistlabel.alpha = 0.0;
        
    }

  
    }

    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

//行数を決定するメソッド
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listArray.count;
}

//行に表示するデータの作成
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    //再利用可能なcellオブジェクトを作成
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",_listArray[indexPath.row][@"title"]];
    return cell;

    cell.textLabel.text = [NSString stringWithFormat:@"%d",_listArray[indexPath.row][@"point"]];
    return cell;
    
    //星をテーブルビューに表示させたいが出来ていない。
    
    
    cell.imageView.image = [UIImage imageNamed:_listArray[indexPath.row][@"picture"]];
    
}

//セル押された時
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)
indexpath{
    NSLog(@"Tap:%d",indexpath.row);
    editViewController　*evc = [self.storyboard instantiateViewControllerWithIdentifier:@"editViewController"];
     evc.select_num = indexpath.row;
    [[self navigationController] pushViewController:evc animated:YES];
    
}



- (void)tabBar:(UITabBar*)tabBar didSelectItem:(UITabBarItem*)item {
 
    NSLog(@"%ld",item.tag);

    
    //tagバーの画面遷移
    //インスタンス化したモノを代入
    if(item.tag ==0){
        newmakeViewController *nvc = [self.storyboard instantiateViewControllerWithIdentifier:@"newmakeViewController"];
        [self presentViewController:nvc animated:YES completion:nil];
       
      
}

　  //タグNO1の並び替えを押すとアクションシートが表示される
    if (item.tag ==1) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc]init];
        
        actionSheet.title = @"リスト並び替え";
        actionSheet.delegate = self;
        
        [actionSheet addButtonWithTitle:@"▲星が多い順"];
        [actionSheet addButtonWithTitle:@"▼星が少ない順"];
        [actionSheet addButtonWithTitle:@"△数字が大きい順"];
        [actionSheet addButtonWithTitle:@"▽数字が小さい順"];
        [actionSheet addButtonWithTitle:@"キャンセル"];
        [actionSheet setDestructiveButtonIndex:4];
        [actionSheet setCancelButtonIndex:4];
        [actionSheet showInView:self.view];
        
}
}

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

    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}




@end
