//
//  MyBookDetails.m
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/14/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import "BookDetailTabController.h"
#import "BookDetails.h"

@implementation BookDetails
BOOL isMyBook;

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

-(void)configureView
{
    //Initialize Book Details
    BookDetailTabController *bookDetailTabController = (BookDetailTabController *) self.tabBarController;
    isMyBook = bookDetailTabController.isMyBook;
    self.titleLabel.text= bookDetailTabController.bookDetail.title;
    self.authorLabel.text= bookDetailTabController.bookDetail.author;
    
    //Initialize Add/Remove Button
    if (isMyBook)
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
    if(isMyBook)
        alert= [[UIAlertView alloc] initWithTitle:@"Confirmation" message:@"Book removed from library." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    else
        alert= [[UIAlertView alloc] initWithTitle:@"Confirmation" message:@"Book added to library." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];

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
