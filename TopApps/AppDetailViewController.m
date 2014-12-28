//
//  AppDetailViewController.m
//  Assignments~Altimetrix
//
//  Created by Vinodh  on 26/11/14.
//  Copyright (c) 2014 Daston~Rhadnojnainva. All rights reserved.
//

#import "AppDetailViewController.h"
#import "App.h"
#import "UIImageView+Networking.h"
#import "DataManager.h"
#import "ScreenShotsCell.h"
#import "DescriptionCell.h"

@interface AppDetailViewController ()
@end

static CGFloat kStandardAnimationTime = 0.3f;

@implementation AppDetailViewController

- (void) showAppDetailViewFromParent:(UIViewController *)parent forAppDetail:(App *)appRecord
{
    self.appRecord = appRecord;
    
    self.view.alpha = 0.0;
    [parent.view addSubview:self.view];
    [parent addChildViewController:self];
    [UIView animateWithDuration:kStandardAnimationTime animations:^{
        self.view.alpha = 1.0f;
    } completion:^(BOOL finished) {
        
    }];
}

- (IBAction)close:(id)sender
{
    [UIView animateWithDuration:kStandardAnimationTime animations:^{
        self.view.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];
}

- (void)viewDidLoad
{
    self.tableView.tableFooterView = [UIView new];
//    self.tableView.estimatedRowHeight = 68.0;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"simpleCellId"];
    
    [[DataManager sharedManager] getDetailsForApp:self.appRecord withCompletionBlock:^(BOOL succes, App *appDetails, NSError *error) {
        [self.tableView reloadData];
    }];
    [super viewDidLoad];
}

#pragma mark -
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    switch (indexPath.row)
    {
        case 1:
        {
            DescriptionCell  *descriptioncell = [tableView dequeueReusableCellWithIdentifier:@"descriptionCellId"];
            [descriptioncell configureCellForApp:self.appRecord];
            cell = descriptioncell;
        }
        break;
            
        case 0:
        {
            ScreenShotsCell *screenShotCell = [tableView dequeueReusableCellWithIdentifier:@"ScreenShotsCellId"];
            cell = screenShotCell;
            [screenShotCell configureCellForApp:self.appRecord];
        }
        break;
    }
    
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rowHeight = 0.0;
    switch (indexPath.row)
    {
        case 0:
        {
            rowHeight = [UIScreen mainScreen].bounds.size.height - 44;
        }
        
        case 1:
        {
            rowHeight = tableView.rowHeight;
        }
    }
    return rowHeight;
}
@end
