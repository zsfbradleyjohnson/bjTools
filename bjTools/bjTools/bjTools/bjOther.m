//
//  bjOther.m
//  bjTools
//
//  Created by bradleyjohnson on 16/8/27.
//  Copyright © 2016年 bradleyjohnson. All rights reserved.
//

#import "bjOther.h"

@implementation bjOther

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

+(CGFloat)diskofFreeSizeMBytes
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
        folderSize += [bjOther fileSizeAtPath:filePath];
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
