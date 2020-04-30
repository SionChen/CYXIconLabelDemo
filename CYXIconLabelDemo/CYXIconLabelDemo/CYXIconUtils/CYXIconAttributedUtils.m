//
//  CYXIconAttributedUtils.m
//  CYXIconLabelDemo
//
//  Created by 晓 on 2020/4/30.
//  Copyright © 2020 晓. All rights reserved.
//

#import "CYXIconAttributedUtils.h"

@interface CYXIconAttributedUtils ()

@property (nonatomic,strong) UILabel *applyLabel;//这里持有是为了layer渲染优化

@end
@implementation CYXIconAttributedUtils

+ (instancetype)sharedClient {
    static CYXIconAttributedUtils *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[CYXIconAttributedUtils alloc] init];
    });
    return _sharedClient;
}

#pragma mark Method

/**
 带有标签的富文本字符串

 @param text text
 @param signText icontext
 @return -
 */
+(NSMutableAttributedString *)titleAttributedStringWithText:(NSString *)text
                                                   textFont:(UIFont *)textFont
                                                andIconText:(NSString *)signText{
    return [self titleAttributedStringWithText:text
                                      textFont:textFont
                                   andIconText:@"微商城"
                           signBackgroundColor:[self colorWithHex:0xffebeb]
                                 signTextColor:[UIColor redColor]];
}
+(NSMutableAttributedString *)titleAttributedStringWithText:(NSString *)text
                                                   textFont:(UIFont *)textFont
                                                andIconText:(NSString *)signText
                                        signBackgroundColor:(UIColor *)signBackgroundColor
                                              signTextColor:(UIColor *)signTextColor{
    [CYXIconAttributedUtils sharedClient].applyLabel.font = [UIFont systemFontOfSize:textFont.pointSize-4];
    [CYXIconAttributedUtils sharedClient].applyLabel.textColor = signTextColor;
    [CYXIconAttributedUtils sharedClient].applyLabel.backgroundColor = signBackgroundColor;
    [CYXIconAttributedUtils sharedClient].applyLabel.layer.borderColor =signBackgroundColor.CGColor;
    
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@" %@", text]];
    //NSTextAttachment可以将要插入的图片作为特殊字符处理
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
   
    
    //定义图片内容及位置和大小
    UIImage * signImage = [[CYXIconAttributedUtils sharedClient] iconWithText:signText textFont:textFont];
    attch.image = signImage;
    attch.bounds = CGRectMake(0, 0, signImage.size.width, signImage.size.height);
    //创建带有图片的富文本
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    //将图片放在最后一位
    //[attri appendAttributedString:string];
    //将图片放在第一位
    [attri insertAttributedString:string atIndex:0];
    [attri addAttribute:NSBaselineOffsetAttributeName value:@(-textFont.pointSize/4.5) range:NSMakeRange(0, 1)];
    return attri;
}

-(UIImage *)iconWithText:(NSString *)signText textFont:(UIFont *)textFont{
    
    CGSize size = [signText sizeWithAttributes:@{NSFontAttributeName:self.applyLabel.font}];
    self.applyLabel.frame = CGRectMake(0, 0, size.width+8, self.applyLabel.font.lineHeight+4);
    self.applyLabel.text = signText;
    return [self imageWithUIView:self.applyLabel];
}
/**
 view装image
 
 @param view view
 @return image
 */
- (UIImage*) imageWithUIView:(UIView*) view{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(view.bounds.size.width, view.bounds.size.height),NO, [UIScreen mainScreen].scale);

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextSetBlendMode(ctx, kCGBlendModeNormal);
    CGContextFillRect(ctx, view.bounds);
    
    [view.layer renderInContext:ctx];
    UIImage* tImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tImage;
}
#pragma mark ---Utils
+ (UIColor *)colorWithHex:(long)hexValue {
    return [self colorWithHex:hexValue alpha:1.0];
}

+ (UIColor *)colorWithHex:(long)hexValue alpha:(float)alpha {
    CGFloat red   = ((float)((hexValue & 0xFF0000) >> 16))/255.0;
    CGFloat green = ((float)((hexValue & 0xFF00) >> 8))/255.0;
    CGFloat blue  = ((float)(hexValue  & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}
#pragma mark ---G
-(UILabel*)applyLabel{
    if(!_applyLabel){
        _applyLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _applyLabel.backgroundColor = [UIColor redColor];
        _applyLabel.textColor = [UIColor whiteColor];
        //_applyLabel.text = text;
        _applyLabel.layer.masksToBounds = YES;
        _applyLabel.layer.cornerRadius = 3;
        _applyLabel.layer.shouldRasterize = YES;
        _applyLabel.layer.borderWidth = 1;
        _applyLabel.layer.borderColor = [UIColor redColor].CGColor;
        _applyLabel.textAlignment = NSTextAlignmentCenter;
        _applyLabel.font = [UIFont systemFontOfSize:12];
    }
    return _applyLabel;
}
@end
