//
//  CYXIconAttributedUtils.h
//  CYXIconLabelDemo
//
//  Created by 晓 on 2020/4/30.
//  Copyright © 2020 晓. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CYXIconAttributedUtils : NSObject

+(NSMutableAttributedString *)titleAttributedStringWithText:(NSString *)text
                                                   textFont:(UIFont *)textFont
                                                andIconText:(NSString *)signText;
+(NSMutableAttributedString *)titleAttributedStringWithText:(NSString *)text
                                                   textFont:(UIFont *)textFont
                                                andIconText:(NSString *)signText
                                        signBackgroundColor:(UIColor *)signBackgroundColor
                                              signTextColor:(UIColor *)signTextColor;

@end

NS_ASSUME_NONNULL_END
