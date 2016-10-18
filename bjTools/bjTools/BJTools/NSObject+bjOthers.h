//
//  NSObject+bjOthers.h
//  bjTools
//
//  Created by bradleyjohnson on 2016/10/18.
//  Copyright © 2016年 bradleyjohnson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (bjOthers)

/**
 *  获取磁盘总空间大小
 *
 *  @return 磁盘总空间大小
 */
+(CGFloat)diskOfAllSizeMBytes;




/**
 *  获取磁盘可用空间
 *
 *  @return 磁盘可用空间大小
 */
+(CGFloat)diskOfFreeSizeMBytes;




/**
 *  获取指定路径文件的大小
 *
 *  @param filepath 指定路径文件
 *
 *  @return 指定路径文件的大小
 */
+(long long)fileSizeAtPath:(NSString *)filepath;




/**
 *  获取指定路径文件夹下所有文件的大小
 *
 *  @param folderpath 指定路径文件夹
 *
 *  @return 指定路径文件夹下所有文件的大小
 */
+(long long)folderSizeAtPath:(NSString *)folderpath;




/**
 *  以指定格式获取当前时间字符串
 *
 *  @param format 指定格式
 *
 *  @return 当前时间字符串
 */
+(NSString *)getCurrentDateWithFormat:(NSString *)format;




@end
