//
//  PIMDetailContactViewController.h
//  PIM
//
//  Created by Jeffrey on 02/11/13.
//  Copyright (c) 2013 Janssen&Smets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"

@interface PIMDetailContactViewController : UIViewController

@property (nonatomic, strong) Contact *inContact;
@property (weak, nonatomic) IBOutlet UILabel *lblFirstName;
@property (weak, nonatomic) IBOutlet UILabel *lblLastName;
@property (weak, nonatomic) IBOutlet UILabel *lblCompany;
@property (weak, nonatomic) IBOutlet UITextView *lblTel;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;

- (IBAction)share:(id)sender;

@end
