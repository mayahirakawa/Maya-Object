//
//  ViewController2.h
//  Maya Object
//
//  Created by Maya Hirakawa on 2014/11/05.
//  Copyright (c) 2014年 Maya Hirakawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface indexViewController : UIViewController<UITabBarDelegate,UIActionSheetDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_listArray; //メンバ変数宣言
}
@property (nonatomic,assign) int first_select_num;
@property (weak, nonatomic) IBOutlet UITabBar *movieadd;
@property (weak, nonatomic) IBOutlet UITabBarItem *moviechange;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UILabel *nolistlabel;


@end
