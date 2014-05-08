//
//  GoogleBooksSearch.m
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/14/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import "BookSearch.h"
#import "BookDetailTabController.h"

@interface BookSearch ()
{
    NSMutableArray *_bookArray;
    BookManager *_bookManager;
}
@end

@implementation BookSearch
@synthesize currentView;
NSArray *filteredBookArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _bookManager = [[BookManager alloc] init];
    [self  setViewLabel];
   }

-(void)viewDidAppear:(BOOL)animated
{
    //[self.searchDisplayController.searchBar becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setViewLabel
{
    switch([self currentView])
    {
        case ADD_BOOK:
            self.navigationItem.title=@"Add a Book";
            break;
        case BORROW_A_BOOK:
            self.navigationItem.title=@"Borrow a Book";
            break;
        default:
            break;
            
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [_bookArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    Book *book = nil;
    if (_bookArray != nil) {
        book = [_bookArray objectAtIndex:indexPath.row];
        cell.textLabel.text = book.title;
        cell.detailTextLabel.text = book.author;
    }
    

    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [controller.searchResultsTableView setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.8]];
    [controller.searchResultsTableView setRowHeight:800];
    [controller.searchResultsTableView setScrollEnabled:NO];
    return NO;
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    if (currentView==ADD_BOOK)
        _bookArray = [_bookManager getBooksFromGoogle:[searchBar text]];
    else
        _bookArray = [_bookManager getBooks:BORROW_A_BOOK andSearchText:[searchBar text]];
    
    [self.searchDisplayController setActive:NO];
    [self.tableView reloadData];

}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"bookSearchDetails"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Book *myBookDetail = [_bookArray objectAtIndex:indexPath.row];
        BookDetailTabController *bookDetailTabController = segue.destinationViewController;
        bookDetailTabController.bookDetail=myBookDetail;
        bookDetailTabController.bookReviews = [myBookDetail reviews];
        bookDetailTabController.currentView = currentView;
        
        if (currentView==ADD_BOOK)
        {
        //Hide Lenders & Reviews Tab
            NSMutableArray *viewControllers = [NSMutableArray arrayWithArray:bookDetailTabController.viewControllers];
            NSMutableIndexSet *indexes = [NSMutableIndexSet indexSetWithIndex:1];
            [indexes addIndex:2];
            [viewControllers removeObjectsAtIndexes:indexes];
        
            [bookDetailTabController setViewControllers:viewControllers];
        }
       
    }
}


@end
