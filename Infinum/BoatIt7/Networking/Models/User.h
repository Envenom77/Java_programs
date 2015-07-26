//
//  User.h
//  BoatIt
//
//  Created by Academy 5 on 17/07/15.
//  Copyright (c) 2015 JosipGatjal. All rights reserved.
//

#import "JSONModel.h"

@interface User : JSONModel

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *token;

@end
