//
//  LoginViewController.m
//  BookLibrary
//
//  Created by Aditi Yagnik on 4/19/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import "Account.h"
#import "RESTHelpers/RESTService.h"
#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)SignInClick:(id)sender {
    Account *account=[[Account alloc]init];
    
    User *user=[[User alloc]init];
    user.emailAddress= _txtEmail;
    user.password=_txtPassword;
    [account signIn:user];
    
}

- (IBAction)BackgroundTap:(id)sender {
    [self.view endEditing:YES];
}





@end
