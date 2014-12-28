//
//  ViewController.m
//  Top Apps
//
//  Created by Vinodh  on 27/12/14.
//  Copyright (c) 2014 Daston~Rhadnojnainva. All rights reserved.
//

#import "AppListViewController.h"
#import "DataManager.h"
#import "AppCell.h"
#import "AppDetailViewController.h"

@interface AppListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) NSArray *apps;
@property (nonatomic) NSString *loadingTitle;
@end

@implementation AppListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.loadingTitle = @"Loading ...";
    __weak AppListViewController *weakSelf = self;
    [[DataManager sharedManager] getTopPaidAppswithCompletionBlock:^(BOOL succes, NSArray *appRecords, NSError *error) {
        if (succes)
        {
            weakSelf.apps = appRecords;
        }
        else
        {
            self.loadingTitle = @"Network issue try again";
        }
        [weakSelf.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];        
    }];
    
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = self.apps.count ? self.apps.count : 1;
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (self.apps.count)
    {
        AppCell *appCell = [tableView dequeueReusableCellWithIdentifier:@"AppCellID"];
        [appCell configureCellForAppRecord:self.apps[indexPath.row]];
        cell = appCell;
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
#pragma mark UIStoryBoard Related

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"addDetailsSegueId"])
    {
        AppDetailViewController *detailViewController = segue.destinationViewController;
        
        NSIndexPath *path = [self.tableView indexPathForCell:sender];
        detailViewController.appRecord = self.apps[path.row];
        [self.tableView deselectRowAtIndexPath:path animated:YES];
    }
}
@end
