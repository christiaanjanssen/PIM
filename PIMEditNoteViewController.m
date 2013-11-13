//
//  PIMEditNoteViewController.m
//  PIM
//
//  Created by Christiaan Janssen on 6/11/13.
//  Copyright (c) 2013 Janssen&Smets. All rights reserved.
//

#import "PIMEditNoteViewController.h"
#import "PIMDetailNoteViewController.h"

@interface PIMEditNoteViewController ()

@end

@implementation PIMEditNoteViewController

@synthesize editNote;
@synthesize txtTitle, txtContent;

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
    
    self.txtTitle.text = editNote.title;
    self.txtContent.text = editNote.content;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    editNote.title = [txtTitle text];
    editNote.content = [txtContent text];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1){
        [self performSegueWithIdentifier:@"deleteNote" sender:self];
    }
}

- (IBAction)doDelete:(id)sender
{
    UIAlertView *confirm = [[UIAlertView alloc] initWithTitle:@"Delete" message:@"delete this note?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Delete", nil];
    
    [confirm show];
}

@end
