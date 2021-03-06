//
//  UFacade.m
//  Food
//
//  Created by Vang Doan on 5/7/15.
//  Copyright (c) 2015 vn. All rights reserved.
//

#import "UFacade.h"

@implementation UFacade

+(id)getInstance {
    return nil;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self initConfiguration];
    }
    
    return self;
}

- (Class)getDefaultEntityClass
{
    return [UEntity class];
}

- (void)initConfiguration
{
    self.entityClass  = [self getDefaultEntityClass];
    self.entityManager = [UEntityManager getInstance];
}

- (void)createTable {
    [self.entityManager createTable:[self getDefaultEntityClass]];
}

- (int)create:(UEntity *)pEntity {
    return [self.entityManager persit:pEntity];
}

- (int)remove:(UEntity *)pEntity {
    return [self.entityManager delete:pEntity];
}

- (int)update:(UEntity *)pEntity {
    return [self.entityManager update:pEntity];
}

@end
