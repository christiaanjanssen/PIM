//
//  PIMAddContactViewController.m
//  PIM
//
//  Created by Jeffrey on 03/11/13.
//  Copyright (c) 2013 Janssen&Smets. All rights reserved.
//

#import "PIMAddContactViewController.h"
#import "PIMContactListViewController.h"
#import "Contact.h"

@interface PIMAddContactViewController ()

@end

@implementation PIMAddContactViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"addToList"]){
        PIMContactListViewController *dest = segue.destinationViewController;
        dest.addContact = [[Contact alloc] initWithFirstName:self.txtFirst.text andLastName:self.txtLast.text andCompany:self.txtCompany.text andTel:self.txtTel.text];
    }
}

@end
