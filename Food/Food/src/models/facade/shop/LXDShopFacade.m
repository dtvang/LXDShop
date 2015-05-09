//
//  LXDShopFacade.m
//  Food
//
//  Created by Vang Doan on 5/7/15.
//  Copyright (c) 2015 vn. All rights reserved.
//

#import "LXDShopFacade.h"
#define kUFactorySQLCommandCreateTable @"CREATE TABLE IF NOT EXISTS %@ (%@ INTEGER PRIMARY KEY AUTOINCREMENT,%@)"

@implementation LXDShopFacade

- (Class)getDefaultEntityClass {
    return  [self class];
}

@end
