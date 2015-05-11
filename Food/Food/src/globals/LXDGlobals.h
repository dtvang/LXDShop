//
//  LXDGlobals.h
//  Food
//
//  Created by Vang Doan on 5/7/15.
//  Copyright (c) 2015 vn. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kLXDShopDatabaseName    @"LXDShop"

@interface LXDGlobals : NSObject

+ (LXDGlobals *)getInstance;
- (void)createDatabase;
- (NSMutableArray *) getCountries;
- (NSMutableArray *) getProvinces;
- (NSMutableArray *) getDistricts;
- (NSMutableArray *) getBusinessMethods;
@end
