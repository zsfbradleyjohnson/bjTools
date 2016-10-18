//
//  UIImage+bjImages.h
//  bjTools
//
//  Created by bradleyjohnson on 2016/10/18.
//  Copyright © 2016年 bradleyjohnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (bjImages)

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
