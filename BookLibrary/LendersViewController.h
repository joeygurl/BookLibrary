//
//  LendersViewController.h
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/29/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book.h"
#import "RESTHelpers/BookManager.h"

@interface LendersViewController : UITableViewController
@property Book *bookDetails;
@end
