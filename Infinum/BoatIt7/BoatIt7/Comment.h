//
//  Comment.h
//  BoatIt7
//
//  Created by Academy 5 on 23/07/15.
//  Copyright (c) 2015 JosipGatjal. All rights reserved.
//

#import "JSONModel.h"

#import "User.h"

@interface Comment: JSONModel

@property (nonatomic, strong) NSString  *postId;
@property (nonatomic, strong) NSString  *content;
@property (nonatomic, strong) NSDate    *createdAt;
@property (nonatomic, strong) User      *author;

@end
