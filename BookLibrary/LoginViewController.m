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

@synthesize txtEmail, txtPassword;

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
    UIAlertView *alert;
    if ([txtEmail.text isEqualToString:@""] && [txtPassword.text isEqualToString:@""])
    {
        alert=[[UIAlertView alloc] initWithTitle:@"" message:@"Please enter a username and password." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    else
    {
        Account *account=[[Account alloc]init];
        User *user=[[User alloc]init];
        user.emailAddress= txtEmail.text;
        user.password=txtPassword.text;
        BOOL loginSucess = [account signIn:user];
        if (loginSucess)
            [self performSegueWithIdentifier:@"loginSuccess" sender:self];
        else
        {
            alert=[[UIAlertView alloc] initWithTitle:@"" message:@"Please enter a valid username and password." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
    }
    
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
