//
//  ViewController.h
//  Maya Object
//
//  Created by Maya Hirakawa on 2014/11/04.
//  Copyright (c) 2014年 Maya Hirakawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface menuViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIButton *movie;
//- (IBAction)tapmovie:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *movieimage;

@property (weak, nonatomic) IBOutlet UIButton *book;
- (IBAction)tapbook:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *music;
- (IBAction)tapmusic:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *food;
- (IBAction)tapfood:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *place;
- (IBAction)tapplace:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *other;
- (IBAction)tapother:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *information;
- (IBAction)tapinformation:(id)sender;




@end

