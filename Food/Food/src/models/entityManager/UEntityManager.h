//
//  UEntityManager.h
//  Food
//
//  Created by Vang Doan on 5/7/15.
//  Copyright (c) 2015 vn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UEntity.h"

@interface UEntityManager : NSObject

+ (UEntityManager *)getInstance;
- (void)createTable:(Class)pEntityClass;
- (int)persit:(UEntity *)pEntity;
- (int)update:(UEntity *)pEntity;
- (int)delete:(UEntity *)pEntity;
- (UEntity *)findAt:(UEntity *)pEntity entityClass:(Class)pEntityClass;

@end
