//
//  AccountSettings.m
//  BookLibrary
//
//  Created by Bret Hassler on 5/5/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import "AccountSettings.h"

@interface AccountSettings ()

@property (strong, nonatomic) IBOutlet UITextField *oldPwTextField;
@property (strong, nonatomic) IBOutlet UITextField *nwPwTextField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPwTextField;

@end

@implementation AccountSettings

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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SaveClicked:(id)sender {
    if((self.oldPwTextField.text == NULL || self.oldPwTextField.text.length==0) && ![self.oldPwTextField.text isEqualToString:self.oldPwTextField.text]){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Old password is incorrect"
                                                       delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        [alert show];
        
    }
    else if(self.nwPwTextField.text == NULL || self.nwPwTextField.text.length==0){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Password Cannot Be Blank"
                                                       delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        [alert show];
        
    }
    else if(![self.nwPwTextField.text isEqualToString:self.confirmPwTextField.text]){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Passwords must match"
                                                       delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        [alert show];
        
    }
    else
    {
        
    }
}


@end
