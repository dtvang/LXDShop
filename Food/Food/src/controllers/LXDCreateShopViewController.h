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
#import "LXDDropDownList.h"
#import "LXDGlobals.h"

@interface LXDCreateShopViewController : LXDTemplateViewController <LXImageSourceDelegate,UIPopoverPresentationControllerDelegate, LXDDropDownListDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *constantSpaceAddInfoWithImageView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *constantSpaceAddInfoWithMapView;
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
@property (weak, nonatomic) IBOutlet UILabel *lbAvatar;
@property (weak, nonatomic) IBOutlet UILabel *lbPromptAvatar;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewAvatar;
@property (weak, nonatomic) IBOutlet UITextField *tfPhone;
@property (weak, nonatomic) IBOutlet UITextField *tfAddress;

@property (weak, nonatomic) IBOutlet UIView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *btnAddInfo;
@property (weak, nonatomic) IBOutlet UIButton *btnGetPosition;
@property (weak, nonatomic) IBOutlet UITextField *tfNameShop;

@property (weak, nonatomic) IBOutlet UIButton *btnDropCountry;

@property (weak, nonatomic) IBOutlet UIButton *btnDropProvince;
@property (weak, nonatomic) IBOutlet UIButton *btnDropDistrict;

@property (weak, nonatomic) IBOutlet UIButton *btnDropBusiness;
@property (weak, nonatomic) IBOutlet UIImageView *imageOne;
@property (weak, nonatomic) IBOutlet UILabel *lbCountry;
@property (weak, nonatomic) IBOutlet UILabel *lbProvince;
@property (weak, nonatomic) IBOutlet UILabel *lbDistrict;
@property (weak, nonatomic) IBOutlet UILabel *lbBusinessMethod;
@property (weak, nonatomic) IBOutlet UIImageView *imageTwo;
@property (weak, nonatomic) IBOutlet UIImageView *imageThree;
@property (weak, nonatomic) IBOutlet UIImageView *imageFour;
@property (weak, nonatomic) IBOutlet UIImageView *imageFive;

- (IBAction)closeClicked:(id)sender;
- (IBAction)openCameraClicked:(id)sender;
- (IBAction)saveInfoClicked:(id)sender;
- (IBAction)getPositionClicked:(id)sender;
- (IBAction)gotoWebsite:(id)sender;
- (IBAction)addMoreInfoClicked:(id)sender;
- (IBAction)showListCountry:(id)sender;
- (IBAction)showListDistrict:(id)sender;
- (IBAction)showListMethodBusiness:(id)sender;

- (IBAction)showListProvince:(id)sender;

@end

