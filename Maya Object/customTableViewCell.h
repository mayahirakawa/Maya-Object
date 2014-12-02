//
//  customTableViewCell.h
//  Maya Object
//
//  Created by Maya Hirakawa on 2014/11/27.
//  Copyright (c) 2014年 Maya Hirakawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customTableViewCell : UITableViewCell
{
   
    NSMutableArray *_listArray; //メンバ変数宣言
    
    BOOL _twinkleflag1;
    BOOL _twinkleflag2;
    BOOL _twinkleflag3;
    BOOL _twinkleflag4;
    BOOL _twinkleflag5;
}
@property (nonatomic,assign) int select_num;
@property (weak, nonatomic) IBOutlet UILabel *textlabel;
@property (weak, nonatomic) IBOutlet UIImageView *myimage1;
@property (weak, nonatomic) IBOutlet UIImageView *myimage2;
@property (weak, nonatomic) IBOutlet UIImageView *myimage3;
@property (weak, nonatomic) IBOutlet UIImageView *myimage4;
@property (weak, nonatomic) IBOutlet UIImageView *myimage5;
+ (CGFloat)rowHeight;
@property (weak, nonatomic) IBOutlet UIView *myview;
@property (nonatomic,assign) int review;



@end
