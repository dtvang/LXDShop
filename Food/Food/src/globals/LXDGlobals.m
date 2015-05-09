//
//  LXDGlobals.m
//  Food
//
//  Created by Vang Doan on 5/7/15.
//  Copyright (c) 2015 vn. All rights reserved.
//

#import "LXDGlobals.h"
#import "UDatabase.h"
#import "LXDShopFacade.h"

static LXDGlobals *instance;

@implementation LXDGlobals

+ (LXDGlobals *)getInstance {
    if (!instance) {
        instance = [[[self class] alloc] init];
    }
    
    return instance;
}

- (void)createDatabase {
    // create table.
    [self loadDatabase];
}

- (void)loadDatabase
{
    [[UDatabase getInstance] openDB:kLXDShopDatabaseName];
    [[LXDShopFacade getInstance] createTable];
}

@end
