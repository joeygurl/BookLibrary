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
    _googleBooksServiceURL = @"http://booklibraryapi.herokuapp.com/api/books.json?apikey=";
    _appyDaysServiceURL = @"http://booklibraryapi.herokuapp.com/api/books_instances.json?apikey=";
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

-(NSMutableArray *) getBooks:(NSString *)searchText
{
    NSString *queryString = [NSString stringWithFormat:@"&searchText=%@",searchText];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_googleBooksServiceURL, queryString]];
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

-(NSMutableArray *) getReviews:(Book *)forBook
{
    NSString *queryString = @"";
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",queryString]];
    NSDictionary *responseDict = [_restService getResponse:url withMethod:@"GET"];
    
    NSMutableArray *reviewList= [responseDict objectForKey:@("")];
    return reviewList;

}

-(NSMutableArray *) getBooksFromGoogle:(Book *)book
{
    NSString *queryString = @"";
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",queryString]];
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


@end
