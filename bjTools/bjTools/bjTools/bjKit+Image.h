//
//  bjKit+Image.h
//  bjTools
//
//  Created by bradleyjohnson on 16/8/27.
//  Copyright © 2016年 bradleyjohnson. All rights reserved.
//

#import "bjKit.h"
#import <UIKit/UIKit.h>

@interface bjKit (Image)

/**
 *  生成二维码图片
 *
 *  @param infomation 二维码携带信息
 *  @param size       边长尺寸
 *  @param logo       中间所含图片
 *  @param red        red percent
 *  @param green      green percent
 *  @param blue       blue percent
 *
 *  @return 二维码图片
 */
+(UIImage *)createQRImageWithInfomation:(NSString *)infomation
                          codeImageSize:(CGFloat)size
                                   logo:(UIImage *)logo
                                    red:(CGFloat)red
                                  green:(CGFloat)green
                                   blue:(CGFloat)blue;

@end
