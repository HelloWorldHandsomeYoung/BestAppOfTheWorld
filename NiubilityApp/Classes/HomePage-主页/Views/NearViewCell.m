//
//  NearViewCell.m
//  NiubilityApp
//
//  Created by 吕阳 on 16/3/1.
//  Copyright © 2016年 DeveloperYoung. All rights reserved.
//

#import "NearViewCell.h"
#import "NearModels.h"

@interface NearViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headerPic;

@end

@implementation NearViewCell

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
