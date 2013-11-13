//
//  PIMAddNoteViewController.m
//  PIM
//
//  Created by Christiaan Janssen on 6/11/13.
//  Copyright (c) 2013 Janssen&Smets. All rights reserved.
//

#import "PIMAddNoteViewController.h"
#import "PIMNoteListViewController.h"
#import "Note.h"

@interface PIMAddNoteViewController ()

@end

@implementation PIMAddNoteViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"addToList"]) {
        PIMNoteListViewController *dest = segue.destinationViewController;
        dest.addNote = [[Note alloc] initWithTitle:[txtTitle text] andContent:txtContent.text];
    }
}

@end
