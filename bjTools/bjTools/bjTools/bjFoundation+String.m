//
//  bjFoundation+String.m
//  bjTools
//
//  Created by bradleyjohnson on 16/8/27.
//  Copyright © 2016年 bradleyjohnson. All rights reserved.
//

#import "bjFoundation+String.h"

@implementation bjFoundation (String)

#pragma mark - public methods

+(BOOL)isStringEmpty:(NSString *)string
{
    return !string.length;
}

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

+(BOOL)validatePhoneNumberWithString:(NSString *)string
{
    if (!string.length) {
        return NO;
    }
    
    return [bjFoundation validateWithRegExp:@"^1[3|4|5|7|8]\\d{9}$" and:string];
}

+(BOOL)validateEmailNumberWithString:(NSString *)string
{
    if (!string.length) {
        return NO;
    }
    
    return [bjFoundation validateWithRegExp:@"^[a-zA-Z0-9]{4,}@[a-zA-Z0-9]{2,}\\.com$" and:string];

}

+(BOOL)validatePasswordNumberWithString:(NSString *)string
{
    if (!string.length) {
        return NO;
    }
    
    return [bjFoundation validateWithRegExp:@"^[_|[a-zA-Z]][a-zA-Z0-9]{5,17}$" and:string];

}

+(BOOL)validateCodeWithString:(NSString *)string
{
    if (!string.length) {
        return NO;
    }
    
    return [bjFoundation validateWithRegExp:@"^\\d{6}$" and:string];

}

+(BOOL)validateWithRegExp:(NSString *)regexp and:(NSString *)string
{
    NSPredicate * predicate = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", regexp];
    
    return [predicate evaluateWithObject:string];
}

#pragma mark - private methods


@end
