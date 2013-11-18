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

@implementation PIMAddContactViewController{
    NSString *imageName;
    UIImage *tempImage;
}

@synthesize scrollview;
@synthesize activeField;
@synthesize imageview;

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
    if([segue.identifier isEqualToString:@"addToList"]){
        
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSDate *now = [NSDate date];
        NSString *imagePath = [documentsDirectory stringByAppendingPathComponent:[[NSString alloc] initWithFormat:@"%@.png", now]];
        
        if(tempImage != nil){
            imageName = [[NSString alloc] initWithFormat:@"%@.png", now];
            NSData *webData = UIImagePNGRepresentation(tempImage);
            [webData writeToFile:imagePath atomically:YES];
        }
        
        PIMContactListViewController *dest = segue.destinationViewController;
        dest.addContact = [[Contact alloc] initWithFirstName:self.txtFirst.text andLastName:self.txtLast.text andCompany:self.txtCompany.text andTel:self.txtTel.text andImage:imageName];
    }
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
    NSString *imageType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([imageType isEqualToString:@"public.image"]) {
        tempImage = [info objectForKey:UIImagePickerControllerEditedImage];
        [imageview setImage:tempImage];
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
