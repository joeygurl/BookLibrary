//
//  RESTService.h
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/26/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import "User.h"

@interface RESTService : NSObject
-(NSDictionary *)getResponse:(NSURL *)fromURL withMethod:(NSString *)method;

@end
