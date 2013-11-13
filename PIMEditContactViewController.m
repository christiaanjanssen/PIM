//
//  PIMEditContactViewController.m
//  PIM
//
//  Created by Jeffrey on 03/11/13.
//  Copyright (c) 2013 Janssen&Smets. All rights reserved.
//

#import "PIMEditContactViewController.h"
#import "PIMDetailContactViewController.h"

@interface PIMEditContactViewController ()

@end

@implementation PIMEditContactViewController

@synthesize editContact;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.txtFirst.text = editContact.firstName;
    self.txtLast.text = editContact.lastName;
    self.txtCompany.text = editContact.company;
    self.txtTel.text = editContact.tel;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    editContact.firstName = self.txtFirst.text;
    editContact.lastName = self.txtLast.text;
    editContact.company = self.txtCompany.text;
    editContact.tel = self.txtTel.text;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1){
        [self performSegueWithIdentifier:@"deleteContact" sender:self];
    }
}

- (IBAction)doDelete:(id)sender
{
    UIAlertView *confirm = [[UIAlertView alloc] initWithTitle:@"Delete" message:@"delete this contact?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Delete", nil];
    
    [confirm show];
}

@end
