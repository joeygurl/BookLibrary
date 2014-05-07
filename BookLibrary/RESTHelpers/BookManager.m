//
//  BookManager.m
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/26/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import "BookManager.h"


@implementation BookManager

RESTService *_restService;
NSString *_googleBooksServiceURL;
NSString *_appyDaysServiceURL;
NSString *_authorizationQueryString;
NSUserDefaults *_defaults;

-(id)init
{
    _restService = [[RESTService alloc]init];
    _googleBooksServiceURL = @"http://booklibraryapi.herokuapp.com/api/books.json?access_token=e5af08e17b1528828251510926dbbd21";
    _appyDaysServiceURL = @"http://booklibraryapi.herokuapp.com/api";
    _defaults = [NSUserDefaults standardUserDefaults];
    _authorizationQueryString = [NSString stringWithFormat:@"access_token=%@&user_id=%@",[_defaults valueForKey:@"ACCESS_TOKEN"], [_defaults valueForKey:@"USERID"]];
    return self;
}

-(NSString *)add:(Book *)book
{
    NSString *s_url = @"/book_instances.json";
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?%@",_appyDaysServiceURL,s_url, _authorizationQueryString]];
    ResponseObject *response = [_restService getResponse:url withMethod:@"POST" andBody:[self getBookParams:book andOwner:[NSString stringWithFormat:@"%@",[_defaults valueForKey:@"USERID"]]]];
    if ([response.response statusCode] >=200 && [response.response statusCode] <300)
        return @"Book added to your library.";
    else
        return @"Failed to add book to your library, try again later.";
}

-(NSString *)getBookParams:(Book *)book andOwner:(NSString *)owner
{
    NSString *params;
    params=[NSString stringWithFormat:@"title=%@&genre=%@&isbn=%@&author=%@&user_id=%@", book.title, book.genres, book.isbn, book.author, owner];
    return params;
}

-(NSString *)remove:(Book *)book
{
    NSString *s_url = [NSString stringWithFormat: @"/book_instances/%i.json", book.bId]; //TO DO: PASS BOOK INSTANCE PROPERLY
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?%@",_appyDaysServiceURL,s_url, _authorizationQueryString]];
    ResponseObject *response = [_restService getResponse:url withMethod:@"DELETE"];
    if ([response.response statusCode] >=200 && [response.response statusCode] <300)
        return @"Book removed from your library.";
    else
        return @"Failed to remove book from your library, try again later.";
}

-(NSString *)markReturned:(Book *)book
{
    NSString *queryString = @"";
    NSString *s_url = [NSString stringWithFormat:@"/loans/%@/return.json", book.title]; //TO DO: PASS PROPER PARAM
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?%@&%@",_appyDaysServiceURL,s_url, _authorizationQueryString, queryString]];
    ResponseObject *response  = [_restService getResponse:url withMethod:@"POST"];
    if ([response.response statusCode] >=200 && [response.response statusCode] <300)
        return @"Book marked as returned.";
    else
        return @"Failed to mark book as returned, try again later.";
}

-(NSString *)approveLoan: (Book *)book
{
    NSString *queryString = @"";
    NSString *s_url = [NSString stringWithFormat:@"/loans/%@/approve.json", book.title]; //TO DO: PASS PROPER PARAM
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?%@&%@",_appyDaysServiceURL,s_url, _authorizationQueryString, queryString]];
    ResponseObject *response = [_restService getResponse:url withMethod:@"POST"];
    if ([response.response statusCode] >=200 && [response.response statusCode] <300)
        return @"Book marked as loaned.";
    else
        return @"Failed to mark book as loaned, try again later.";
}

-(NSString *)denyLoan: (Book *)book
{
    NSString *queryString = @"";
    NSString *s_url = [NSString stringWithFormat:@"/loans/%@/deny.json", book.title]; //TO DO: PASS PROPER PARAM
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?%@&%@",_appyDaysServiceURL,s_url, _authorizationQueryString, queryString]];
    ResponseObject *response = [_restService getResponse:url withMethod:@"POST"];
    if ([response.response statusCode] >=200 && [response.response statusCode] <300)
        return @"Loan denied";
    else
        return @"Failed to deny loan, try again later.";
}

-(NSMutableArray *) getBooksFromGoogle:(NSString *)searchText
{
    NSString *queryString = @"";
    queryString = [NSString stringWithFormat:@"&search_text=%@",[searchText stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_googleBooksServiceURL, queryString]];
    ResponseObject *response = [_restService getResponse:url withMethod:@"GET"];
    
    //NSArray *bookArray = [responseDict];
    NSMutableArray *bookList= [[NSMutableArray alloc]init];
    
    //parse dictionary
    for(id retBook in response.responseDictionary){
        //create book object & init
        Book *book = [[Book alloc] init];
        book.isbn = [retBook objectForKey: @"isbn_13"];
        book.title = [retBook objectForKey: @"title"];
        book.author = [retBook objectForKey: @"authors"];
        book.genres = [retBook objectForKey: @"genres"];
        book.imageLink = [retBook objectForKey: @"image_link"];
        
        //add book object to contact array
        [bookList addObject:book];
    }
    return bookList;

}


-(NSMutableArray *) getReviews:(Book *)forBook
{
    NSString *queryString = @"";
    NSString *s_url = @"";
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?%@&%@",_appyDaysServiceURL,s_url, _authorizationQueryString, queryString]];
    ResponseObject *response = [_restService getResponse:url withMethod:@"GET"];
    
    NSArray *reviewArray = [response.responseDictionary objectForKey:@("")];
    NSMutableArray *reviewList= [[NSMutableArray alloc]init];
    
    //parse dictionary
    for(NSDictionary *retReview in reviewArray){
        //create review object & init
        Review  *review = [[Review alloc] init];
        review.rating = [[retReview objectForKey:@""]intValue];
        review.comment = [retReview objectForKey:@""];
        //review.user = [retReview objectForKey:@""];
        
        //add review object to review list
        [reviewList addObject:review];
    }
    
    return reviewList;

}

-(NSMutableArray *) getBooks:(BookState)bookState
{
    NSString *queryString = @"";
    NSString *s_url = @"";
    switch (bookState) {
        case MY_BOOKS:
            s_url=@"/book_instances.json";
            break;
        case LOANED_BOOKS:
            s_url=@"/loans/lent.json";
            break;
        case BORROWED_BOOKS:
            s_url=@"/loans/borrowed.json";
            break;
        case PENDING_REQUEST_BOOKS:
            s_url=@"/loans/request.json";
            break;
        default:
            break;
    }
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?%@&%@",_appyDaysServiceURL,s_url, _authorizationQueryString, queryString]];
    ResponseObject *response = [_restService getResponse:url withMethod:@"GET"];
    NSMutableArray *bookList= [[NSMutableArray alloc]init];
    
    //parse dictionary
    for(NSDictionary *retBook in response.responseDictionary){
        //create book object & init
        Book *book = [[Book alloc] init];
        book.title = @"title";//[retBook objectForKey:@"book_id"];
        book.author = @"a";
        book.genres = @"g";
        book.isbn = @"i";
        book.bId = [[retBook objectForKey:@"id"] integerValue];
        book.bookId = [[retBook objectForKey:@"book_id"] integerValue];
        
        //add book object to contact array
        [bookList addObject:book];
    }
    return bookList;
}

-(NSMutableArray *) getLenders:(Book *)forBook
{
    NSString *queryString = @"";
    NSString *s_url = @"";
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?%@&%@",_appyDaysServiceURL,s_url, _authorizationQueryString, queryString]];
    ResponseObject *response = [_restService getResponse:url withMethod:@"GET"];
    
    NSArray *userArray = [response.responseDictionary objectForKey:@("")];
    NSMutableArray *lenderList= [[NSMutableArray alloc]init];
    
    //parse dictionary
    for(NSDictionary *retUser in userArray){
        //create lender object & init
        User  *user = [[User alloc] init];
        user.emailAddress = [retUser objectForKey:@""];
        user.firstName = [retUser objectForKey:@""];
        user.lastName = [retUser objectForKey:@""];
        
        //add user object to lender list
        [lenderList addObject:user];
    }

    return lenderList;
}

@end
