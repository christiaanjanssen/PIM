//
//  Note.h
//  PIM
//
//  Created by Christiaan Janssen on 6/11/13.
//  Copyright (c) 2013 Janssen&Smets. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject <NSCoding>

@property NSString *title;
@property NSString *content;

- (id)initWithTitle:(NSString *)nTitle andContent:(NSString *)nContent;

@end
