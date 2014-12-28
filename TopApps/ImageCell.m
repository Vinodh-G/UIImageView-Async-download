//
//  ImageCell.m
//  Top Apps
//
//  Created by Vinodh  on 27/12/14.
//  Copyright (c) 2014 Daston~Rhadnojnainva. All rights reserved.
//

#import "ImageCell.h"
#import "UIImageView+Networking.h"

@interface ImageCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ImageCell

- (void)awakeFromNib
{
    
}

- (void) configureCellForURL:(NSString *)imageURL
{
    [self.imageView setImage:[UIImage imageNamed:@"PlaceHolderBG"]];
    [self.imageView setImageURL:[NSURL URLWithString:imageURL]];
}
@end
