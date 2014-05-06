//
//  AccountDetails.h
//  BookLibrary
//
//  Created by Bret Hassler on 5/5/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Account.h"

@protocol AccountDetailsDelegate;
@interface AccountDetails : UITableViewController

@property (nonatomic, weak) id delegate;
//@property (nonatomic, strong) User *userDetail;


@end


@protocol AccountDetailsDelegate

// delegate methods
- (void)accountDetailsCancel;
- (void)accountDetailsSave:(User *)user;

@end

