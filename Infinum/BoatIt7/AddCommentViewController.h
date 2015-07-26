//
//  AddCommentViewController.h
//  BoatIt7
//
//  Created by Academy 5 on 22/07/15.
//  Copyright (c) 2015 JosipGatjal. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddCommentDelegate <NSObject>

-(void) reloadComments:(NSString *)data;

@end

@interface AddCommentViewController : UIViewController



@property (nonatomic, weak) NSString *data;

@property (nonatomic, weak) UIButton *button;

@property (nonatomic, weak) id<AddCommentDelegate> delegate;

@end
