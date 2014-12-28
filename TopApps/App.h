//
//  AppRecord.h
//  Assignments~Altimetrix
//
//  Created by Vinodh  on 26/11/14.
//  Copyright (c) 2014 Daston~Rhadnojnainva. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface App : NSObject
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *appId;
@property (nonatomic) NSString *iconURLString;
@property (nonatomic) NSString *sellerName;
@property (nonatomic) NSString *version;
@property (nonatomic) NSString *appDescription;
@property (nonatomic) NSArray  *screenshotURLs;
@property (nonatomic) NSString *itunesArtWorkURL;
@end
