//
//  ImageReader.h
//  PIM
//
//  Created by Jeffrey on 18/11/13.
//  Copyright (c) 2013 Janssen&Smets. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageReader : NSObject
+(UIImage*)ReadImage:(NSString*)imageName;
+(void)DeleteImage:(NSString *)imageName;
@end
