//
//  Book.h
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/21/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject

@property NSString *title;
@property NSString *author;
@property int rating;
@property NSMutableArray *reviews;

@end
