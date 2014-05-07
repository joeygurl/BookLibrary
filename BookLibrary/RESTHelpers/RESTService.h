//
//  RESTService.h
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/26/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseObject.h"

@interface RESTService : NSObject
-(ResponseObject *)getResponse:(NSURL *)fromURL withMethod:(NSString *)method;
-(ResponseObject *)getResponse:(NSURL *)fromURL withMethod:(NSString *)method andBody:(NSString *)body;

@end
