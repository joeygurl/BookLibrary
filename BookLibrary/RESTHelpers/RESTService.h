//
//  RESTService.h
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/26/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RESTService : NSObject
-(NSDictionary *)getResponse:(NSURL *)fromURL withMethod:(NSString *)method;
-(NSDictionary *)getResponse:(NSURL *)fromURL withMethod:(NSString *)method andBody:(NSString *)body;

@end
