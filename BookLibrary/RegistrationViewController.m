//
//  RegistrationViewController.m
//  MyBookLibrary
//
//  Created by Diorelle Ramos on 4/10/14.
//  Copyright (c) 2014 Diorelle Ramos. All rights reserved.
//

#import "RegistrationViewController.h"

@interface RegistrationViewController()
@property (weak, nonatomic) IBOutlet UILabel *registrationMessageLabel;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;

- (IBAction)handleRegister:(UIButton *)sender;
- (IBAction)handleContinue:(UIButton *)sender;

@end

@implementation RegistrationViewController

- (IBAction)handleRegister:(UIButton *)sender {
    self.registrationMessageLabel.hidden = false;
    self.continueButton.hidden = false;
}

- (IBAction)handleContinue:(UIButton *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
@end
