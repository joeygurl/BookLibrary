//
//  LenderDetails.h
//  BookLibrary
//
//  Created by Diorelle Ramos on 5/9/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book.h"
@interface LenderDetails : UIViewController

@property (strong, nonatomic) Book *bookDetail;

@property (weak, nonatomic) IBOutlet UILabel *bookTItle;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *owner;
@property (weak, nonatomic) IBOutlet UILabel *distance;

@property (weak, nonatomic) IBOutlet UILabel *status;
- (IBAction)requestToBorrow:(id)sender;

@end
