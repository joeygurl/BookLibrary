//
//  MyLibraryViewController.m
//  BookLibrary
//
//  Created by Aditi Yagnik on 4/13/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import "MyLibrary.h"
#import "BookSearch.h"
#import "MyBookSearch.h"
#import "RESTHelpers/BookManager.h"

@interface MyLibrary ()

@end

@implementation MyLibrary

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MyBookSearch *myBookSearch = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"my"]) {
        myBookSearch.bookState = MY_BOOKS;
    }
    else if ([segue.identifier isEqualToString:@"loaned"]){
        myBookSearch.bookState = LOANED_BOOKS;
    }
    else if ([segue.identifier isEqualToString:@"borrowed"]){
        myBookSearch.bookState = BORROWED_BOOKS;
    }
    else if ([segue.identifier isEqualToString:@"pending"]){
        myBookSearch.bookState = PENDING_REQUEST_BOOKS;
    }
    else if ([segue.identifier isEqualToString:@"addBook"]){
        BookSearch *bookSearch = segue.destinationViewController;
        bookSearch.currentView = ADD_BOOK;
    }
    
   
}

@end
