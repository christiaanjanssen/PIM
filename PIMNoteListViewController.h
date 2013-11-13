//
//  PIMNoteListViewController.h
//  PIM
//
//  Created by Christiaan Janssen on 6/11/13.
//  Copyright (c) 2013 Janssen&Smets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"

@interface PIMNoteListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property NSMutableArray* notes;
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) Note *addNote;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnEdit;

- (IBAction)editList:(id)sender;

@end
