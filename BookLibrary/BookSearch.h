//
//  GoogleBooksSearch.h
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/14/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book.h"
#import "BookManager.h"

@interface BookSearch : UITableViewController<UISearchBarDelegate>
@property BookState currentView;
@end
