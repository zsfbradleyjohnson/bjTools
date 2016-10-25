//
//  NSString+bjStrings.m
//  bjTools
//
//  Created by bradleyjohnson on 2016/10/18.
//  Copyright © 2016年 bradleyjohnson. All rights reserved.
//

#import "NSString+bjStrings.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (bjStrings)

#pragma clang diagnostic ignored "-Wdeprecated-declarations"
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

+(NSString *)getRandomStringLength:(NSInteger)length number:(BOOL)number lower:(BOOL)lower upper:(BOOL)upper
{
    NSString * randomString = [NSString new];
    
    if (!number && !lower && !upper) {
        return @"";
    }
    
    for (NSInteger index = 0; index < length; index++) {
        
        int way = arc4random()%3;
        
        switch (way) {
            case 0:
            {
                if (number) {
                    randomString = [randomString stringByAppendingString:[NSString stringWithFormat:@"%d",arc4random()%10]];
                }else{
                    index--;
                }
            }
                break;
            case 1:
            {
                if (upper) {
                    randomString = [randomString stringByAppendingString:[NSString stringWithFormat:@"%c",(arc4random()%26)+65]];
                }else{
                    index--;
                }
            }
                break;
            case 2:
            {
                if (lower) {
                    randomString = [randomString stringByAppendingString:[NSString stringWithFormat:@"%c",(arc4random()%26)+97]];
                }else{
                    index--;
                }
            }
                break;
        }
    }
    
    return randomString;
}

+(BOOL)validatePhoneNumberWithString:(NSString *)string
{
    if (!string.length) {
        return NO;
    }
    
    return [NSString validateWithRegExp:@"^1[3|4|5|7|8]\\d{9}$" and:string];
}

+(BOOL)validateEmailNumberWithString:(NSString *)string
{
    if (!string.length) {
        return NO;
    }
    
    return [NSString validateWithRegExp:@"^[a-zA-Z0-9]{4,}@[a-zA-Z0-9]{2,}\\.com$" and:string];
    
}

+(BOOL)validatePasswordNumberWithString:(NSString *)string
{
    if (!string.length) {
        return NO;
    }
    
    return [NSString validateWithRegExp:@"^[_|[a-zA-Z]][a-zA-Z0-9]{5,17}$" and:string];
    
}

+(BOOL)validateCodeWithString:(NSString *)string
{
    if (!string.length) {
        return NO;
    }
    
    return [NSString validateWithRegExp:@"^\\d{6}$" and:string];
    
}

+(BOOL)validateWithRegExp:(NSString *)regexp and:(NSString *)string
{
    NSPredicate * predicate = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", regexp];
    
    return [predicate evaluateWithObject:string];
}

-(NSString *)chineseTranscoding
{
    NSString * string = self;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 9.0) {
        string = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }else{
        string = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    }
    
    return string;
}

+(NSString *)MD5WithLower:(BOOL)lower length:(NSUInteger)length forString:(NSString *)string
{
    const char* input = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    NSString * const type = lower?@"%02x":@"%02X";
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:type, result[i]];
    }
    
    NSString  * resultString = digest;
    
    if (length == 16) {
        for (int i=0; i<24; i++) {
            resultString = [digest substringWithRange:NSMakeRange(8, 16)];
        }
    }
    
    return resultString;
}
@end
