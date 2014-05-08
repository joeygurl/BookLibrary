//
//  ViewController.h
//  MyBookLibrary
//
//  Created by Diorelle Ramos on 4/10/14.
//  Copyright (c) 2014 Diorelle Ramos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PasswordHelp : UIViewController
- (IBAction)OnClickReset:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtEmailAddress;
@end
