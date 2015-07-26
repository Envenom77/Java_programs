//
//  PostDetailsViewController.h
//  BoatIt7
//
//  Created by Academy 5 on 17/07/15.
//  Copyright (c) 2015 JosipGatjal. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Post.h"



@interface PostDetailsViewController : UIViewController

@property (nonatomic, strong) Post *post;

@property(nonatomic,retain) NSString *titleLabel;

@property(nonatomic) NSString *number;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property(nonatomic,retain)UIImage *img;

@property (nonatomic, weak) UIButton *button;


@end
