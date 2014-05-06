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
@property (weak, nonatomic) IBOutlet UILabel *registrationMessageLabel;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;

- (IBAction)handleRegister:(UIButton *)sender;
- (IBAction)handleContinue:(UIButton *)sender;

@end

@implementation Registration

- (IBAction)handleRegister:(UIButton *)sender {
    self.registrationMessageLabel.hidden = false;
    self.continueButton.hidden = false;
}

- (IBAction)handleContinue:(UIButton *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
- (IBAction)RegistrationClicked:(id)sender {
    
    
    Account *account=[[Account alloc]init];
    
    User *user=[[User alloc]init];
    
    user.emailAddress= _txtEmail.text;
    user.firstName=_txtFirstname.text;
    user.lastName=_txtLastname.text;
    user.cityState=_txtCityState.text;
    user.password=_txtPassword.text;
    
    
    [account register:user];

}

- (IBAction)backgroundTap:(id)sender {
     [self.view endEditing:YES];
}



@end
