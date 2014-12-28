//
//  AppDetailViewController.h
//  Assignments~Altimetrix
//
//  Created by Vinodh  on 26/11/14.
//  Copyright (c) 2014 Daston~Rhadnojnainva. All rights reserved.
//

#import <UIKit/UIKit.h>
@class App;
@interface AppDetailViewController : UITableViewController
@property (nonatomic) App *appRecord;
- (void) showAppDetailViewFromParent:(UIViewController *)parent forAppDetail:(App *)appRecord;
@end
