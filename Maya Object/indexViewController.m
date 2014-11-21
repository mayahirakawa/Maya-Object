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

@implementation indexViewController




- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.movieadd.delegate = self;

    self.tableview.separatorColor = [UIColor clearColor];

    NSLog(@"%d",self.first_select_num);
    
    
//背景色を透明にしたいUIViewのインスタンスを作成する
UILabel *nolistlabel = [[UILabel alloc] initWithFrame:self.nolistlabel.frame];
//opaque属性にNOを設定する事で、背景透過を許可する
//ここの設定を忘れると、背景色をいくら頑張っても透明にならない
//_nolistlabel.opaque = NO;
//backgroundColorにalpha=0.0fの背景色を設定することで、背景色を透明にする
//_nolistlabel.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.0f];
//_nolistlabel.textColor = [UIColor yellowColor];
//ラベルを透明にする
_nolistlabel.alpha = 0.0;
//作成した背景色透明のViewを現在のViewの上に追加する
//[self.nolistlabel addSubview:nolistlabel];

    
    
    //appに入っている変数を取り出せる
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];//117
    //appのセカンドセレクトナムにファーストセレクトナムの数字を代入
    app.second_select_num = self.first_select_num;//117
    NSString *num = [NSString stringWithFormat:@"%d",app.second_select_num];
    //宣言文
    NSString *boxname = @"favoritelist";
    
       switch ([num intValue]) {
        case 1:
            boxname = @"Movie";

            break;
               
        case 2:
            boxname = @"Book";
           
            break;
            
        case 3:
            boxname = @"Music";
          
            break;
            
        case 4:
            boxname = @"Food";
           
            break;
            
        case 5:
            boxname = @"Place";
         
            break;
            
        case 6:
            boxname = @"Other";
            break;
            
        default:
            break;
            
    }
    //UserDefaultからデータを取り出す
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //保存されたデータを取り出す
     _listArray = [defaults objectForKey:boxname];
    //テーブルビューに表示する
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    

   //ナビゲーションのバー？にタイトルを表示する
    [[self navigationItem] setTitle:boxname];
  
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}




@end
