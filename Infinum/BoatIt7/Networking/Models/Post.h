//
//  Post.h
//  BoatIt
//
//  Created by Academy 5 on 17/07/15.
//  Copyright (c) 2015 JosipGatjal. All rights reserved.
//

#import "JSONModel.h"

#import "User.h"

@interface Post : JSONModel

@property (nonatomic, strong) NSString  *postId;
@property (nonatomic, strong) NSString  *title;
@property (nonatomic, strong) NSString  *imageUrl;
@property (nonatomic, strong) NSDate    *createdAt;
@property (nonatomic, assign) NSInteger  score;
@property (nonatomic, strong) User      *creator;

@end
