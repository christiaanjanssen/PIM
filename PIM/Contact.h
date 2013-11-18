//
//  Contact.h
//  iOSProject
//
//  Created by Jeffrey on 02/11/13.
//  Copyright (c) 2013 Christiaan Janssen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject <NSCoding>

@property NSString *firstName;
@property NSString *lastName;
@property NSString *company;
@property NSString *tel;
@property NSString *image;

- (id)initWithFirstName:(NSString *)fName andLastName:(NSString *)lName andCompany:(NSString *)iCompany andTel:(NSString *)iTel;
- (NSString *)fullName;

@end
