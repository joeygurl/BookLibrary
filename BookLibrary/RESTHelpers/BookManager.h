//
//  BookManager.h
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/26/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import "User.h"
#import "Review.h"
#import "RESTService.h"


@interface BookManager : NSObject
typedef enum
{
    MY_BOOKS=0,
    LOANED_BOOKS,
    BORROWED_BOOKS,
    PENDING_REQUEST_BOOKS,
    ADD_BOOK
}BookState;

-(NSString *)add:(Book *)book;
-(NSString *)remove:(Book *)book;
-(NSString *)markReturned:(Book *)book;
-(NSString *)approveLoan: (Book *)book;
-(NSString *)denyLoan: (Book *)book;

-(NSMutableArray *) getBooks: (BookState)bookState;
-(NSMutableArray *) getReviews:(Book *)forBook;
-(NSMutableArray *) getBooksFromGoogle:(NSString *) searchText;
-(NSMutableArray *) getLenders:(Book *)forBook;

@end
