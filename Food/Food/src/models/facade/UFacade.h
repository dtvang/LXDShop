//
//  UFacade.h
//  Food
//
//  Created by Vang Doan on 5/7/15.
//  Copyright (c) 2015 vn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UEntityManager.h"
#import "UEntity.h"

#define kSQLCommandCreateTable @"CREATE TABLE IF NOT EXISTS %@ (%@ INTEGER PRIMARY KEY AUTOINCREMENT,%@)"

@interface UFacade : NSObject

@property (strong, nonatomic) Class entityClass;
@property (strong, nonatomic) UEntityManager *entityManager;

+(id)getInstance;
- (Class)getDefaultEntityClass;
- (void)createTable;

- (int)create:(UEntity *)pEntity;

- (id)findById:(NSInteger)pIdentity;

- (int)remove:(UEntity *)pEntity;

- (int)update:(UEntity *)pEntity;

@end
