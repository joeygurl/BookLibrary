//
//  LenderDetails.m
//  BookLibrary
//
//  Created by Diorelle Ramos on 5/9/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import "LenderDetails.h"
#import "BookManager.h"

@interface LenderDetails ()
{
    BookManager *_bookManager;
}
@end

@implementation LenderDetails
@synthesize bookDetail;
@synthesize bookTItle, author, owner, distance, status;

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
    [self configureView];
    
    // Do any additional setup after loading the view.
}

-(void)configureView
{
    bookTItle.text = bookDetail.title;
    author.text = bookDetail.author;
    distance.text = bookDetail.lender.cityState;
    owner.text = [NSString stringWithFormat:@"%@ %@",bookDetail.lender.firstName, bookDetail.lender.lastName];
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

- (IBAction)requestToBorrow:(id)sender {
    NSString *requestLoanResponse =  [_bookManager requestLoan:bookDetail];
    UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Confirmation" message:requestLoanResponse delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}
@end
