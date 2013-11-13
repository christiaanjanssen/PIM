//
//  PIMDetailNoteViewController.m
//  PIM
//
//  Created by Christiaan Janssen on 6/11/13.
//  Copyright (c) 2013 Janssen&Smets. All rights reserved.
//

#import "PIMDetailNoteViewController.h"
#import "PIMNoteListViewController.h"
#import "PIMEditNoteViewController.h"

@interface PIMDetailNoteViewController ()

@end

@implementation PIMDetailNoteViewController

@synthesize lblTitle, lblContent;
@synthesize inNote;

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
    
    // Load the note into the corresponding labels
    lblTitle.text = [inNote title];
    lblContent.text = [inNote content];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindToDetailsNotes:(UIStoryboardSegue *)unwindSegue
{
    lblTitle.text = [inNote title];
    lblContent.text = [inNote content];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"toEditSegue"]){
        PIMEditNoteViewController *dest = segue.destinationViewController;
        dest.editNote = inNote;
    }
}

@end
