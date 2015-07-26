//
//  Post.m
//  BoatIt
//
//  Created by Academy 5 on 17/07/15.
//  Copyright (c) 2015 JosipGatjal. All rights reserved.
//

#import "Post.h"

@implementation Post

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id": @"postId",
                                                       @"image_url": @"imageUrl",
                                                       @"created_at": @"createdAt"}];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

@end
