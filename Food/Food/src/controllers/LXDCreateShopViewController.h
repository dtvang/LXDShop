//
//  LXDCreateShopViewController.h
//  Food
//
//  Created by zVCTz on 5/4/15.
//  Copyright (c) 2015 vn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXDTemplateViewController.h"
#import "LXDImageSource.h"

@interface LXDCreateShopViewController : LXDTemplateViewController <LXImageSourceDelegate>

@property (strong, nonatomic) LXDImageSource *imageSourceControl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *btnWebsite;
@property (weak, nonatomic) IBOutlet UIButton *btnCamera;
@property (weak, nonatomic) IBOutlet UIButton *btnSaveInfo;

@property (weak, nonatomic) IBOutlet UIView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *btnAddInfo;
@property (weak, nonatomic) IBOutlet UIButton *btnGetPosition;

@property (weak, nonatomic) IBOutlet UIButton *btnDropCountry;

@property (weak, nonatomic) IBOutlet UIButton *btnDropProvince;
@property (weak, nonatomic) IBOutlet UIButton *btnDropDistrict;

@property (weak, nonatomic) IBOutlet UILabel *btnDropBusiness;
@property (weak, nonatomic) IBOutlet UIImageView *imageOne;

- (IBAction)closeClicked:(id)sender;
- (IBAction)openCameraClicked:(id)sender;
- (IBAction)saveInfoClicked:(id)sender;
- (IBAction)getPositionClicked:(id)sender;
- (IBAction)gotoWebsite:(id)sender;

@end

