//
//  RESTService.m
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/26/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import "RESTService.h"


@implementation RESTService


-(ResponseObject *)getResponse:(NSURL *)fromURL withMethod:(NSString *)method
{
    //init request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:fromURL];
    [request setHTTPMethod:method];
    
    //init response
    NSHTTPURLResponse *response = nil;
    NSError *error = [[NSError alloc] init];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    
    ResponseObject *res = [[ResponseObject alloc]init];
    res.response = response;
    res.responseDictionary=responseDict;
    res.error = error;
    return res;
}

-(ResponseObject *)getResponse:(NSURL *)fromURL withMethod:(NSString *)method andBody:(NSString *)body
{
    //init request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:fromURL];
    [request setHTTPMethod:method];
    [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    
    //init response
    NSHTTPURLResponse *response = nil;
    NSError *error = [[NSError alloc] init];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    
    ResponseObject *res = [[ResponseObject alloc]init];
    res.response = response;
    res.responseDictionary=responseDict;
    res.error = error;
    return res;
}
@end
