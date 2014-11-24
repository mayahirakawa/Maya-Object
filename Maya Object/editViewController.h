//
//  editViewController.h
//  Maya Object
//
//  Created by Maya Hirakawa on 2014/11/20.
//  Copyright (c) 2014年 Maya Hirakawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface editViewController : UIViewController
{
    
    NSMutableArray *_listArray; //メンバ変数宣言
    
    //星にフラグ
    BOOL _twinkleflag1;
    BOOL _twinkleflag2;
    BOOL _twinkleflag3;
    BOOL _twinkleflag4;
    BOOL _twinkleflag5;
}

@property (nonatomic,assign) int select_num;
@property (weak, nonatomic) IBOutlet UITextField *subtitle;
@property (weak, nonatomic) IBOutlet UITextField *pointtext;
@property (weak, nonatomic) IBOutlet UIImageView *myimage1;
@property (weak, nonatomic) IBOutlet UIImageView *myimage2;
@property (weak, nonatomic) IBOutlet UIImageView *myimage3;
@property (weak, nonatomic) IBOutlet UIImageView *myimage4;
@property (weak, nonatomic) IBOutlet UIImageView *myimage5;
@property (weak, nonatomic) IBOutlet UITextView *textview;
@property (weak, nonatomic) IBOutlet UIImageView *cameraroll;

//@property(nonatomic,assign) NSString *listKey;
@property(nonatomic,assign) NSString *listName;


- (IBAction)tapcancell:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *delete;
- (IBAction)tapdelete:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *update;
- (IBAction)tapupdate:(id)sender;




@end
