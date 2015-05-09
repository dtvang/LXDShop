//
//  LXDImageSource.m
//  Food
//
//  Created by Vang Doan on 5/6/15.
//  Copyright (c) 2015 vn. All rights reserved.
//

#import "LXDImageSource.h"

@implementation LXDImageSource

- (void)openInController:(UIViewController *) controller {
    self.parentController = controller;
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"Huỷ"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Dùng Camera", @"Dùng Gallery", nil];
    [actionSheet showInView:self.parentController.view];
}

#pragma mark - Private methods

- (void)openLibrary {
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self.parentController presentViewController:picker animated:YES completion:nil];
}

- (void)openCamera {
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController * picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self.parentController presentViewController:picker animated:YES completion:nil];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Camera is not available" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}


#pragma mark - UIActionSheetDelegate

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
        [self openCamera];
    } else if (buttonIndex == 1) {
        [self openLibrary];
    }
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *pickedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    if (self.delegate) {
        [self.delegate imageSelected:pickedImage];
    }
    
    [self.parentController dismissViewControllerAnimated:picker completion:nil];
}

@end
