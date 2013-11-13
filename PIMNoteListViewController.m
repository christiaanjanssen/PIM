//
//  PIMNoteListViewController.m
//  PIM
//
//  Created by Christiaan Janssen on 6/11/13.
//  Copyright (c) 2013 Janssen&Smets. All rights reserved.
//

#import "PIMNoteListViewController.h"
#import "Note.h"
#import "PIMDetailNoteViewController.h"

@interface PIMNoteListViewController ()

@end

@implementation PIMNoteListViewController
{
    NSInteger editRow;
}

@synthesize addNote;

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
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"notes"];
    NSArray *tmp = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    self.notes = [[NSMutableArray alloc] initWithArray:tmp];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.notes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *noteId = @"noteCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:noteId];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:noteId];
    }
    
    cell.textLabel.text = [[self.notes objectAtIndex:indexPath.row] title];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showNoteDetails"]){
        NSIndexPath *indexPath = [self.tableview indexPathForSelectedRow];
        PIMDetailNoteViewController *dest = segue.destinationViewController;
        editRow = indexPath.row;
        dest.inNote = [self.notes objectAtIndex:editRow];
    }
}

- (IBAction)unwindToListNotes:(UIStoryboardSegue *)unwindSegue
{
    [self.tableview reloadData];
    [self saveNotes];
}

- (IBAction)unwindToListCancelNotes:(UIStoryboardSegue *)unwindSegue
{
}

- (IBAction)unwindAndDeleteToListNotes:(UIStoryboardSegue *)unwindSegue
{
    [self.notes removeObjectAtIndex:editRow];
    [self.tableview reloadData];
    [self saveNotes];
}

- (IBAction)unWindAndAddNotes:(UIStoryboardSegue *)unwindSegue
{
    [self.notes addObject:addNote];
    [self.tableview reloadData];
    [self saveNotes];
}

- (void)saveNotes
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.notes];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"notes"];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.notes removeObjectAtIndex:indexPath.row];
        [self.tableview deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self saveNotes];
    }
}

- (IBAction)editList:(id)sender {
    if ([self.tableview isEditing]) {
        [self.tableview setEditing:NO animated:YES];
        [self.btnEdit setTitle:@"Edit"];
    }
    else {
        [self.tableview setEditing:YES animated:YES];
        [self.btnEdit setTitle:@"Done"];
    }
}

@end
