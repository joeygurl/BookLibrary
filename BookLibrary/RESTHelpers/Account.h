//
//  Account.h
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/26/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "RESTService.h"

@interface Account : NSObject

-(NSString *) register:(User*) user;
-(BOOL) signIn:(User *)user;
-(NSString *) changePassword:(User *) user;
-(NSString *) updateProfile:(User *) user;

@end
