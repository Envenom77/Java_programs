//
//  Comment.m
//  BoatIt7
//
//  Created by Academy 5 on 23/07/15.
//  Copyright (c) 2015 JosipGatjal. All rights reserved.
//

#import "Comment.h"

@implementation Comment

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id": @"postId",
                                                       @"content": @"content",
                                                       @"created_at": @"createdAt"}];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

@end
