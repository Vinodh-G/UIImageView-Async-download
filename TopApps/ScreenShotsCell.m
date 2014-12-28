//
//  ScreenShotsCell.m
//  Assignments~Altimetrix
//
//  Created by Vinodh  on 14/12/14.
//  Copyright (c) 2014 Daston~Rhadnojnainva. All rights reserved.
//

#import "ScreenShotsCell.h"
#import "ImageCell.h"
#import "App.h"

@interface ScreenShotsCell () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) App *app;
@end

@implementation ScreenShotsCell

- (void)awakeFromNib
{
    [self.collectionView registerClass:[ImageCell class] forCellWithReuseIdentifier:@"imageCellId"];

}

- (void)configureCellForApp:(App *)app
{
    self.app = app;
    [self.collectionView reloadData];
}

#pragma mark -
#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;//self.app.screenshotURLs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageCellId" forIndexPath:indexPath];
//    [cell configureCellForURL:self.app.screenshotURLs[indexPath.item]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [UIScreen mainScreen].bounds.size;
}
@end
