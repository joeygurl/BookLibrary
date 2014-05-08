//
//  Book.h
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/21/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoanDetail.h"

@interface Book : NSObject

@property int bId;
@property int bookId;
@property NSString *isbn;
@property NSString *title;
@property NSString *author;
@property NSString *imageLink;
@property NSString *genres;

@property User *lender;
@property LoanDetail *loanDetail;

@property int rating;
@property NSString *review;

@end
