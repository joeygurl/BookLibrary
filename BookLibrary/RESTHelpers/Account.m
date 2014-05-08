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
NSString *_authorizationQueryString;
NSUserDefaults *_defaults;

-(id)init
{
    _restService = [[RESTService alloc]init];
    _appyDaysServiceURL = @"http://booklibraryapi.herokuapp.com/api/users.json";
    _authorizationQueryString = [NSString stringWithFormat:@"access_token=%@",[_defaults valueForKey:@"ACCESS_TOKEN"]];

    return self;
}

-(BOOL) register:(User*) user
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",_appyDaysServiceURL]];
    ResponseObject *response = [_restService getResponse:url withMethod:@"POST" andBody:[self getRegistrationParams:user]];
    if([response.response statusCode] >=200 && [response.response statusCode] < 300)
        return YES;
    else
        return NO;
}

-(NSString *)getRegistrationParams:(User *)user
{
    NSString *params;
    params=[NSString stringWithFormat:@"first_name=%@&last_name=%@&email=%@&password=%@&city_state_str=%@", user.firstName, user.lastName, user.emailAddress, user.password, user.cityState];
    return params;
}

-(BOOL) signIn:(User *)user
{
    NSString *queryString = [NSString stringWithFormat:@"?email=%@&password=%@",user.emailAddress,user.password];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_appyDaysServiceURL, queryString]];
    ResponseObject *response = [_restService getResponse:url withMethod:@"GET"];
    if([response.response statusCode] >=200 && [response.response statusCode] < 300)
    {
        NSDictionary *userDictionary = [response.responseDictionary objectForKey:@"user"];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setValue:user.emailAddress forKey:@"USERNAME"];
        [defaults setValue:[userDictionary objectForKey:@"id"] forKey:@"USERID"];
        [defaults setValue:[response.responseDictionary objectForKey:@"token"] forKey:@"ACCESS_TOKEN"];
        [defaults synchronize];
        return YES;
    }
    else
        return NO;
}


-(BOOL) updateProfile:(User *) user
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://booklibraryapi.herokuapp.com/api/users/%@.json",[_defaults valueForKey:@"USERID"]]];
    NSString *params = [NSString stringWithFormat:@"%@&%@",_authorizationQueryString, [self getRegistrationParams:user]];
    ResponseObject *response = [_restService getResponse:url withMethod:@"PUT" andBody:params];
    if([response.response statusCode] >=200 && [response.response statusCode] < 300)
        return YES;
    else
        return NO;
}



@end
