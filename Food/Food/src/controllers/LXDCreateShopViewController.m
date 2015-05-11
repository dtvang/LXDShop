//
//  LXDCreateShopViewController.m
//  Food
//
//  Created by zVCTz on 5/4/15.
//  Copyright (c) 2015 vn. All rights reserved.
//

#import "LXDCreateShopViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "LXDShopFacade.h"

@interface LXDCreateShopViewController ()

@property (strong, nonatomic) GMSMapView *gMapView;
@property (assign, nonatomic) int indexImage;
@property (assign, nonatomic) int indexImageAvatar;
@property (assign, nonatomic) int indexImageSelected;
@property (assign, nonatomic) BOOL isModeChangeImage;
@property (strong, nonatomic) NSMutableArray *imageSelectedManager;
@property (strong, nonatomic) NSMutableArray *imageViewsManager;
@property (strong, nonatomic) UIImageView *imageViewSelected;

@end

@implementation LXDCreateShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.indexImage = 0;
    self.indexImageSelected = 0;
    self.indexImageAvatar = -1;
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
                                                            longitude:151.20
                                                                 zoom:6];
    self.gMapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    self.gMapView.myLocationEnabled = YES;
    [self.mapView addSubview: self.gMapView];
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
    marker.title = @"Sydney";
    marker.snippet = @"Australia";
    marker.map = self.gMapView;
    
    self.imageSelectedManager = [[NSMutableArray alloc] initWithCapacity:5];
    self.imageViewsManager = [[NSMutableArray alloc] initWithArray:@[self.imageOne, self.imageTwo, self.imageThree, self.imageFour, self.imageFive]];
    // [self hideAvatarView];
    
    [self decorateUI];
}


- (void) addTapGestureForImageView:(UIImageView *)imageView {
    if  (imageView.gestureRecognizers.count == 0) {
        UITapGestureRecognizer *newTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped:)];
        [imageView setUserInteractionEnabled:YES];
        [imageView addGestureRecognizer:newTap];
    }
}

- (void) removeTapGestureForImageView:(UIImageView *)imageView {
    NSArray *gestures = imageView.gestureRecognizers;
    for(UIGestureRecognizer *gesture in gestures) {
        if([gesture isKindOfClass: [UITapGestureRecognizer class]]) {
            [imageView removeGestureRecognizer:gesture];
            break;
        }
    }
}

- (void)getCurrentIndexImageSelect:(UIImageView *)imageView {
    if (imageView == self.imageOne) {
        self.indexImageSelected = 0;
    } else if (imageView == self.imageTwo) {
        self.indexImageSelected = 1;
    } else if (imageView == self.imageThree) {
        self.indexImageSelected = 2;
    } else if (imageView == self.imageFour) {
        self.indexImageSelected = 3;
    } else if (imageView == self.imageFive) {
        self.indexImageSelected = 4;
    }
}

- (void)imageTapped:(UITapGestureRecognizer *) sender {
    UIImageView *imageView  = (UIImageView *)sender.view;
    [self getCurrentIndexImageSelect:imageView];
    self.imageViewSelected = imageView;
    [self showOptionActionWithImage:imageView];
}

- (void) showOptionActionWithImage:(UIImageView *)imageView {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"Huỷ"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Làm ảnh đại diện", @"Thay hình", @"Xoá hình", nil];
    [actionSheet showInView:self.view];
    
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.scrollView.contentSize = self.contentView.frame.size;
    self.gMapView.frame = CGRectMake(0.0f, 0.0f, self.mapView.frame.size.width, self.mapView.frame.size.height);
}

- (void) decorateUI
{
    self.informationView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.informationView.layer.borderWidth = 1.0f;
    
    self.imageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.imageView.layer.borderWidth = 1.0f;
    
    self.avatarView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.avatarView.layer.borderWidth = 1.0f;
    
    self.contentMapView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.contentMapView.layer.borderWidth = 1.0f;
}

- (void) hideAvatarView {
    self.avatarView.hidden = YES;
    self.constantSpaceAddInfoWithImageView.constant = 15.0f;
    [self.btnAddInfo setNeedsUpdateConstraints];
}

- (void) showAavatarView {
    self.avatarView.hidden = NO;
    self.constantSpaceAddInfoWithImageView.constant = 93.0f;
    [self.btnAddInfo setNeedsUpdateConstraints];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void) showPopViewFromSender:(UIButton *)sender type:(TYPE_DATA)type withData:(NSMutableArray *)data
{
    LXDDropDownList *dropList = [[LXDDropDownList alloc] initWithNibName:@"LXDDropDownList" bundle:nil];
    dropList.delegate = self;
    CGRect frame = [sender.superview convertRect:sender.frame toView:self.view];
    [dropList presentPopoverFromRect:frame inViewController:self withType:type andData:data];
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}


- (IBAction)closeClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)openCameraClicked:(id)sender {
    self.isModeChangeImage = FALSE;
    self.imageSourceControl  = [[LXDImageSource alloc] init];
    self.imageSourceControl.delegate = self;
    [self.imageSourceControl openInController:self];
}

- (IBAction)saveInfoClicked:(id)sender {
    ShopEntity *sEntity = [[ShopEntity alloc] init];
    sEntity.name = self.tfNameShop.text;
    sEntity.numberPhone = self.tfPhone.text;
    sEntity.address = self.tfAddress.text;
    sEntity.country = self.lbCountry.text;
    sEntity.province = self.lbProvince.text;
    sEntity.district = self.lbDistrict.text;
    sEntity.businessMethod = self.lbBusinessMethod.text;
    sEntity.website = self.btnWebsite.titleLabel.text;
    
    [[LXDShopFacade getInstance] create:sEntity];
    
}

- (IBAction)getPositionClicked:(id)sender {
}

- (IBAction)gotoWebsite:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.btnWebsite.titleLabel.text]];
}

- (IBAction)addMoreInfoClicked:(id)sender {
    [self performSegueWithIdentifier:@"AddMoreInformation" sender:self];
}

- (IBAction)showListCountry:(id)sender {
    [self showPopViewFromSender:sender type:COUNTRY withData:[[LXDGlobals getInstance] getCountries]];
}

- (IBAction)showListDistrict:(id)sender {
    [self showPopViewFromSender:sender type:DISTRICT withData:[[LXDGlobals getInstance] getDistricts]];
}

- (IBAction)showListMethodBusiness:(id)sender {
    [self showPopViewFromSender:sender type:BUSINESS_MEHTOD withData:[[LXDGlobals getInstance] getBusinessMethods]];
}

- (IBAction)showListProvince:(id)sender {
    [self showPopViewFromSender:sender type:PROVINCE withData:[[LXDGlobals getInstance] getProvinces]];
}

#pragma mark - LXImageSourceDelegate

- (void)imageSelected:(UIImage *)image {
    
    if (self.avatarView.hidden) {
        [self showAavatarView];
    }
    int currentIndex = 0;
    if (self.isModeChangeImage) {
        currentIndex = self.indexImageSelected;
        self.imageViewSelected.image = image;
    } else {
        currentIndex = self.indexImage;
        if (self.indexImage == 0) {
            self.indexImage = 1;
            self.imageOne.image = image;
            [self addTapGestureForImageView:self.imageOne];
        } else if (self.indexImage == 1) {
            self.indexImage = 2;
            self.imageTwo.image = image;
            [self addTapGestureForImageView:self.imageTwo];
            
        } else if (self.indexImage == 2) {
            self.indexImage = 3;
            self.imageThree.image = image;
            [self addTapGestureForImageView:self.imageThree];
        } else if (self.indexImage == 3) {
            self.indexImage = 4;
            self.imageFour.image = image;
            [self addTapGestureForImageView:self.imageFour];
        } else if (self.indexImage == 4) {
            self.indexImage = 0;
            self.imageFive.image = image;
            [self addTapGestureForImageView:self.imageFive];
        }
    }
    
    [self.imageSelectedManager setObject:image atIndexedSubscript:currentIndex];
    
}

- (void) setImageFlexible {
    for (int i = 0; i < self.imageSelectedManager.count; i++) {
        UIImage *image = [self.imageSelectedManager objectAtIndex:i];
        UIImageView *imageView = [self.imageViewsManager objectAtIndex:i];
        imageView.image = image;
        [self addTapGestureForImageView:imageView];
    }
    
    int begin = (int)self.imageSelectedManager.count;
    
    for (int i = begin; i < self.imageViewsManager.count; i++) {
        UIImageView *imageView = [self.imageViewsManager objectAtIndex:i];
        imageView.image = [UIImage imageNamed:@"image_placeholder"];
        [self removeTapGestureForImageView:imageView];
    }
    
    
}

#pragma mark - UIActionSheetDelegate

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
        self.indexImageAvatar = self.indexImageSelected;
        [self setAvatarWithImage:self.imageViewSelected.image];
    } else if (buttonIndex == 1) {
        self.isModeChangeImage = TRUE;
        [self.imageSourceControl openInController:self];
    } else if (buttonIndex == 2) {
        [self.imageSelectedManager removeObject:self.imageViewSelected.image];
        
        self.indexImage = self.indexImage - 1;
        [self setImageFlexible];
        
        if (self.indexImageAvatar == self.indexImageSelected) {
            self.imageViewAvatar.image = self.imageOne.image;
              if (self.imageSelectedManager.count == 0) {
                  self.indexImageAvatar = -1;
              } else {
                  self.indexImageAvatar = 0;
              }
        }
    }
}

- (void)setAvatarWithImage:(UIImage *)image {
    self.imageViewAvatar.image = image;
}


#pragma mark - LXDDropDownListDelegate
- (void) selected:(LXDDropDownList *)source withData:(NSString *)text ofType:(TYPE_DATA)type
{
    switch (type) {
        case COUNTRY:
            self.lbCountry.text = text;
            break;
        case PROVINCE:
            self.lbProvince.text = text;
            break;
        case DISTRICT:
            self.lbDistrict.text = text;
            break;
        case BUSINESS_MEHTOD:
            self.lbBusinessMethod.text = text;
            break;
        default:
            break;
    }
}

@end
