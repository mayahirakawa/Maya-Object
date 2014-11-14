//
//  newmakeViewController.h
//  Maya Object
//
//  Created by Maya Hirakawa on 2014/11/06.
//  Copyright (c) 2014年 Maya Hirakawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface newmakeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{

NSMutableArray *_listArray; //メンバ変数宣言

BOOL _twinkleflag1;
BOOL _twinkleflag2;
BOOL _twinkleflag3;
BOOL _twinkleflag4;
BOOL _twinkleflag5;
}
@property (weak, nonatomic) IBOutlet UITextField *titletext;
@property (weak, nonatomic) IBOutlet UITextField *subtitletext;


@property (weak, nonatomic) IBOutlet UITextField *pointtext;

@property (weak, nonatomic) IBOutlet UITextView *commenttext;



@property (nonatomic,assign) int select_num;
@property (weak, nonatomic) IBOutlet UIImageView *myimage1;
@property (weak, nonatomic) IBOutlet UIImageView *myimage2;
@property (weak, nonatomic) IBOutlet UIImageView *myimage3;
@property (weak, nonatomic) IBOutlet UIImageView *myimage4;
@property (weak, nonatomic) IBOutlet UIImageView *myimage5;
@property (weak, nonatomic) IBOutlet UITextView *textview;
@property (weak, nonatomic) IBOutlet UIButton *cancell;
- (IBAction)tapcancell:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *listadd;
- (IBAction)taplistadd:(id)sender;



@end
