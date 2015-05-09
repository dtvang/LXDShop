//
//  LXDImageSource.h
//  Food
//
//  Created by Vang Doan on 5/6/15.
//  Copyright (c) 2015 vn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol LXImageSourceDelegate;

@interface LXDImageSource : NSObject <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (retain, nonatomic) UIViewController *parentController;
@property (weak, nonatomic) id<LXImageSourceDelegate> delegate;
- (void)openInController:(UIViewController *) controller;
@end

@protocol LXImageSourceDelegate <NSObject>

- (void)imageSelected:(UIImage *)image;

@end