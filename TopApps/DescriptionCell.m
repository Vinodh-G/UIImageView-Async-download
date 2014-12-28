//
//  DescriptionCell.m
//  Top Apps
//
//  Created by Vinodh  on 27/12/14.
//  Copyright (c) 2014 Daston~Rhadnojnainva. All rights reserved.
//

#import "DescriptionCell.h"
#import "App.h"

@interface DescriptionCell ()
@property (nonatomic, weak) IBOutlet UILabel *descriptionlabel;
@end

@implementation DescriptionCell

- (void)configureCellForApp:(App *)app
{
    self.descriptionlabel.text = app.appDescription;
}

@end
