//
//  FactorySQLCommand.m
//  Food
//
//  Created by Vang Doan on 5/11/15.
//  Copyright (c) 2015 vn. All rights reserved.
//

#import "FactorySQLCommand.h"
#import "ShopEntity.h"

#define kUServiceProviderCreateCommand      @"INSERT INTO %@ %@ VALUES %@"

static FactorySQLCommand *instance;

@implementation FactorySQLCommand

+ (FactorySQLCommand *)getInstance {
    if (!instance) {
        instance = [[[self class] alloc] init];
    }
    
    return  instance;
}

- (NSString *)getCreateRow:(UEntity *)pEntity {
    
    NSString *commandInsert = @"";
    
    if ([pEntity isKindOfClass:[ShopEntity class]]) {
        NSString * tColumns =   @"(name, numberPhone, address, country, province, district, businessMethod, website)";
        NSString * tValues  =   @"(?, ?, ?, ?, ?, ? ,? ,?)";
        
        commandInsert = [NSString stringWithFormat:kUServiceProviderCreateCommand, @"Shop", tColumns, tValues];
    } else {
        
    }
    
    return commandInsert;
}

@end
