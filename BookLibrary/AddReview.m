//
//  AddReview.m
//  BookLibrary
//
//  Created by Diorelle Ramos on 5/8/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import "AddReview.h"
#import "BookManager.h"
#import "BookDetailTabController.h"

@interface AddReview ()
{
    BookManager *_bookManager;
}
@end


@implementation AddReview
@synthesize book, rating, comments;

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
    _bookManager = [[BookManager alloc]init];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)save:(id)sender {
    book.rating = [rating.text integerValue];
    book.review = comments.text;
    NSString *reviewResponse = [_bookManager addReview:book];
    
    UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Confirmation" message:reviewResponse delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (IBAction)BackgroundTap:(id)sender {
    [self.view endEditing:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return  YES;
}

@end
