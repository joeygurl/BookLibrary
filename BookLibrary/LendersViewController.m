//
//  LendersViewController.m
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/29/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import "LendersViewController.h"
#import "BookDetailTabController.h"
#import "User.h"

@interface LendersViewController()
{
    NSMutableArray *_lenderArray;
    BookManager *_bookManager;
}
@end


@implementation LendersViewController
BOOL _isMyBook;

- (void)viewDidAppear:(BOOL)animated
{
   
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    BookDetailTabController *bookDetailTabController = (BookDetailTabController *) self.tabBarController;
    
    _bookManager = [[BookManager alloc] init];
    _lenderArray = [_bookManager getLenders: bookDetailTabController.bookDetail];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return [_lenderArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
     User *user = nil;
    if (_lenderArray != nil) {
        user = [_lenderArray objectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@,%@", user.lastName, user.firstName];
        cell.detailTextLabel.text = user.cityState;
    }
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

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
