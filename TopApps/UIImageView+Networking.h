//
//  UIImageView+Networking.h
//  Top Apps
//
//  Created by Vinodh  on 27/12/14.
//  Copyright (c) 2014 Daston~Rhadnojnainva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

// UIImageView Extentions resposipble for downloading the image from remote server.

typedef void (^DownloadCompletionBlock) (BOOL succes, UIImage *image, NSError *error);

@interface UIImageView (Networking)
@property (nonatomic) NSURL *imageURL;
@property (nonatomic) NSString *URLId;

- (void)setImageURL:(NSURL *)imageURL withCompletionBlock:(DownloadCompletionBlock)block;
@end
