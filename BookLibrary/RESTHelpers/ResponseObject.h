//
//  Response.h
//  BookLibrary
//
//  Created by Diorelle Ramos on 5/6/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResponseObject : NSObject

@property (strong, nonatomic) NSHTTPURLResponse *response;
@property (strong, nonatomic) NSError *error;
@property (strong, nonatomic) NSDictionary *responseDictionary;

@end
