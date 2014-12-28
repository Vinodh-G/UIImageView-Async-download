//
//  UIImageView+Networking.h
//  AsyncImageView
//
//  Created by Vinodh  on 26/11/14.
//  Copyright (c) 2014 Daston~Rhadnojnainva. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

// UIImageView Extentions resposipble for downloading the image from remote server.
@interface UIImageView (Networking)
@property (nonatomic) NSURL *imageURL;
@property (nonatomic) NSString *URLId;
@end
