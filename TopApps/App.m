//
//  AppRecord.m
//  Top Apps
//
//  Created by Vinodh  on 27/12/14.
//  Copyright (c) 2014 Daston~Rhadnojnainva. All rights reserved.
//

#import "App.h"

@implementation App


- (NSString *)sizeString
{
    NSInteger size = self.appSize.doubleValue;
    NSString *sizeString = nil;
    NSInteger count = 0;
    while ((size / 1024) >= 1024)
    {
        count++;
        size = size / 1024;
    }
    float sizeWdecimal = size / 1024.0;
    
    switch (count)
    {
        case 0:
            sizeString = [NSString stringWithFormat:@"%.2f KB", (float)sizeWdecimal];
            break;
        case 1:
            sizeString = [NSString stringWithFormat:@"%.2f MB", (float)sizeWdecimal];
            break;
        case 2:
            sizeString = [NSString stringWithFormat:@"%.2f GB", (float)sizeWdecimal];
            break;
    }
    
    return sizeString;
}
@end
