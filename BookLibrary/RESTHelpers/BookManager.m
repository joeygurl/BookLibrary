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
NSString *_authorizationQueryStringWithoutUserId;
NSUserDefaults *_defaults;

-(id)init
{
    _restService = [[RESTService alloc]init];
    _googleBooksServiceURL = @"http://booklibraryapi.herokuapp.com/api/books.json?access_token=e5af08e17b1528828251510926dbbd21";
    _appyDaysServiceURL = @"http://booklibraryapi.herokuapp.com/api";
    _defaults = [NSUserDefaults standardUserDefaults];
    _authorizationQueryString = [NSString stringWithFormat:@"access_token=%@&user_id=%@",[_defaults valueForKey:@"ACCESS_TOKEN"], [_defaults valueForKey:@"USERID"]];
    _authorizationQueryStringWithoutUserId = [NSString stringWithFormat:@"access_token=%@",[_defaults valueForKey:@"ACCESS_TOKEN"]];
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
    NSString *s_url = [NSString stringWithFormat: @"/book_instances/%i.json", book.bId]; 
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
    NSString *s_url = [NSString stringWithFormat:@"/loans/%i/return.json", book.loanDetail.loanId];
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
    NSString *s_url = [NSString stringWithFormat:@"/loans/%i/approve.json", book.loanDetail.loanId];
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
    NSString *s_url = [NSString stringWithFormat:@"/loans/%i/deny.json", book.loanDetail.loanId]; //TO DO: PASS PROPER PARAM
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?%@&%@",_appyDaysServiceURL,s_url, _authorizationQueryString, queryString]];
    ResponseObject *response = [_restService getResponse:url withMethod:@"POST"];
    if ([response.response statusCode] >=200 && [response.response statusCode] <300)
        return @"Loan denied";
    else
        return @"Failed to deny loan, try again later.";
}

-(NSString *)addReview:(Book *)book
{
    NSString *s_url = @"/reviews.json";
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?%@",_appyDaysServiceURL,s_url, _authorizationQueryString]];
    ResponseObject *response = [_restService getResponse:url withMethod:@"POST" andBody:[self getReviewParams:book]];
    if ([response.response statusCode] >=200 && [response.response statusCode] <300)
        return @"Review added for book.";
    else
        return @"Failed to save review, try again later.";
}

-(NSString *)getReviewParams:(Book *)book
{
    NSString *params;
    params=[NSString stringWithFormat:@"book_id=%i&user_id=%@&rating=%i&comments=%@", book.bookId, [_defaults valueForKey:@"USERID"], book.rating, book.review];
    return params;
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
    NSString *s_url = [NSString stringWithFormat:@"/reviews/%i.json", forBook.bookId];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?%@&%@",_appyDaysServiceURL,s_url, _authorizationQueryString, queryString]];
    ResponseObject *response = [_restService getResponse:url withMethod:@"GET"];
    
    NSMutableArray *reviewList= [[NSMutableArray alloc]init];
    
    //parse dictionary
    for(NSDictionary *retReview in [response responseDictionary]){
        //create review object & init
        Review  *review = [[Review alloc] init];
        review.rating = [[retReview objectForKey:@"rating"]intValue];
        review.comment = [retReview objectForKey:@"comments"];
        
        NSDictionary *reviewerDictionary = [retReview objectForKey:@"user"];
        review.user = [[User alloc]init];
        review.user.firstName = [reviewerDictionary objectForKey:@"first_name"];
        review.user.lastName = [reviewerDictionary objectForKey:@"last_name"];
        
        //add review object to review list
        [reviewList addObject:review];
    }
    
    return reviewList;

}

-(NSMutableArray *) getBooks:(BookState)bookState andSearchText:(NSString *)searchText
{
    NSString *queryString = @"";
    NSString *s_url = @"";
    NSString *auth = _authorizationQueryString;
    switch (bookState) {
        case MY_BOOKS:
            s_url=@"/book_instances.json";
            break;
        case BORROW_A_BOOK:
        {
            s_url=@"/book_instances.json";
            queryString = [NSString stringWithFormat:@"&search_text=%@",[searchText stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            auth = _authorizationQueryStringWithoutUserId;
            break;
        }
        case LOANED_BOOKS:
            s_url=@"/loans/lent.json";
            break;
        case BORROWED_BOOKS:
            s_url=@"/loans/borrowed.json";
            break;
        case PENDING_REQUEST_BOOKS:
            s_url=@"/loans/pending.json";
            break;
        default:
            break;
    }
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?%@&%@",_appyDaysServiceURL,s_url, auth, queryString]];
    ResponseObject *response = [_restService getResponse:url withMethod:@"GET"];
    NSMutableArray *bookList= [[NSMutableArray alloc]init];
    
    //parse dictionary
    for(NSDictionary *retBook in response.responseDictionary){
        NSDictionary *bookDetailsDictionary = [retBook  objectForKey:@"book"];
        
        //create book object & init
        Book *book = [[Book alloc] init];
        book.title = [bookDetailsDictionary objectForKey:@"title"];
        book.author = [bookDetailsDictionary objectForKey:@"author"];
        book.genres = [bookDetailsDictionary objectForKey:@"genre"];
        book.isbn = [bookDetailsDictionary objectForKey:@"isbn"];
        book.bId = [[retBook objectForKey:@"id"] integerValue];
        book.bookId = [[retBook objectForKey:@"book_id"] integerValue];
        
        NSDictionary *ownerDictionary = [retBook objectForKey:@"user"];
        book.lender =  [[User alloc]init];
        book.lender.firstName = [ownerDictionary objectForKey:@"first_name"];
        book.lender.lastName = [ownerDictionary objectForKey:@"last_name"];
        book.lender.cityState =[ownerDictionary objectForKey:@"city_state_str"];
        
        if (bookState==PENDING_REQUEST_BOOKS || bookState==LOANED_BOOKS) {
            NSDictionary *borrowerDictionary = [retBook objectForKey:@"borrower"];
            book.loanDetail = [[LoanDetail alloc]init];
            book.loanDetail.loanId=[[retBook objectForKey:@"id"] integerValue];
            book.loanDetail.borrower = [[User alloc]init];
            book.loanDetail.borrower.firstName = [borrowerDictionary objectForKey:@"first_name"];
            book.loanDetail.borrower.lastName = [borrowerDictionary objectForKey:@"last_name"];
            book.loanDetail.requestedDate = [borrowerDictionary objectForKey:@"requested_at"];
            book.loanDetail.lentDate = [borrowerDictionary objectForKey:@"lent_at"];
        }
        
        //add book object to contact array
        [bookList addObject:book];
    }
    return bookList;
}

-(NSMutableArray *) getLenders:(Book *)forBook
{
    NSString *queryString =[NSString stringWithFormat:@"search_text=%@",forBook.title];
    NSString *s_url = @"/book_instances.json";
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?%@&%@",_appyDaysServiceURL,s_url, _authorizationQueryString, queryString]];
    ResponseObject *response = [_restService getResponse:url withMethod:@"GET"];
    
    NSArray *userArray = [response.responseDictionary objectForKey:@("user")];
    NSMutableArray *lenderList= [[NSMutableArray alloc]init];
    
    //parse dictionary
    for(NSDictionary *retUser in userArray){
        //create lender object & init
        User  *user = [[User alloc] init];
        user.firstName = [retUser objectForKey:@"first_name"];
        user.lastName = [retUser objectForKey:@"last_name"];
        user.userId =[[response.responseDictionary objectForKey:@("user_id")] integerValue];
        
        //add user object to lender list
        [lenderList addObject:user];
    }

    return lenderList;
}

@end
