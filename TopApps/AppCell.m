//
//  AppCell.m
//  Top Apps
//
//  Created by Vinodh  on 27/12/14.
//  Copyright (c) 2014 Daston~Rhadnojnainva. All rights reserved.
//

#import "AppCell.h"
#import "App.h"
#import "UIImageView+Networking.h"

@interface AppCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;

@property (nonatomic) App *appRecord;
@end

@implementation AppCell

- (void)configureCellForAppRecord:(App *)app
{
    self.appRecord = app;
    [self.iconView setImage:[UIImage imageNamed:@"appLogo.png"]];
    [self.iconView setImageURL:[NSURL URLWithString:app.iconURLString]];
    self.titleLabel.text = app.name;
    self.categoryLabel.text = self.appRecord.category;
    self.priceLabel.text = self.appRecord.price;
    self.artistLabel.text = self.appRecord.artist;
}

@end
