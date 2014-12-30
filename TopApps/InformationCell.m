//
//  InformationCell.m
//  TopApps
//
//  Created by Vinodh Kumar on 12/29/14.
//  Copyright (c) 2014 Daston~Rhadnojnainva. All rights reserved.
//

#import "InformationCell.h"
#import "App.h"

@interface InformationCell ()
@property (weak, nonatomic) IBOutlet UILabel *developerLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *appSizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *versionLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthContriant;

@property (nonatomic) App *app;
@end

@implementation InformationCell

- (void)layoutSubviews
{
    self.widthContriant.constant = (self.frame.size.width - 24) / 2;
    [super layoutSubviews];
}

- (void)configureCellForApp:(App *)app
{
    self.app = app;
    
    self.developerLabel.text = self.app.sellerName;
    self.categoryLabel.text = self.app.category;
    self.appSizeLabel.text = [self.app sizeString];
    self.versionLabel.text = self.app.version;
    self.ratingLabel.text = [self.app.avgRatings stringValue];
}

@end
