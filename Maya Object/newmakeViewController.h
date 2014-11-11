//
//  newmakeViewController.h
//  Maya Object
//
//  Created by Maya Hirakawa on 2014/11/06.
//  Copyright (c) 2014年 Maya Hirakawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface newmakeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *cancell;
@property (weak, nonatomic) IBOutlet UIButton *listadd;
@property (weak, nonatomic) IBOutlet UIImageView *myimage1;
@property (weak, nonatomic) IBOutlet UIImageView *myimage2;
@property (weak, nonatomic) IBOutlet UIImageView *myimage3;
@property (weak, nonatomic) IBOutlet UIImageView *myimage4;
@property (weak, nonatomic) IBOutlet UIImageView *myimage5;


- (IBAction)tapcancell:(id)sender;
- (IBAction)taplistadd:(id)sender;
@end
