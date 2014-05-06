//
//  LendersViewController.m
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/29/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import "LendersViewController.h"
#import "BookDetailTabController.h"


@implementation LendersViewController
BOOL _isMyBook;

- (void)viewDidAppear:(BOOL)animated
{
    [self configureView];
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

-(void) configureView
{
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
