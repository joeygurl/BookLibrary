//
//  MyBookDetailsTab.h
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/28/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book.h"
#import "RESTHelpers/BookManager.h"

@interface BookDetailTabController : UITabBarController
@property (strong, nonatomic) Book *bookDetail;
@property (strong, nonatomic) NSMutableArray *bookReviews;
@property BookState currentView;
@end
