//
//  CYXIconTestTableViewCell.m
//  IconLabel
//
//  Created by 晓 on 2020/4/30.
//  Copyright © 2020 超级腕电商. All rights reserved.
//

#import "CYXIconTestTableViewCell.h"
#import "CYXIconAttributedUtils.h"

@implementation CYXIconTestTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.textLabel.font = [UIFont systemFontOfSize:16];
    }
    return self;
}
-(void)set{
    self.textLabel.attributedText = [CYXIconAttributedUtils titleAttributedStringWithText:@"文本字段文本字段文本字段文本字段文本字段文本字段文本字段" textFont:self.textLabel.font andIconText:@"京东自营"];
}
@end
