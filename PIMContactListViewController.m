//
//  PIMContactListViewController.m
//  PIM
//
//  Created by Jeffrey on 02/11/13.
//  Copyright (c) 2013 Janssen&Smets. All rights reserved.
//

#import "PIMContactListViewController.h"
#import "Contact.h"
#import "PIMDetailContactViewController.h"
#import "ImageReader.h"

@interface PIMContactListViewController ()

@end

@implementation PIMContactListViewController
{
    NSInteger editRow;
}

@synthesize addContact;

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
    
    // Load the saved list.
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"contacts"];
    NSArray *tmp = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    self.contacts = [[NSMutableArray alloc] initWithArray:tmp];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contacts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *contactId = @"contactCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:contactId];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:contactId];
    }
    
    cell.textLabel.text = [[self.contacts objectAtIndex:indexPath.row] fullName];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showContactDetails"]){
        NSIndexPath *indexPath = [self.tableview indexPathForSelectedRow];
        PIMDetailContactViewController *dest = segue.destinationViewController;
        editRow = indexPath.row;
        dest.inContact = [self.contacts objectAtIndex:editRow];
    }
}

- (IBAction)unwindToList:(UIStoryboardSegue *)unwindSegue
{
    [self.tableview reloadData];
    [self saveContacts];
}

- (IBAction)unwindToListCancel:(UIStoryboardSegue *)unwindSegue
{
}

- (IBAction)unwindAndDeleteToList:(UIStoryboardSegue *)unwindSegue
{
    Contact *toDel = [self.contacts objectAtIndex:editRow];
    if(toDel.image != nil){
        [ImageReader DeleteImage:toDel.image];
    }
    [self.contacts removeObjectAtIndex:editRow];
    [self.tableview reloadData];
    [self saveContacts];
}

- (IBAction)unWindAndAdd:(UIStoryboardSegue *)unwindSegue
{
    [self.contacts addObject:addContact];
    [self.tableview reloadData];
    [self saveContacts];
}

- (void)saveContacts
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.contacts];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"contacts"];
}

- (IBAction)editList:(id)sender
{
    if ([self.tableview isEditing]) {
        [self.tableview setEditing:NO animated:YES];
        [self.btnEdit setTitle:@"Edit"];
    }
    else {
        [self.tableview setEditing:YES animated:YES];
        [self.btnEdit setTitle:@"Done"];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Contact *toDel = [self.contacts objectAtIndex:indexPath.row];
        if(toDel.image != nil){
            [ImageReader DeleteImage:toDel.image];
        }
        [self.contacts removeObjectAtIndex:indexPath.row];
        [self.tableview deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [self saveContacts];
    }
}

@end
