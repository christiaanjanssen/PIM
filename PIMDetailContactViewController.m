//
//  PIMDetailContactViewController.m
//  PIM
//
//  Created by Jeffrey on 02/11/13.
//  Copyright (c) 2013 Janssen&Smets. All rights reserved.
//

#import "PIMDetailContactViewController.h"
#import "PIMContactListViewController.h"
#import "PIMEditContactViewController.h"

@interface PIMDetailContactViewController ()

@end

@implementation PIMDetailContactViewController

@synthesize lblFirstName, lblLastName, lblCompany, lblTel;
@synthesize inContact;

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
	lblFirstName.text = [inContact firstName];
    lblLastName.text = [inContact lastName];
    lblCompany.text = [inContact company];
    lblTel.text = [inContact tel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"toEditSegue"]){
        PIMEditContactViewController *dest = segue.destinationViewController;
        dest.editContact = inContact;
    }
}

- (IBAction)unwindToDetails:(UIStoryboardSegue *)unwindSegue
{
    lblFirstName.text = [inContact firstName];
    lblLastName.text = [inContact lastName];
    lblCompany.text = [inContact company];
    lblTel.text = [inContact tel];
}

@end
