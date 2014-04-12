//
//  ViewController.m
//  MyBookLibrary
//
//  Created by Diorelle Ramos on 4/10/14.
//  Copyright (c) 2014 Diorelle Ramos. All rights reserved.
//

#import "PasswordHelpViewController.h"

@interface PasswordHelpViewController ()
@property (weak, nonatomic) IBOutlet UIButton *continueButton;
@property (weak, nonatomic) IBOutlet UIButton *resetPasswordButton;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UILabel *checkEmailLabel;

- (IBAction)handleContinue:(UIButton *)sender;
- (IBAction)handleReset:(UIButton *)sender;

@end

@implementation PasswordHelpViewController

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
@end
