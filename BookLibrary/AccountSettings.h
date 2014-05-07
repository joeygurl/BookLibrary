//
//  AccountSettings.h
//  BookLibrary
//
//  Created by Diorelle Ramos on 5/6/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountSettings : UITableViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtEmailAddress;

@property (weak, nonatomic) IBOutlet UITextField *txtFirstName;

@property (weak, nonatomic) IBOutlet UITextField *txtLastName;

@property (weak, nonatomic) IBOutlet UITextField *txtCityState;

@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

@property (weak, nonatomic) IBOutlet UITextField *txtConfirmPassword;


- (IBAction)BackgroundTap:(id)sender;

- (IBAction)Save:(id)sender;

@end
