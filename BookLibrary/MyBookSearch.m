//
//  MyBookSearch.m
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/14/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import "MyBookSearch.h"
#import "BookDetails.h"
#import "BookDetailTabController.h"

@interface MyBookSearch ()
{
    NSMutableArray *_myBookArray;
}

- (void) initializeButtonIconsOnRightNavBar;
- (void) initializeBookList;
@end

@implementation MyBookSearch
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
    
    [self initializeBookList];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initializeBookList
{
    Book *book1 = [[Book alloc] init];
    book1.title = @"The Hunger Games";
    book1.author = @"Suzanne Collins";
    
    Book *book2 = [[Book alloc] init];
    book2.title = @"White Belts";
    book2.author = @"DeLeon Demicoli";
    
    _myBookArray = [[NSMutableArray alloc] init];
    [_myBookArray addObject:book1];
    [_myBookArray addObject:book2];
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
    if (tableView == self.searchDisplayController.searchResultsTableView)
        return [filteredBookArray count];
    else
        return [_myBookArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }

  
    Book *book = nil;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        book = [filteredBookArray objectAtIndex:indexPath.row];
    } else {
        book = [_myBookArray objectAtIndex:indexPath.row];
    }
    
    cell.textLabel.text = book.title;
    cell.detailTextLabel.text = book.author;

    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate;
    if ([scope  isEqual: @"Title"])
        resultPredicate = [NSPredicate predicateWithFormat:@"title contains[c] %@", searchText];
    else
        resultPredicate = [NSPredicate predicateWithFormat:@"author contains[c] %@", searchText];
    
    filteredBookArray = [ _myBookArray filteredArrayUsingPredicate:resultPredicate];
}


-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"myBookDetails"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Book *myBookDetail = [_myBookArray objectAtIndex:indexPath.row];
        BookDetailTabController *bookDetailTabController = segue.destinationViewController;
        bookDetailTabController.bookDetail=myBookDetail;
        bookDetailTabController.isMyBook = YES;
    }
}

-(IBAction)unwindMyBookSearchController:(UIStoryboardSegue *)unwindSegue {}


@end
