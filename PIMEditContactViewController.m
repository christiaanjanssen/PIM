//
//  PIMEditContactViewController.m
//  PIM
//
//  Created by Jeffrey on 03/11/13.
//  Copyright (c) 2013 Janssen&Smets. All rights reserved.
//

#import "PIMEditContactViewController.h"
#import "PIMDetailContactViewController.h"
#import "ImageReader.h"

@interface PIMEditContactViewController ()

@end

@implementation PIMEditContactViewController{
    NSString *imageName;
}

@synthesize editContact;
@synthesize scrollview;
@synthesize activeField;
@synthesize imageview;

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
    if([editContact image] != nil){
        [imageview setImage:[ImageReader ReadImage:[editContact image]]];
    }
    
    UITapGestureRecognizer *tapgestures = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped)];
    tapgestures.cancelsTouchesInView = NO;
    [scrollview addGestureRecognizer:tapgestures];
    
    UITapGestureRecognizer *imageTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped)];
    imageTap.numberOfTapsRequired = 1;
    [imageview addGestureRecognizer:imageTap];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self registerForKeyboardNotifications];
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
    if(imageName != nil){
        editContact.image = imageName;
    }
    
    
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

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    scrollview.contentInset = contentInsets;
    scrollview.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your app might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    [scrollview setContentSize:CGSizeMake(self.view.bounds.size.width, aRect.size.height)];
    if (!CGRectContainsPoint(aRect, activeField.frame.origin) ) {
        [self.scrollview scrollRectToVisible:activeField.frame animated:YES];
    }
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    scrollview.contentInset = contentInsets;
    scrollview.scrollIndicatorInsets = contentInsets;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    activeField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    activeField = nil;
}

- (IBAction)textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
}

- (void)tapped
{
    [self.view endEditing:YES];
}

- (void)imageTapped
{
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.mediaTypes = @[(NSString *)kUTTypeImage];
    imagePicker.allowsEditing = YES;
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSDate *now = [NSDate date];
    NSString *imagePath = [documentsDirectory stringByAppendingPathComponent:[[NSString alloc] initWithFormat:@"%@.png", now]];
    
    NSString *imageType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([imageType isEqualToString:@"public.image"]) {
        if([editContact image] != nil){
            [ImageReader DeleteImage:[editContact image]];
        }
        
        
        UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
        imageName = [[NSString alloc] initWithFormat:@"%@.png", now];
        NSData *webData = UIImagePNGRepresentation(editedImage);
        [webData writeToFile:imagePath atomically:YES];
        [imageview setImage:editedImage];
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}



@end
