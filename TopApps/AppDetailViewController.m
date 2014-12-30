//
//  AppDetailViewController.m
//  Top Apps
//
//  Created by Vinodh  on 27/12/14.
//  Copyright (c) 2014 Daston~Rhadnojnainva. All rights reserved.
//
#import "AppDetailViewController.h"
#import "App.h"
#import "UIImageView+Networking.h"
#import "DataManager.h"
#import "ScreenShotsCell.h"
#import "DescriptionCell.h"
#import "InformationCell.h"

@interface AppDetailViewController ()
@property (nonatomic) NSString *loadingTitle;
@end

typedef enum {
    eDescriptionField,
    eScreenShotsField,
    eInformationField
}EAppDetailFields;

static CGFloat kLoadingCellHeight = 111.0f;

@implementation AppDetailViewController

- (void)viewDidLoad
{
    self.tableView.tableFooterView = [UIView new];
    self.tableView.estimatedRowHeight = 68.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;

    
    if (!self.appRecord.screenshotURLs.count)
    {
        __weak AppDetailViewController *weakSelf = self;
        self.loadingTitle = @"Loading ...";
        
        [[DataManager sharedManager] getDetailsForApp:self.appRecord withCompletionBlock:^(BOOL succes, App *appDetails, NSError *error) {
            
            if (!succes)
            {
                weakSelf.loadingTitle = @"Network issue try again";
            }
            [weakSelf.tableView reloadData];
        }];
    }
    
    [super viewDidLoad];
}

#pragma mark -
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = self.appRecord.screenshotURLs.count ? 3 : 1;
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    if (self.appRecord.screenshotURLs.count)
    {
        cell = [self customCellForIndexPath:indexPath];
    }
    else
    {
        UITableViewCell *loadingCell = [tableView dequeueReusableCellWithIdentifier:@"LoadingCellId"];
        UILabel *statusLabel = (UILabel *)[loadingCell.contentView viewWithTag:111];
        statusLabel.text = self.loadingTitle;
        cell = loadingCell;
    }
    
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rowHeight = 0.0;
    
    if (self.appRecord.screenshotURLs.count)
    {
        rowHeight = [self cellHeightForIndexPath:indexPath];
    }
    else
    {
        rowHeight = kLoadingCellHeight;
    }
    return rowHeight;
}

#pragma mark -
#pragma mark Private

- (UITableViewCell *)customCellForIndexPath:(NSIndexPath *)path
{
    UITableViewCell *cell = nil;
    switch (path.row)
    {
        case eDescriptionField:
        {
            DescriptionCell  *descriptioncell = (DescriptionCell *)[self.tableView dequeueReusableCellWithIdentifier:@"descriptionCellId"];
            [descriptioncell configureCellForApp:self.appRecord];
            cell = descriptioncell;
        }
            break;
            
        case eScreenShotsField:
        {
            ScreenShotsCell *screenShotCell = [self.tableView dequeueReusableCellWithIdentifier:@"ScreenShotsCellId"];
            [screenShotCell configureCellForApp:self.appRecord];
            cell = screenShotCell;
        }
            break;
            
        case eInformationField:
        {
            InformationCell *inforCell = [self.tableView dequeueReusableCellWithIdentifier:@"InfoCellId"];
            [inforCell configureCellForApp:self.appRecord];
            cell = inforCell;
        }
            
        break;
    }
    return cell;
}

- (CGFloat)cellHeightForIndexPath:(NSIndexPath *)path
{
    CGFloat height = 0.0;
    switch (path.row)
    {
        case eDescriptionField:
        case eInformationField:
        {
            height = self.tableView.rowHeight;
        }
        break;
            
        case eScreenShotsField:
        {
            height = self.view.frame.size.height;
        }
        break;
    }
    return height;
}

@end
