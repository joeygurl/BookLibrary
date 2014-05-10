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
BookState _currentView;
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
    _currentView = bookDetailTabController.currentView;
    _book = bookDetailTabController.bookDetail;
    self.titleLabel.text= bookDetailTabController.bookDetail.title;
    self.authorLabel.text= bookDetailTabController.bookDetail.author;
    self.genreLabel.text=bookDetailTabController.bookDetail.genres;
   
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM/dd/yyyy"];
    
    switch (_currentView) {
        case ADD_BOOK:
        {
            [self setControlVisibility:YES ul:YES dlc:YES dl:YES tb:NO bb:YES];
            [self.topButton setTitle:@"Add" forState:UIControlStateNormal];
            break;
        }
        case MY_BOOKS:
        {
            [self setControlVisibility:YES ul:YES dlc:YES dl:YES tb:NO bb:YES];
            [self.topButton setTitle:@"Remove" forState:UIControlStateNormal];
            break;
        }
        case LOANED_BOOKS:
        {
            [self setControlVisibility:NO ul:NO dlc:NO dl:NO tb:NO bb:YES];
            [self.topButton setTitle:@"Mark Returned" forState:UIControlStateNormal];
            [self.userLabelCaption setText:@"Loaned To:"];
            [self.userLabel  setText:[NSString stringWithFormat:@"%@ %@",bookDetailTabController.bookDetail.loanDetail.borrower.firstName, bookDetailTabController.bookDetail.loanDetail.borrower.lastName]];
            
            [self.dateLabelCaption setText:@"Loaned On:"];
            [self.userLabel  setText:[NSString stringWithFormat:@"%@ %@",bookDetailTabController.bookDetail.loanDetail.borrower.firstName, bookDetailTabController.bookDetail.loanDetail.borrower.lastName]];
            
            break;
        }
        case BORROWED_BOOKS:
        {
            [self setControlVisibility:NO ul:NO dlc:NO dl:NO tb:YES bb:YES];
            [self.userLabelCaption setText:@"Borrowed From:"];
            [self.userLabel  setText:[NSString stringWithFormat:@"%@ %@",bookDetailTabController.bookDetail.lender.firstName, bookDetailTabController.bookDetail.lender.lastName]];
            [self.dateLabelCaption setText:@"Borrowed On:"];
            [self.dateLabel setText:[formatter stringFromDate:bookDetailTabController.bookDetail.loanDetail.lentDate]];
        }
            break;
        case PENDING_REQUEST_BOOKS:
        {
            [self setControlVisibility:NO ul:NO dlc:NO dl:NO tb:NO bb:NO];
            [self.userLabelCaption setText:@"Requested By:"];
            [self.userLabel  setText:[NSString stringWithFormat:@"%@ %@",bookDetailTabController.bookDetail.loanDetail.borrower.firstName, bookDetailTabController.bookDetail.loanDetail.borrower.lastName]];
            
            [self.dateLabelCaption setText:@"Requested On:"];
            
            [self.dateLabel setText:[formatter stringFromDate:bookDetailTabController.bookDetail.loanDetail.requestedDate]];
            
            [self.topButton setTitle:@"Lend" forState:UIControlStateNormal];
            [self.bottomButton setTitle:@"Deny" forState:UIControlStateNormal];
            break;
        }
        case BORROW_A_BOOK:
        {
            [self setControlVisibility:YES ul:YES dlc:YES dl:YES tb:YES bb:YES];
            break;
        }
        default:
            break;
    }
    
}

-(void)setControlVisibility:(BOOL) ulc ul:(BOOL)ul dlc:(BOOL)dlc dl:(BOOL)dl tb:(BOOL)tb bb:(BOOL)bb
{
    self.userLabelCaption.hidden = ulc;
    self.userLabel.hidden = ul;
    self.dateLabelCaption.hidden = dlc;
    self.dateLabel.hidden = dl;
    self.topButton.hidden = tb;
    self.bottomButton.hidden= bb;
}

- (IBAction)topButtonHandler {
    UIAlertView *alert;
    BookManager *bookManager = [[BookManager alloc]init];
    switch (_currentView) {
        case ADD_BOOK:
            //Add book to my books
            [bookManager add:_book];
            alert= [[UIAlertView alloc] initWithTitle:@"Confirmation" message:@"Book added to library." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            break;
        case MY_BOOKS:
            //Remove book from my books
            [bookManager remove:_book];
            alert= [[UIAlertView alloc] initWithTitle:@"Confirmation" message:@"Book removed from library." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            break;
        case LOANED_BOOKS:
            //Add book to my books
            [bookManager markReturned:_book];
            alert= [[UIAlertView alloc] initWithTitle:@"Confirmation" message:@"Book returned to library." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];

            break;
         case PENDING_REQUEST_BOOKS:
            [bookManager approveLoan:_book];
            alert= [[UIAlertView alloc] initWithTitle:@"Confirmation" message:@"Book loan request approved." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            break;
        default:
            break;
    }
   
    [alert show];
    
}

- (IBAction)bottomButtonHandler {
    UIAlertView *alert;
    BookManager *bookManager = [[BookManager alloc]init];
    [bookManager denyLoan:_book];
    alert= [[UIAlertView alloc] initWithTitle:@"Confirmation" message:@"Book loan request denied." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
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
