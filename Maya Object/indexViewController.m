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
@interface indexViewController ()

@end

@implementation indexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.movieadd.delegate = self;

    self.tableview.separatorColor = [UIColor clearColor];

    NSLog(@"%d",self.first_select_num);
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
    
  
    [[self navigationItem] setTitle:boxname];
  
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
        [actionSheet setDestructiveButtonIndex:5];
        [actionSheet setCancelButtonIndex:5];
        [actionSheet showInView:self.view];
        
}
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}




@end
