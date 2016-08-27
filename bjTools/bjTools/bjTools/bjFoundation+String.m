//
//  bjFoundation+String.m
//  bjTools
//
//  Created by bradleyjohnson on 16/8/27.
//  Copyright © 2016年 bradleyjohnson. All rights reserved.
//

#import "bjFoundation+String.h"

@implementation bjFoundation (String)

+(BOOL)isString:(NSString *)subString inString:(NSString *)string
{
    if (!subString.length || !string.length) {
        return NO;
    }
    
    return [string rangeOfString:subString].location==NSNotFound?NO:YES;
}

+(BOOL)isStringIncludeSpace:(NSString *)string
{
    if (!string.length) {
        return NO;
    }
    
    return [string rangeOfString:@" "].location==NSNotFound?NO:YES;
}

+(BOOL)isStringIncludeChinese:(NSString *)string
{
    if (!string.length) {
        return NO;
    }
    
    BOOL result;
    
    for (NSInteger index = 0; index<string.length; index++) {
        int c = [string characterAtIndex:index];
        if (c > 0x4e00 && c < 0x9fff) {
            result = YES;
            break;
        }
    }
    
    return result;
}

+(BOOL)isStringPureNumber:(NSString *)string
{
    if (!string.length) {
        return NO;
    }
    
    BOOL result = YES;
    
    for (NSInteger index = 0; index<string.length; index++) {
        unichar c = [string characterAtIndex:index];
        if (!isdigit(c)) {
            result = NO;
            break;
        }
    }
    
    return result;
}

@end
