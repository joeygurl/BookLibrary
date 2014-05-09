//
//  AccountSettings.m
//  BookLibrary
//
//  Created by Diorelle Ramos on 5/6/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import "AccountSettings.h"
#import "Account.h"
#import "User.h"

@interface AccountSettings ()

@end

@implementation AccountSettings
@synthesize txtConfirmPassword, txtPassword, txtEmailAddress, txtFirstName, txtLastName, txtCityState;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)configureView
{
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    txtEmailAddress.text = [defaults valueForKey:@"USERNAME"];
    txtFirstName.text = [defaults valueForKey:@"FIRST_NAME"];
    txtLastName.text = [defaults valueForKey:@"LAST_NAME"];
    txtCityState.text = [defaults valueForKey:@"CITY_STATE"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)BackgroundTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)Save:(id)sender {
    UIAlertView *alert;
    
    if ([txtPassword.text isEqualToString:txtConfirmPassword.text] && [self areAllFieldsFilled]) {
        
        Account *account=[[Account alloc]init];
        User *user=[[User alloc]init];
        user.emailAddress= txtEmailAddress.text;
        user.firstName=txtFirstName.text;
        user.lastName=txtLastName.text;
        user.cityState=txtCityState.text;
        user.password=txtPassword.text;
        
        BOOL updateSucess = [account updateProfile:user];
        if (updateSucess)
            [self dismissViewControllerAnimated:YES completion:nil];
        else
        {
            alert=[[UIAlertView alloc] initWithTitle:@"Profile Update" message:@"Profile update failed, try again later." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
    }
    else
    {
        
        alert=[[UIAlertView alloc] initWithTitle:@"" message:@"Please complete your entries and ensure that passwords match!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
    }

}

-(BOOL) areAllFieldsFilled
{
    NSCharacterSet *whiteSpace= [NSCharacterSet whitespaceAndNewlineCharacterSet];
    if ([[txtCityState.text stringByTrimmingCharactersInSet:whiteSpace] length]>0 && [[txtConfirmPassword.text stringByTrimmingCharactersInSet:whiteSpace] length]>0 && [[txtEmailAddress.text stringByTrimmingCharactersInSet:whiteSpace] length]>0 && [[txtFirstName.text stringByTrimmingCharactersInSet:whiteSpace] length]>0 && [[txtLastName.text stringByTrimmingCharactersInSet:whiteSpace] length]>0 && [[txtPassword.text stringByTrimmingCharactersInSet:whiteSpace] length]>0)
        return YES;
    else
        return NO;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return  YES;
}

@end
