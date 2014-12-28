//
//  ImagesViewController.m
//  Top Apps
//
//  Created by Vinodh  on 27/12/14.
//  Copyright (c) 2014 Daston~Rhadnojnainva. All rights reserved.
//

#import "ImagesViewController.h"
#import "App.h"
#import "ImageCell.h"

@interface ImagesViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic) App *app;
@end

@implementation ImagesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)configureCollectionViewForApp:(App *)app
{
    self.app = app;
    [self.collectionView reloadData];
}

#pragma mark -
#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.app.screenshotURLs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageCellId" forIndexPath:indexPath];
    [cell configureCellForURL:self.app.screenshotURLs[indexPath.item]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [collectionView superview].frame.size;
}

@end
