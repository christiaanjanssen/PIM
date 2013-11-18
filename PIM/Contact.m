//
//  Contact.m
//  iOSProject
//
//  Created by Jeffrey on 02/11/13.
//  Copyright (c) 2013 Christiaan Janssen. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if(!self){
        return nil;
    }
    
    self.firstName = [aDecoder decodeObjectForKey:@"firstName"];
    self.lastName = [aDecoder decodeObjectForKey:@"lastName"];
    self.company = [aDecoder decodeObjectForKey:@"company"];
    self.tel = [aDecoder decodeObjectForKey:@"tel"];
    self.image = [aDecoder decodeObjectForKey:@"image"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.firstName forKey:@"firstName"];
    [aCoder encodeObject:self.lastName forKey:@"lastName"];
    [aCoder encodeObject:self.company forKey:@"company"];
    [aCoder encodeObject:self.tel forKey:@"tel"];
    [aCoder encodeObject:self.image forKey:@"image"];
}

- (NSString *)fullName
{
    NSString *name = [self.firstName stringByAppendingString:@" "];
    name = [name stringByAppendingString:self.lastName];
    return name;
}

- (id)initWithFirstName:(NSString *)fName andLastName:(NSString *)lName andCompany:(NSString *)iCompany andTel:(NSString *)iTel andImage:(NSString *)img
{
    if(self = [super init]){
        self.firstName = fName;
        self.lastName = lName;
        self.company = iCompany;
        self.tel = iTel;
        self.image = img;
    }
    
    return self;
}

@end
