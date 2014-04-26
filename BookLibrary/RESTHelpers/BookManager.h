//
//  BookManager.h
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/26/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import "RESTService.h"

@interface BookManager : NSObject

-(NSString *)add:(Book *)book;
-(NSString *)remove:(Book *)book;
-(NSMutableArray *) getBooks;
-(NSMutableArray *) getReviews:(Book *)forBook;
-(NSMutableArray *) getBooksFromGoogle:(Book *)book;

@end
