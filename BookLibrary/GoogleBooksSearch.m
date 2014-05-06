//
//  GoogleBooksSearch.m
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/14/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import "GoogleBooksSearch.h"
#import "BookDetailTabController.h"

@interface GoogleBooksSearch ()
{
    NSMutableArray *_bookArray;
    BookManager *_bookManager;
}
@end

@implementation GoogleBooksSearch
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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //_bookArray = [[NSMutableArray alloc] initWithObjects: @"Book1", @"Book2",nil];
    _bookManager = [[BookManager alloc] init];
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

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    //[self dismissViewControllerAnimated:true completion:nil];
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
    //if (tableView == self.searchDisplayController.searchResultsTableView && _bookArray != nil) {
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
    _bookArray = [_bookManager getBooksFromGoogle:[searchBar text]];
    [self.searchDisplayController setActive:NO];
    [self.tableView reloadData];

}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


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
        bookDetailTabController.currentView = ADD_BOOK;
        
        //Hide Lenders & Reviews Tab
        NSMutableArray *viewControllers = [NSMutableArray arrayWithArray:bookDetailTabController.viewControllers];
        NSMutableIndexSet *indexes = [NSMutableIndexSet indexSetWithIndex:1];
        [indexes addIndex:2];
        [viewControllers removeObjectsAtIndexes:indexes];
        
        [bookDetailTabController setViewControllers:viewControllers];
       
    }
}


@end
