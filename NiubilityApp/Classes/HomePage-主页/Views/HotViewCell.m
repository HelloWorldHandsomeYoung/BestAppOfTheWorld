//
//  HotViewCell.m
//  NiubilityApp
//
//  Created by 王辉 on 16/3/3.
//  Copyright © 2016年 DeveloperYoung. All rights reserved.
//

#import "HotViewCell.h"
#import "HotModels.h"

@interface HotViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *numbersOfOnline;
@property (weak, nonatomic) IBOutlet UIImageView *bigPic;
@property (weak, nonatomic) IBOutlet UIImageView *headerPic;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *detialTitle;

@end

@implementation HotViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)shareMessage:(UIButton *)sender {
}

- (void)setModel:(HotModels *)model
{
    _model = model;
    self.numbersOfOnline.text = @"111";
    self.headerPic.masksToBoundsWH = YES;
    self.headerPic.cornerRadiusWH = 30;
    self.detialTitle.text = @"当然,通过这种方式.";
    [self setLinesOfLabel];
    
}

#pragma mark - 处理文本的行数
- (void)setLinesOfLabel {
    //  求出detialTitle的高度
    CGFloat labelHeight = [self.detialTitle sizeThatFits:CGSizeMake(self.detialTitle.frame.size.width, MAXFLOAT)].height;
    //  行数 = label的高度 / 每一行的高度
    CGFloat lines = labelHeight / self.detialTitle.font.lineHeight;
    if (lines >= 2) {
        self.detialTitle.numberOfLines = 2;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
