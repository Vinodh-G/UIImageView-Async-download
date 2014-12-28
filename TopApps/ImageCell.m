//
//  ImageCell.m
//  Assignments~Altimetrix
//
//  Created by Vinodh  on 14/12/14.
//  Copyright (c) 2014 Daston~Rhadnojnainva. All rights reserved.
//

#import "ImageCell.h"
#import "UIImageView+Networking.h"

@interface ImageCell ()
@property (weak, nonatomic) IBOutlet UIImageView *celImageView;

@end

@implementation ImageCell

- (void) configureCellForURL:(NSString *)imageURL
{
    [self.celImageView setImageURL:[NSURL URLWithString:imageURL]];
}
@end
