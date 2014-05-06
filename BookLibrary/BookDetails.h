//
//  MyBookDetails.h
//  BookLibrary
//
//  Created by Diorelle Ramos on 4/14/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book.h"

@interface BookDetails : UIViewController<UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *genreLabel;

@property (strong, nonatomic) IBOutlet UIButton *addRemoveButton;
@property (weak, nonatomic) IBOutlet UIButton *rateButton;

- (IBAction)addRemoveBook;
@end
