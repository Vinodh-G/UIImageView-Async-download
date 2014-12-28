//
//  ScreenShotsCell.m
//  Top Apps
//
//  Created by Vinodh  on 27/12/14.
//  Copyright (c) 2014 Daston~Rhadnojnainva. All rights reserved.
//

#import "ScreenShotsCell.h"
#import "ImagesViewController.h"
#import "App.h"

@interface ScreenShotsCell ()
@property (nonatomic) ImagesViewController *imageCollectionViewController;

@property (nonatomic) App *app;
@end

@implementation ScreenShotsCell

- (void)awakeFromNib
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.imageCollectionViewController = [storyBoard instantiateViewControllerWithIdentifier:@"ImagesViewCOntrollerId"];
    
    [self.parentViewController addChildViewController:self.imageCollectionViewController];
    [self.contentView addSubview:self.imageCollectionViewController.view];
    
    UIView *subView = self.imageCollectionViewController.view;
    
    [subView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-0-[subView]-0-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(subView)]];
    
    [self.contentView addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-0-[subView]-0-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(subView)]];
}

- (void)configureCellForApp:(App *)app
{
    self.app = app;
    [self.imageCollectionViewController configureCollectionViewForApp:app];
}

@end
