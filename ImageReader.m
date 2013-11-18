//
//  ImageReader.m
//  PIM
//
//  Created by Jeffrey on 18/11/13.
//  Copyright (c) 2013 Janssen&Smets. All rights reserved.
//

#import "ImageReader.h"

@implementation ImageReader

+(UIImage *)ReadImage:(NSString *)imageName
{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [path objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:imageName];
    return [UIImage imageWithContentsOfFile:filePath];
}

+(void)DeleteImage:(NSString *)imageName
{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [path objectAtIndex:0];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *toDel = [documentsDirectory stringByAppendingPathComponent:imageName];
    [fileManager removeItemAtPath:toDel error:NULL];
}

@end
