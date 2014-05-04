//
//  MyBookDetails.m
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/14/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import "BookDetailTabController.h"
#import "BookDetails.h"
#import "RESTHelpers/BookManager.h"

@implementation BookDetails
BOOL _isMyBook;
Book *_book;

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

-(void)configureView
{
    //Initialize Book Details
    BookDetailTabController *bookDetailTabController = (BookDetailTabController *) self.tabBarController;
    _isMyBook = bookDetailTabController.isMyBook;
    _book = bookDetailTabController.bookDetail;
    self.titleLabel.text= bookDetailTabController.bookDetail.title;
    self.authorLabel.text= bookDetailTabController.bookDetail.author;
    self.genreLabel.text=bookDetailTabController.bookDetail.genres;
    
    //Initialize Add/Remove Button
    if (_isMyBook)
    {
        
        [self.addRemoveButton setTitle:@"Remove" forState:UIControlStateNormal];
        self.rateButton.hidden = NO;
    }
    else
    {
        [self.addRemoveButton setTitle:@"Add" forState:UIControlStateNormal];
        self.rateButton.hidden = YES;
        
    }
        
 
}

- (IBAction)addRemoveBook {
    UIAlertView *alert;
    BookManager *bookManager = [[BookManager alloc]init];
    if(_isMyBook)
    {
        //Remove book from my books
        //[bookManager remove:_book];
        alert= [[UIAlertView alloc] initWithTitle:@"Confirmation" message:@"Book removed from library." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    }
    else
    {
        //Add book to my books
        //[bookManager add:_book];
        alert= [[UIAlertView alloc] initWithTitle:@"Confirmation" message:@"Book added to library." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    }

    [alert show];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == alertView.cancelButtonIndex)
    {
        [self performSegueWithIdentifier:@"unwindMyBookSearchController" sender:self];
    }
        
}


@end
