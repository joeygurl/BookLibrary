//
//  RegistrationViewController.h
//  MyBookLibrary
//
//  Created by Diorelle Ramos on 4/10/14.
//  Copyright (c) 2014 Diorelle Ramos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Registration : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtFirstname;
@property (weak, nonatomic) IBOutlet UITextField *txtLastname;
@property (weak, nonatomic) IBOutlet UITextField *txtCityState;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
- (IBAction)RegistrationClicked:(id)sender;
- (IBAction)backgroundTap:(id)sender;


@end
