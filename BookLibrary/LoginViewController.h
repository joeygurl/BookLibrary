//
//  LoginViewController.h
//  BookLibrary
//
//  Created by Aditi Yagnik on 4/19/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
- (IBAction)SignInClick:(id)sender;
- (IBAction)BackgroundTap:(id)sender;

@end
