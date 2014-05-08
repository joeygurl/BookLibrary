//
//  AddReview.h
//  BookLibrary
//
//  Created by Diorelle Ramos on 5/8/14.
//  Copyright (c) 2014 Appy Days. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book.h"
@interface AddReview : UIViewController<UITextFieldDelegate>

- (IBAction)save:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *rating;

@property (weak, nonatomic) IBOutlet UITextView *comments;


@property Book *book;

- (IBAction)BackgroundTap:(id)sender;
@end
