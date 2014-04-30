//
//  Reviews.m
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/29/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import "Reviews.h"
#import "BookDetailTabController.h"

#import "Models/Review.h"

@interface Reviews ()

@end

@implementation Reviews
NSMutableArray *_reviews;

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
    BookDetailTabController *bookDetailTabController = (BookDetailTabController *) self.tabBarController;
    _reviews = bookDetailTabController.bookReviews;

    
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
    return [_reviews count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    
    Review *review = nil;
    review = [_reviews objectAtIndex:indexPath.row];

    UILabel *userLabel = (UILabel *)[cell.contentView viewWithTag:1];
    userLabel.text = [NSString stringWithFormat:@"%@ %@",review.user.firstName, review.user.lastName];
    [userLabel autoresizesSubviews];
    
    UILabel *ratingLabel = (UILabel *)[cell.contentView viewWithTag:2];
    ratingLabel.text = [NSString stringWithFormat:@"%i/10",review.rating];
    [ratingLabel autoresizesSubviews];
    
    UILabel *commentLabel = (UILabel *)[cell.contentView viewWithTag:3];
    commentLabel.text = review.comment;
    [commentLabel autoresizesSubviews];
    
    
    return cell;
}


@end
