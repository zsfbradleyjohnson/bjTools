//
//  NSObject+bjOthers.m
//  bjTools
//
//  Created by bradleyjohnson on 2016/10/18.
//  Copyright © 2016年 bradleyjohnson. All rights reserved.
//

#import "NSObject+bjOthers.h"

@implementation NSObject (bjOthers)


+(CGFloat)diskOfAllSizeMBytes
{
    CGFloat size = 0.0;
    NSError * error;
    NSDictionary * dic = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (error) {
        NSLog(@"Get disk of all size error : %@",error.localizedDescription);
    }else{
        NSNumber * number = [dic objectForKey:NSFileSystemSize];
        size = [number floatValue]/1024/1024;
    }
    
    return size;
}

+(CGFloat)diskOfFreeSizeMBytes
{
    CGFloat size = 0.0;
    NSError * error;
    NSDictionary * dic = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (error) {
        NSLog(@"Get disk of all size error : %@",error.localizedDescription);
    }else{
        NSNumber * number = [dic objectForKey:NSFileSystemFreeSize];
        size = [number floatValue]/1024/1024;
    }
    
    return size;
}

+(long long)fileSizeAtPath:(NSString *)filepath
{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:filepath]) {
        return 0;
    }
    
    unsigned long long size = 0;
    NSError * error;
    NSDictionary * dic = [fileManager attributesOfItemAtPath:filepath error:&error];
    if (error) {
        NSLog(@"Get file size error : %@",error.localizedDescription);
    }else{
        size = [dic fileSize];
    }
    
    return size;
}

+(long long)folderSizeAtPath:(NSString *)folderpath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:folderpath]) {
        return 0;
    }
    
    NSEnumerator * filesEnumerator = [[fileManager subpathsAtPath:folderpath] objectEnumerator];
    NSString * fileName;
    long long folderSize = 0;
    while ((fileName = [filesEnumerator nextObject]) != nil) {
        NSString * filePath = [folderpath stringByAppendingPathComponent:fileName];
        folderSize += [NSObject fileSizeAtPath:filePath];
    }
    
    return folderSize;
}

+(NSString *)getCurrentDateWithFormat:(NSString *)format
{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    
    return [dateFormatter stringFromDate:[NSDate date]];
}

@end
