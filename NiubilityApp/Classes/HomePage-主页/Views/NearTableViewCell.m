//
//  NearTableViewCell.m
//  NiubilityApp
//
//  Created by 王辉 on 16/3/4.
//  Copyright © 2016年 DeveloperYoung. All rights reserved.
//

#import "NearTableViewCell.h"
#import "NearModels.h"

@interface NearTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headerPic;

@end


@implementation NearTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setNearModel:(NearModels *)nearModel {
    _nearModel = nearModel;
    self.headerPic.masksToBoundsWH = YES;
    self.headerPic.cornerRadiusWH = 10;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
