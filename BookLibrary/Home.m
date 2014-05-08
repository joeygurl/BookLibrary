//
//  HomeViewController.m
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/12/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import "Home.h"
#import "BookSearch.h"
#import "BookManager.h"

@interface Home (){

}

@end

@implementation Home



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
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"borrow"]) {
        BookSearch *bookSearch = segue.destinationViewController;
        bookSearch.currentView = BORROW_A_BOOK;
        
    }
}


@end
