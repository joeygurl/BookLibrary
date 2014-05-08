//
//  MyBookDetailsTab.m
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/28/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import "BookDetailTabController.h"
#import "AddReview.h"

@implementation BookDetailTabController
@synthesize bookDetail;

-(void)viewDidLoad
{
    if (self.currentView==ADD_BOOK)
    {
        self.navigationItem.rightBarButtonItem = nil;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"review"]) {
        AddReview *reviewController = segue.destinationViewController;
        reviewController.book = bookDetail;
       
        
    }
}

@end
