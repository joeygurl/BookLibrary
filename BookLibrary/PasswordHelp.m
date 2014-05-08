//
//  ViewController.m
//  MyBookLibrary
//
//  Created by Diorelle Ramos on 4/10/14.
//  Copyright (c) 2014 Diorelle Ramos. All rights reserved.
//
#import "Account.h"
#import "RESTHelpers/RESTService.h"
#import "PasswordHelp.h"


@interface PasswordHelp ()
@property (weak, nonatomic) IBOutlet UIButton *continueButton;
@property (weak, nonatomic) IBOutlet UIButton *resetPasswordButton;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UILabel *checkEmailLabel;

- (IBAction)handleContinue:(UIButton *)sender;
- (IBAction)handleReset:(UIButton *)sender;

@end

@implementation PasswordHelp

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleContinue:(UIButton *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)handleReset:(UIButton *)sender {
    self.resetPasswordButton.hidden=true;
    self.emailTextField.hidden = true;
    self.continueButton.hidden = false;
    self.checkEmailLabel.hidden = false;
}
- (IBAction)OnClickReset:(id)sender {
    
        UIAlertView *alert;
        if ([_txtEmailAddress.text isEqualToString:@""])
        {
            alert=[[UIAlertView alloc] initWithTitle:@"" message:@"Please enter an email address." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
        else
        {
            Account *account=[[Account alloc]init];
            User *user=[[User alloc]init];
            user.emailAddress= _txtEmailAddress.text;
           //call rest function in Account.h
            //Add if/else for success/failure returned by the reset function
        }
    

}
@end

