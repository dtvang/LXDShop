//
//  ShopEntity.h
//  Food
//
//  Created by Vang Doan on 5/7/15.
//  Copyright (c) 2015 vn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UEntity.h"
@interface ShopEntity : UEntity

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *numberPhone;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *country;
@property (strong, nonatomic) NSString *province;
@property (strong, nonatomic) NSString *district;
@property (strong, nonatomic) NSString *businessMethod;
@property (strong, nonatomic) NSString *website;

@end
