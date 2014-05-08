//
//  LoanDetail.h
//  BookLibrary
//
//  Created by Diorelle Ramos on 5/7/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface LoanDetail : NSObject
@property int loanId;
@property User *borrower;
@property NSDate *requestedDate;
@property NSDate *lentDate;
@end
