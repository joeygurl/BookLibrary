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

-(id)init
{
    _restService = [[RESTService alloc]init];
    _googleBooksServiceURL = @"http://booklibraryapi.herokuapp.com/api/books.json?access_token=e5af08e17b1528828251510926dbbd21";
    _appyDaysServiceURL = @"http://booklibraryapi.herokuapp.com/api";
    return self;
}

-(NSString *)add:(Book *)book;
{
    NSString *queryString = @"";
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",queryString]];
    [_restService getResponse:url withMethod:@"POST"];
    return @""; //TO DO: What to return as response
}

-(NSString *)remove:(Book *)book
{
    NSString *queryString = @"";
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",queryString]];
    [_restService getResponse:url withMethod:@"DELETE"];
    return @""; //TO DO: What to return as response
}

-(NSMutableArray *) getBooksFromGoogle:(NSString *)searchText
{
    NSString *queryString = [NSString stringWithFormat:@"&search_text=%@",[searchText stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_googleBooksServiceURL, queryString]];
    NSDictionary *responseDict = [_restService getResponse:url withMethod:@"GET"];
    
    //NSArray *bookArray = [responseDict];
    NSMutableArray *bookList= [[NSMutableArray alloc]init];
    
    //parse dictionary
    for(id retBook in responseDict){
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
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",queryString]];
    NSDictionary *responseDict = [_restService getResponse:url withMethod:@"GET"];
    
    NSMutableArray *reviewList= [responseDict objectForKey:@("")];
    return reviewList;

}

-(NSMutableArray *) getBooks:(int)bookState
{
    NSString *queryString = @"access_token=&user_id=";
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
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@&%@",_appyDaysServiceURL,s_url, queryString]];
    NSDictionary *responseDict = [_restService getResponse:url withMethod:@"GET"];
    
    NSArray *bookArray = [responseDict objectForKey:@("")];
    NSMutableArray *bookList= [[NSMutableArray alloc]init];
    
    //parse dictionary
    for(NSDictionary *retBook in bookArray){
        //create book object & init
        Book *book = [[Book alloc] init];
        book.title = [retBook objectForKey:@""];
        
        //add book object to contact array
        [bookList addObject:book];
    }
    return bookList;
}

-(NSMutableArray *) getLenders:(Book *)forBook
{
    NSMutableArray *bookList = [[NSMutableArray alloc]init];
    return bookList;
}

@end
