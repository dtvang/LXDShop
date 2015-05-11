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

#pragma mark - Dummy Data

- (NSMutableArray *) getCountries {
    NSMutableArray *countries = [[NSMutableArray alloc] init];
    [countries addObject:@"Việt Nam"];
    [countries addObject:@"Nhật Bản"];
    [countries addObject:@"Trung Quốc"];
    
    return countries;
}

- (NSMutableArray *) getProvinces {
    NSMutableArray *provinces = [[NSMutableArray alloc] init];
    [provinces addObject:@"TP Hồ Chí Minh"];
    [provinces addObject:@"Ninh Thuận"];
    [provinces addObject:@"Đà Nẵng"];
    
    return provinces;
}


- (NSMutableArray *) getDistricts {
    NSMutableArray *districts = [[NSMutableArray alloc] init];
    [districts addObject:@"Quận 1"];
    [districts addObject:@"Quận 2"];
    [districts addObject:@"Quận 3"];
    
    return districts;
}

- (NSMutableArray *) getBusinessMethods {
    NSMutableArray *methods = [[NSMutableArray alloc] init];
    [methods addObject:@"Văn phòng đại diện"];
    [methods addObject:@"Liên doanh"];
    [methods addObject:@"Hợp tác kinh doanh"];
    return methods;
}


@end
