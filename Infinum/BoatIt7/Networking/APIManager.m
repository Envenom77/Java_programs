//
//  APIManager.m
//  BoatIt
//
//  Created by Academy 5 on 17/07/15.
//  Copyright (c) 2015 JosipGatjal. All rights reserved.
//

#import "APIManager.h"

#import <AFNetworking/AFNetworking.h>
#import "User.h"
#import "Post.h"
#import "Comment.h"

@implementation APIManager

#pragma mark - Init

+ (instancetype)sharedManager
{
    static APIManager *manager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[super alloc] init];
    });
    
    return manager;
}

#pragma mark - Login

+ (void)loginWithUsername:(NSString *)username password:(NSString *)password success:(void (^)(User *user))success failure:(void (^)(NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSDictionary *parameters = @{@"email": username, @"password": password};
    
    [manager POST:@"https://boatit.infinum.co/api/v1/users/login" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *userDictionary = responseObject[@"response"];
        
        NSError *error = nil;
        User *user = [[User alloc] initWithDictionary:userDictionary error:&error];
        
        if (!error) {
            [APIManager sharedManager].user = user;
            success(user);
        } else {
            failure(error);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];
}

#pragma mark - Get posts

+ (void)getThreadsWithSuccess:(void (^)(NSArray *posts))success failure:(void (^)(NSError *error))failure
{
    // Ovo je i dalje za DZ :P
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *parameters = @{@"token": [APIManager sharedManager].user.token};
    
    [manager GET:@"https://boatit.infinum.co/api/v1/posts" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSError *error = nil;
        NSArray *posts = [Post arrayOfModelsFromDictionaries:responseObject[@"response"] error:&error];
        
        if (error == nil) {
            success(posts);
        } else {
            failure(error);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];
}

#pragma mark - Get comments

+ (void)getThreadsWithSuccess2:(NSString *)postId success:(void (^)(NSArray *comments))success failure:(void (^)(NSError *error))failure
{
   
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *parameters = @{@"token": [APIManager sharedManager].user.token};
    
    NSString *path = [NSString stringWithFormat:@"https://boatit.infinum.co/api/v1/posts/%@/comments", postId];
   
    
    [manager GET:path parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSError *error = nil;
        NSArray *comments = [Comment arrayOfModelsFromDictionaries:responseObject[@"response"] error:&error];
        
        if (error == nil) {
            success(comments);
        } else {
            failure(error);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];
}

#pragma mark - Add comment

+ (void)postNewComment:(NSString *)postId data:(NSString *)data success:(void (^)())success failure:(void (^)(NSError *error))failure
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *parameters = @{@"comment" : @{
                                         @"content":data
                                         }};
    
    NSString *path = [NSString stringWithFormat:@"https://boatit.infinum.co/api/v1/posts/%@/comments?token=%@", postId, [APIManager sharedManager].user.token];
    
    [manager POST:path parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success();
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];
    
    [manager GET:path parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSError *error = nil;
        NSArray *comments = [Comment arrayOfModelsFromDictionaries:responseObject[@"response"] error:&error];
        
        if (error == nil) {
            success(comments);
        } else {
            failure(error);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];
}

#pragma mark - Upboats and downboats

+ (void)upboatPostWithId:(NSString *)postId success:(void (^)(Post *post))success failure:(void (^)(NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSDictionary *parameters = @{@"token": [APIManager sharedManager].user.token};
    
    NSString *path = [NSString stringWithFormat:@"https://boatit.infinum.co/api/v1/posts/%@/upboat", postId];
    
    [manager GET:path parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSError *error = nil;
        Post *post = [[Post alloc] initWithDictionary:responseObject[@"response"] error:&error];
        
        if (error == nil) {
            success(post);
        } else {
            failure(error);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];
}

+ (void)downboatPostWithId:(NSString *)postId success:(void (^)(Post *post))success failure:(void (^)(NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSDictionary *parameters = @{@"token": [APIManager sharedManager].user.token};
    
    NSString *path = [NSString stringWithFormat:@"https://boatit.infinum.co/api/v1/posts/%@/downboat", postId];
    
    [manager GET:path parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSError *error = nil;
        Post *post = [[Post alloc] initWithDictionary:responseObject[@"response"] error:&error];
        
        if (error == nil) {
            success(post);
        } else {
            failure(error);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];
}

@end
