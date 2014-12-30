//
//  DataManager.m
//  Top Apps
//
//  Created by Vinodh  on 27/12/14.
//  Copyright (c) 2014 Daston~Rhadnojnainva. All rights reserved.
//

#import "DataManager.h"
#import "App.h"

static NSString *kTopPaidAppsURL = @"http://phobos.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=125/json";
static NSString *kFullAppDetailsURL = @"https://itunes.apple.com/lookup?id=%@";

@interface DataManager ()
@property (nonatomic, copy) CompletionBlock completionBlock;
@end

@implementation DataManager

static DataManager *staticManager = nil;


+ (id)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        staticManager = [[DataManager alloc] init];
    });
    
    return staticManager;
}

- (void)getTopPaidAppswithCompletionBlock:(CompletionBlock)block
{
    if (block)
    {
        self.completionBlock = block;
        [self downloadAppsDetailsForRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:kTopPaidAppsURL]]];
    }
}

- (void)getDetailsForApp:(App *)app withCompletionBlock:(AppDetailsCompletionBlock)block
{
    if (block && app)
    {
        [self downloadAppFullDetailsForApp:app withCompletionBlock:block];
    }
}

- (void)downloadAppsDetailsForRequest:(NSURLRequest *)request
{
    __weak DataManager *weakSelf = self;
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (!connectionError)
        {
            NSError *jsonParsingError = nil;
            NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
            [weakSelf createAppObjectsForRecords:jsonResults[@"feed"][@"entry"]];
        }
        else
        {
            weakSelf.completionBlock(NO, nil, connectionError);
        }
        
    }];
}

- (void)downloadAppFullDetailsForApp:(App *)app withCompletionBlock:(AppDetailsCompletionBlock)block
{
    __weak DataManager *weakSelf = self;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:kFullAppDetailsURL, app.appId]]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (!connectionError)
        {
            NSError *jsonParsingError = nil;
            NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
            [weakSelf populateAppDetailsForApp:app FromRecord:[jsonResults[@"results"] lastObject]];
            block(YES, app, nil);
        }
        else
        {
            block(NO, app, connectionError);
        }
    }];
}

- (void)createAppObjectsForRecords:(NSArray *)records
{
    NSMutableArray *recordObjects = [NSMutableArray array];
    for (NSDictionary *appRecord in records)
    {
        App *appDetail = [[App alloc] init];
        appDetail.name = appRecord[@"title"][@"label"];
        appDetail.appId = appRecord[@"id"][@"attributes"][@"im:id"];
        appDetail.artist = appRecord[@"rights"][@"label"];
        appDetail.category = appRecord[@"category"][@"attributes"][@"term"];
        appDetail.price = appRecord[@"im:price"][@"label"];
        NSDictionary *imgDetail = [appRecord[@"im:image"] lastObject];
        if (imgDetail)
            appDetail.iconURLString = imgDetail[@"label"];
        
        [recordObjects addObject:appDetail];
    }
    
    if (self.completionBlock)
    {
        self.completionBlock(YES, [NSArray arrayWithArray:recordObjects], nil);
    }
}

- (void)populateAppDetailsForApp:(App *)app FromRecord:(NSDictionary *)appDetails
{
    app.sellerName = appDetails[@"sellerName"];
    app.version = appDetails[@"version"];
    app.appDescription = appDetails[@"description"];
    app.screenshotURLs = appDetails[@"screenshotUrls"];
    app.itunesArtWorkURL = appDetails[@"artworkUrl512"];
    app.avgRatings = appDetails[@"averageUserRating"];
    app.appSize = appDetails[@"fileSizeBytes"];
}

@end