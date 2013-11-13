//
//  PIMDetailNoteViewController.h
//  PIM
//
//  Created by Christiaan Janssen on 6/11/13.
//  Copyright (c) 2013 Janssen&Smets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"

@interface PIMDetailNoteViewController : UIViewController

@property (nonatomic, strong) Note *inNote;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UITextView *lblContent;

- (IBAction)share:(id)sender;


@end
