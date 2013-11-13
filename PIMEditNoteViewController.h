//
//  PIMEditNoteViewController.h
//  PIM
//
//  Created by Christiaan Janssen on 6/11/13.
//  Copyright (c) 2013 Janssen&Smets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"

@interface PIMEditNoteViewController : UIViewController <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtTitle;
@property (weak, nonatomic) IBOutlet UITextView *txtContent;
@property (strong, nonatomic) Note *editNote;

- (IBAction)doDelete:(id)sender;

@end
