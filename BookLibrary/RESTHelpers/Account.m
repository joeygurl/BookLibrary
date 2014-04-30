//
//  Account.m
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/26/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import "Account.h"


@implementation Account

RESTService *_restService;
NSString *_appyDaysServiceURL;

-(id)init
{
    _restService = [[RESTService alloc]init];
    _appyDaysServiceURL = @"http://booklibraryapi.herokuapp.com/api/users.json?access_token=e5af08e17b1528828251510926dbbd21";
    return self;
}

-(NSString *) register:(User*) user
{
    NSString *queryString = @"";
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",queryString]];
    [_restService getResponse:url withMethod:@"POST"];
    return @""; //TO DO: What to return as response

}

-(NSString *) signIn:(User *)user
{
    NSString *queryString = [NSString stringWithFormat:@"&email=%@&password=%@",user.emailAddress,user.password];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_appyDaysServiceURL, queryString]];
    [_restService getResponse:url withMethod:@"GET"];
    return @""; //TO DO: What to return as response
}

-(NSString *) changePassword:(User *) user
{
    NSString *queryString = @"";
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",queryString]];
    [_restService getResponse:url withMethod:@"UPDATE"];
    return @""; //TO DO: What to return as response
}

-(NSString *) updateProfile:(User *) user
{
    NSString *queryString = @"";
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",queryString]];
    [_restService getResponse:url withMethod:@"UPDATE"];
    return @""; //TO DO: What to return as response
}



@end
