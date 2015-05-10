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

@interface LXDCreateShopViewController : LXDTemplateViewController <LXImageSourceDelegate,UIPopoverPresentationControllerDelegate>

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *avatarViewHeight;
@property (strong, nonatomic) UIViewController *popView;
@property (strong, nonatomic) LXDImageSource *imageSourceControl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *btnWebsite;
@property (weak, nonatomic) IBOutlet UIButton *btnCamera;
@property (weak, nonatomic) IBOutlet UIButton *btnSaveInfo;
@property (weak, nonatomic) IBOutlet UIView *informationView;
@property (weak, nonatomic) IBOutlet UIView *imageView;
@property (weak, nonatomic) IBOutlet UIView *avatarView;
@property (weak, nonatomic) IBOutlet UIView *contentMapView;

@property (weak, nonatomic) IBOutlet UIView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *btnAddInfo;
@property (weak, nonatomic) IBOutlet UIButton *btnGetPosition;

@property (weak, nonatomic) IBOutlet UIButton *btnDropCountry;

@property (weak, nonatomic) IBOutlet UIButton *btnDropProvince;
@property (weak, nonatomic) IBOutlet UIButton *btnDropDistrict;

@property (weak, nonatomic) IBOutlet UILabel *btnDropBusiness;
@property (weak, nonatomic) IBOutlet UIImageView *imageOne;
@property (weak, nonatomic) IBOutlet UIView *viewCountry;

- (IBAction)closeClicked:(id)sender;
- (IBAction)openCameraClicked:(id)sender;
- (IBAction)saveInfoClicked:(id)sender;
- (IBAction)getPositionClicked:(id)sender;
- (IBAction)gotoWebsite:(id)sender;
- (IBAction)addMoreInfoClicked:(id)sender;
- (IBAction)showListCountry:(id)sender;


@end

