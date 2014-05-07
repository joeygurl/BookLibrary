//
//  Account.m
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/26/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import "Account.h"
#import "ResponseObject.h"


@implementation Account

RESTService *_restService;
NSString *_appyDaysServiceURL;

-(id)init
{
    _restService = [[RESTService alloc]init];
    _appyDaysServiceURL = @"http://booklibraryapi.herokuapp.com/api/users.json";
    return self;
}

-(NSString *) register:(User*) user
{
    NSString *queryString = @"";
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",queryString]];
    [_restService getResponse:url withMethod:@"POST"];
    return @""; //TO DO: What to return as response

}

-(BOOL) signIn:(User *)user
{
    NSString *queryString = [NSString stringWithFormat:@"?email=%@&password=%@",user.emailAddress,user.password];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_appyDaysServiceURL, queryString]];
    ResponseObject *response = [_restService getResponse:url withMethod:@"GET"];
    if([response.response statusCode] >=200 && [response.response statusCode] < 300)
    {
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setValue:user.emailAddress forKey:@"USERNAME"];
        [defaults setValue:response.responseDictionary[@"id"] forKey:@"USERID"];
        [defaults setValue:response.responseDictionary[@"token"] forKey:@"ACCESS_TOKEN"];
        [defaults synchronize];
        return YES;
    }
    else
        return NO;
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
