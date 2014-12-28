//
//  DataManager.h
//  Top Apps
//
//  Created by Vinodh  on 27/12/14.
//  Copyright (c) 2014 Daston~Rhadnojnainva. All rights reserved.
//

#import <Foundation/Foundation.h>

@class App;
typedef void (^CompletionBlock)(BOOL succes, NSArray *appRecords, NSError *error) ;
typedef void (^AppDetailsCompletionBlock)(BOOL succes, App *appDetails, NSError *error) ;

@interface DataManager : NSObject
+ (id)sharedManager;
- (void)getTopPaidAppswithCompletionBlock:(CompletionBlock)block;
- (void)getDetailsForApp:(App *)app withCompletionBlock:(AppDetailsCompletionBlock)block;
@end
