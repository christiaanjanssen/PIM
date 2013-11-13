//
//  Note.m
//  PIM
//
//  Created by Christiaan Janssen on 6/11/13.
//  Copyright (c) 2013 Janssen&Smets. All rights reserved.
//

#import "Note.h"

@implementation Note

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if(!self){
        return nil;
    }
    
    self.title = [aDecoder decodeObjectForKey:@"title"];
    self.content = [aDecoder decodeObjectForKey:@"content"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.content forKey:@"content"];
}

- (id)initWithTitle:(NSString *)nTitle andContent:(NSString *)nContent
{
    if(self = [super init]){
        self.title = nTitle;
        self.content = nContent;
    }
    
    return self;
}

@end
