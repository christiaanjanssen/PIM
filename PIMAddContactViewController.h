//
//  PIMAddContactViewController.h
//  PIM
//
//  Created by Jeffrey on 03/11/13.
//  Copyright (c) 2013 Janssen&Smets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface PIMAddContactViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtFirst;
@property (weak, nonatomic) IBOutlet UITextField *txtLast;
@property (weak, nonatomic) IBOutlet UITextField *txtCompany;
@property (weak, nonatomic) IBOutlet UITextField *txtTel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) UITextField *activeField;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
- (IBAction)textFieldDoneEditing:(id)sender;



@end
