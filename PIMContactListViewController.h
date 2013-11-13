//
//  PIMContactListViewController.h
//  PIM
//
//  Created by Jeffrey on 02/11/13.
//  Copyright (c) 2013 Janssen&Smets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"

@interface PIMContactListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property NSMutableArray* contacts;
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) Contact *addContact;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnEdit;

- (IBAction)editList:(id)sender;

@end
