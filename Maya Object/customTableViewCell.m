//
//  customTableViewCell.m
//  Maya Object
//
//  Created by Maya Hirakawa on 2014/11/27.
//  Copyright (c) 2014年 Maya Hirakawa. All rights reserved.
//

#import "customTableViewCell.h"
#import "AppDelegate.h"

@implementation customTableViewCell

//- (void)viewDidLoad {
//    
//    //ユーーザーデフォルトからデータを取り出す
//    //宣言
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSString *boxname = @"favoritelist";
//    //グローバ変数を扱うオブジェクト
//    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    //番号にそった名前を代入
//    boxname = [self returnBoxName:app.second_select_num];
//    //保存されたデータを取り出す
//    _listArray = [defaults objectForKey:boxname];
//    _listArray = _listArray.mutableCopy;
//    
//    //初期化
//    if (_listArray == nil) {
//        _listArray = [[NSMutableArray alloc] init];
//
//
//}
//
//}
- (void)awakeFromNib {
   
       
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    self.myview.layer.borderWidth = 2.0f;
    self.myview.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    NSLog(@"hoshi=%d",self.review);
    
   // starcountを整数に変換
    //int starcount = [_listArray[_select_num][@"review"] intValue];
    self.myimage1.image = [UIImage imageNamed:@"staroff.gif"];
    self.myimage2.image = [UIImage imageNamed:@"staroff.gif"];
    self.myimage3.image = [UIImage imageNamed:@"staroff.gif"];
    self.myimage4.image = [UIImage imageNamed:@"staroff.gif"];
    self.myimage5.image = [UIImage imageNamed:@"staroff.gif"];

    switch (self.review) {
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
}
+ (CGFloat)rowHeight
{
    return 80.0f;
}


@end
