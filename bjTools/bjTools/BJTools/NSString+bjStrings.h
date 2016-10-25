//
//  NSString+bjStrings.h
//  bjTools
//
//  Created by bradleyjohnson on 2016/10/18.
//  Copyright © 2016年 bradleyjohnson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (bjStrings)

#pragma mark - StringOperation
/**
 *  判断字符串是否为空
 *
 *  @param string 字符串
 *
 *  @return 判断值（YES判断为空字符串，NO判断为非空字符串）
 */
+(BOOL)isStringEmpty:(NSString *)string;




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




/**
 获取一定位数随机的可包含数字、小写字母、大写字母中任意一种以上的字符串

 @param length 位数
 @param number 包含数字
 @param lower  包含小写字母
 @param upper  包含大写字母

 @return 字符串
 */
+(NSString *)getRandomStringLength:(NSInteger)length number:(BOOL)number lower:(BOOL)lower upper:(BOOL)upper;

#pragma mark - RegExp
/**
 *  正则表达式验证字符串
 *
 *  @param regexp 正则表达式
 *  @param string 待验证字符串
 *
 *  @return 验证值
 */
+(BOOL)validateWithRegExp:(NSString *)regexp and:(NSString *)string;




/**
 *  验证手机号码是否规范（含13、14、15、17、18开头的11位手机号码）
 *
 *  @param string 待验证手机号码
 *
 *  @return 验证值
 */
+(BOOL)validatePhoneNumberWithString:(NSString *)string;




/**
 *  验证 Email 账号是否规范（界定为 @前4位起，@后2位起，以 .com 结尾的邮箱）
 *
 *  @param string 待验证邮箱
 *
 *  @return 验证值
 */
+(BOOL)validateEmailNumberWithString:(NSString *)string;




/**
 *  验证密码是否规范（界定为 以_或字母开头，6至18位的密码字符串）
 *
 *  @param string 待验证密码
 *
 *  @return 验证值
 */
+(BOOL)validatePasswordNumberWithString:(NSString *)string;




/**
 *  验证验证码是否规范(界定为 6位纯数字组合)
 *
 *  @param string 待验证验证码
 *
 *  @return 验证值
 */
+(BOOL)validateCodeWithString:(NSString *)string;




#pragma mark - encoding
/**
 字符串中文转码

 @return 转码后的字符串
 */
-(NSString *)chineseTranscoding;





#pragma mark - encrypt

/**
 MD5 加密

 @param lower  大写或是小写加密
 @param length   32位或16位
 @param string 待加密字符串

 @return 加密字符串
 */
+(NSString *)MD5WithLower:(BOOL)lower length:(NSUInteger)length forString:(NSString *)string;

@end
