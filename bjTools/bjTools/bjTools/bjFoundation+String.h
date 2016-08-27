//
//  bjFoundation+String.h
//  bjTools
//
//  Created by bradleyjohnson on 16/8/27.
//  Copyright © 2016年 bradleyjohnson. All rights reserved.
//

#import "bjFoundation.h"

@interface bjFoundation (String)

/**
 *  判断 string 字符串是否包含 subString 字符串
 *
 *  @param subString 子字符串
 *  @param string    父字符串
 *
 *  @return 判断值
 */
+(BOOL)isString:(NSString *)subString inString:(NSString *)string;




/**
 *  判断 string 中是否包含空格
 *
 *  @param string 字符串
 *
 *  @return 判断值
 */
+(BOOL)isStringIncludeSpace:(NSString *)string;




/**
 *  判断 string 中是否包含中文
 *
 *  @param string 字符串
 *
 *  @return 判断值
 */
+(BOOL)isStringIncludeChinese:(NSString *)string;




/**
 *  判读 stirng 是否为纯数字
 *
 *  @param string 字符串
 *
 *  @return 判断值
 */
+(BOOL)isStringPureNumber:(NSString *)string;


@end