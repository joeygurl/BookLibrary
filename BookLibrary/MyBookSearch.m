//
//  MyBookSearch.m
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/14/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import "MyBookSearch.h"

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
    
    [self initializeButtonIconsOnRightNavBar];
    
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
- (void)initializeButtonIconsOnRightNavBar
{

//    UIBarButtonItem	*searchBarButton = [[UIBarButtonItem alloc]
//                                        initWithTitle:@"Search"
//                                        style:UIBarButtonItemStylePlain
//                                        target:self
//                                        action:@selector(showSearchBar)];
//    
//    UIBarButtonItem	*addBarButton = [[UIBarButtonItem alloc]
//                                        initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:nil];
//    NSMutableArray *barButtons = [[NSMutableArray alloc] initWithCapacity:2];
//   [barButtons addObject:addBarButton];
//    
//    self.navigationItem.rightBarButtonItems = barButtons;
    
//    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
//    searchBar.showsCancelButton = false;
//    searchBar.delegate = self;
//    
//    UISearchDisplayController  *searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
//    searchDisplayController.delegate = self;
//    searchDisplayController.searchResultsDataSource = self;
//    searchDisplayController.searchResultsDelegate = nil;
//    
//    searchDisplayController.displaysSearchBarInNavigationBar = true;
    
    
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
