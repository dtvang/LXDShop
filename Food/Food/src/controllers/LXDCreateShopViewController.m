//
//  LXDCreateShopViewController.m
//  Food
//
//  Created by zVCTz on 5/4/15.
//  Copyright (c) 2015 vn. All rights reserved.
//

#import "LXDCreateShopViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface LXDCreateShopViewController ()
{
     GMSMapView *gMapView;
}
@end

@implementation LXDCreateShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
                                                            longitude:151.20
                                                                 zoom:6];
    gMapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    gMapView.myLocationEnabled = YES;
    [self.mapView addSubview:gMapView];
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
    marker.title = @"Sydney";
    marker.snippet = @"Australia";
    marker.map = gMapView;
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.scrollView.contentSize = self.contentView.frame.size;
    gMapView.frame = CGRectMake(0.0f, 0.0f, self.mapView.frame.size.width, self.mapView.frame.size.height);
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

- (IBAction)closeClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)openCameraClicked:(id)sender {
    self.imageSourceControl  = [[LXDImageSource alloc] init];
    self.imageSourceControl.delegate = self;
    [self.imageSourceControl openInController:self];
}

- (IBAction)saveInfoClicked:(id)sender {
}

- (IBAction)getPositionClicked:(id)sender {
}

- (IBAction)gotoWebsite:(id)sender {
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.btnWebsite.titleLabel.text]];
}

#pragma mark - LXImageSourceDelegate

- (void)imageSelected:(UIImage *)image {
    self.imageOne.image = image;
}

@end
