//
//  LXDShopFacade.m
//  Food
//
//  Created by Vang Doan on 5/7/15.
//  Copyright (c) 2015 vn. All rights reserved.
//

#import "LXDShopFacade.h"

static LXDShopFacade *instance;

@implementation LXDShopFacade

+ (id)getInstance {
    if(!instance) {
        instance = [[[self class] alloc] init];
    }
    
    return instance;
}

- (Class)getDefaultEntityClass {
    return  [ShopEntity class];
}

@end
