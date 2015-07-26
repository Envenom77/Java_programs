//
//  APIManager.h
//  BoatIt
//
//  Created by Academy 5 on 17/07/15.
//  Copyright (c) 2015 JosipGatjal. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;
@class Post;

@interface APIManager : NSObject

+ (instancetype)sharedManager;

+ (void)loginWithUsername:(NSString *)username password:(NSString *)password success:(void (^)(User *user))success failure:(void (^)(NSError *error))failure;
+ (void)getThreadsWithSuccess:(void (^)(NSArray *posts))success failure:(void (^)(NSError *error))failure;

+ (void)getThreadsWithSuccess2:(NSString *)postId success:(void (^)(NSArray *comments))success failure:(void (^)(NSError *error))failure;

+ (void)upboatPostWithId:(NSString *)postId success:(void (^)(Post *post))success failure:(void (^)(NSError *error))failure;
+ (void)downboatPostWithId:(NSString *)postId success:(void (^)(Post *post))success failure:(void (^)(NSError *error))failure;

+ (void)postNewComment:(NSString *)postId data:(NSString *)data success:(void (^)())success failure:(void (^)(NSError *error))failure;

@property (strong, nonatomic) User *user;

@end
