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
typedef enum bookStateTypes
{
    MY_BOOKS=0,
    LOANED_BOOKS,
    BORROWED_BOOKS,
    PENDING_REQUEST_BOOKS
}BookState;

-(NSString *)add:(Book *)book;
-(NSString *)remove:(Book *)book;
-(NSMutableArray *) getBooks: (int)bookState;
-(NSMutableArray *) getReviews:(Book *)forBook;
-(NSMutableArray *) getBooksFromGoogle:(NSString *) searchText;

@end
