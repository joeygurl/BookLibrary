//
//  RegistrationViewController.m
//  MyBookLibrary
//
//  Created by Diorelle Ramos on 4/10/14.
//  Copyright (c) 2014 Diorelle Ramos. All rights reserved.
//

#import "Registration.h"
#import "Account.h"
#import "RESTHelpers/RESTService.h"

@interface Registration()

@end

@implementation Registration
@synthesize txtEmail, txtFirstname, txtLastname, txtPassword, txtCityState, txtConfirmPassword;

- (IBAction)CancelClicked:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)RegistrationClicked:(id)sender {
    
    UIAlertView *alert;
    
    if ([txtPassword.text isEqualToString:txtConfirmPassword.text] && [self areAllFieldsFilled]) {
    
        Account *account=[[Account alloc]init];
        User *user=[[User alloc]init];
        user.emailAddress= txtEmail.text;
        user.firstName=txtFirstname.text;
        user.lastName=txtLastname.text;
        user.cityState=txtCityState.text;
        user.password=txtPassword.text;
    
        BOOL regSucess = [account register:user];
        if (regSucess)
            [self dismissViewControllerAnimated:YES completion:nil];
        else
        {
            alert=[[UIAlertView alloc] initWithTitle:@"Registration" message:@"Registration failed, try again later." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
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
    if ([[txtCityState.text stringByTrimmingCharactersInSet:whiteSpace] length]>0 && [[txtConfirmPassword.text stringByTrimmingCharactersInSet:whiteSpace] length]>0 && [[txtEmail.text stringByTrimmingCharactersInSet:whiteSpace] length]>0 && [[txtFirstname.text stringByTrimmingCharactersInSet:whiteSpace] length]>0 && [[txtLastname.text stringByTrimmingCharactersInSet:whiteSpace] length]>0 && [[txtPassword.text stringByTrimmingCharactersInSet:whiteSpace] length]>0)
        return YES;
    else
        return NO;
}

- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return  YES;
}



@end
