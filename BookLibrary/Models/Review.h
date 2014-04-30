//
//  Review.h
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/29/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Review : NSObject

@property int rating;
@property NSString *comment;
@property User *user;

@end
