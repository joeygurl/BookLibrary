//
//  MyBookSearch.h
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/14/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyBookSearch : UITableViewController<UISearchBarDelegate,UISearchDisplayDelegate>
-(IBAction)unwindMyBookSearchController:(UIStoryboardSegue *)unwindSegue;
@end
