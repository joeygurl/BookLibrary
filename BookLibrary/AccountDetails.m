//
//  AccountDetails.m
//  BookLibrary
//
//  Created by Bret Hassler on 5/5/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import "AccountDetails.h"

@interface AccountDetails ()

@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UITextField *city;
@property (strong, nonatomic) IBOutlet UIPickerView *statePicker;
@property (strong, nonatomic) IBOutlet UILabel *stateLabel;


@property (strong, nonatomic) IBOutlet UIButton *doneButton;

@property (strong, nonatomic) UITapGestureRecognizer *tapGestureRecognizer;
@property (nonatomic, strong) NSArray *states;


- (IBAction)cancelButton:(id)sender;
- (IBAction)textFieldDidEndEditing:(id)sender;
- (IBAction)stateOutOfFocus;
- (void)stateOnFocus;

@end

@implementation AccountDetails

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    /*
    _states = [[NSArray alloc] initWithObjects:@"AK",@"AL",@"AR",@"AZ",@"CA",@"CO",@"CT",@"DE",@"FL",@"GA",@"HI",@"IA",@"ID",@"IL",@"IN",@"KS",@"KY",@"LA",@"MA",@"MD",@"ME",@"MI",@"MN",@"MO",@"MT",@"NC",@"ND",@"NE",@"NH",@"NY",@"NM",@"NV",@"OH",@"OK",@"OR",@"PA",@"RI",@"SC",@"SD",@"TN",@"TX",@"UT",@"VA",@"VT",@"WA",@"WI",@"WV",@"WY", nil];
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(stateOnFocus)];
    [self.stateLabel addGestureRecognizer:self.tapGestureRecognizer];
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)SaveClicked:(id)sender {
    if(self.email.text == NULL || self.email.text.length==0){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Email Cannot Be Blank"
                                                       delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        [alert show];
        
    }
    else if(self.firstName.text == NULL || self.firstName.text.length==0 || self.lastName.text == NULL || self.lastName.text.length==0){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Name Cannot Be Blank"
                                                       delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        [alert show];
        
    }
    else if(self.city.text == NULL || self.city.text.length==0){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"City Cannot Be Blank"
                                                       delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        [alert show];
        
    }
    else
    {
        
    }
}


/*

 
 #pragma mark - Table view data source
 
 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
 {
 #warning Potentially incomplete method implementation.
 // Return the number of sections.
 return 2;
 }
 
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
 {
 #warning Incomplete method implementation.
 // Return the number of rows in the section.
 return 2;
 }

 
#pragma mark - Implementing methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_states count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_states objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    self.stateLabel.text =[_states objectAtIndex:row];
}
#pragma mark - End Implementing methods





- (IBAction)cancelButton:(id)sender {
    
    [self.delegate accountDetailsCancel];
}

- (IBAction)textFieldDidEndEditing:(id)sender {
    [sender resignFirstResponder];
}

- (void)stateOnFocus {
    
    if (self.statePicker.hidden)
        self.statePicker.hidden=NO;
    else
        
        self.statePicker.hidden=YES;
    
    self.doneButton.hidden = self.statePicker.hidden;
    [self.view endEditing:YES];
}

- (IBAction)stateOutOfFocus {
    
    if(self.statePicker.hidden==NO)
    {
        self.statePicker.hidden=YES;
        self.doneButton.hidden = self.statePicker.hidden;
    }
}
 */
 
@end
