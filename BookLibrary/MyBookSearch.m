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
#import "RESTHelpers/BookManager.h"

#import "Book.h"
#import "Review.h"

@interface MyBookSearch ()
{
    NSMutableArray *_myBookArray;
    BookManager *_bookManager;
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
    
    [self setViewLabel];
    _myBookArray = [_bookManager getBooks: [self bookState]];
    
    //[self initializeBookList];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setViewLabel
{
    switch([self bookState])
    {
        case MY_BOOKS:
            self.navigationItem.title=@"My Books";
            break;
        case LOANED_BOOKS:
            self.navigationItem.title=@"Loaned Books";
            break;
        case BORROWED_BOOKS:
            self.navigationItem.title=@"Borrowed Books";
            break;
        case PENDING_REQUEST_BOOKS:
            self.navigationItem.title=@"Pending Request";
            break;
        default:
            self.navigationItem.title=@"My Books";
            break;
            
    }
}

- (void) initializeBookList
{
    Book *book1 = [[Book alloc] init];
    book1.title = @"The Hunger Games";
    book1.author = @"Suzanne Collins";
    
    Review *review1 = [[Review alloc] init];
    review1.rating = 10;
    review1.comment = @"This book is the bestest!";
    review1.user = [[User alloc] init];
    review1.user.firstName =  @"John";
    review1.user.lastName = @"Doe";
    
    Review *review2 = [[Review alloc] init];
    review2.rating = 9;
    review2.comment = @"This book is gggggreaaatttt!";
    review2.user = [[User alloc] init];
    review2.user.firstName =  @"Tony";
    review2.user.lastName = @"Tiger";
    
    NSMutableArray *reviewArray = [[NSMutableArray alloc]init];
    [reviewArray addObject:review1];
    [reviewArray addObject:review2];
    
    book1.reviews = [[NSMutableArray alloc] init];
    [book1.reviews addObjectsFromArray:reviewArray];
    
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
        bookDetailTabController.bookReviews = [myBookDetail reviews];
        bookDetailTabController.isMyBook = YES;
       
        //Hide Lenders Tab
        NSMutableArray *viewControllers = [NSMutableArray arrayWithArray:bookDetailTabController.viewControllers];
        [viewControllers removeObjectAtIndex:1];
        [bookDetailTabController setViewControllers:viewControllers];
    }
}

-(IBAction)unwindMyBookSearchController:(UIStoryboardSegue *)unwindSegue {}


@end
