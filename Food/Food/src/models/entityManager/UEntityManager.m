//
//  UEntityManager.m
//  Food
//
//  Created by Vang Doan on 5/7/15.
//  Copyright (c) 2015 vn. All rights reserved.
//

#import "UEntityManager.h"
#import "UDatabase.h"
#import "ShopEntity.h"
#import "LXDShopFacade.h"
#import "FactorySQLCommand.h"
static UEntityManager *instance;

@interface UEntityManager()

@property (strong, nonatomic) UDatabase *database;

@end

@implementation UEntityManager

+ (UEntityManager *)getInstance {
    if (!instance) {
        instance = [[[self class] alloc] init];
    }
    
    return  instance;
}

# pragma mark - Override methods

-(id)init
{
    self    =   [super init];
    if (self) {
        self.database = [UDatabase getInstance];
    }
    
    return self;
}

# pragma mark - Public methods

- (int)persit:(UEntity *)pEntity {

    int tResult = 0;
    
    if (self.database)
    {
        NSString * tCommand =  [[FactorySQLCommand getInstance] getCreateRow:pEntity];
        sqlite3_stmt * tStatement = [self.database executeSelectCommad:tCommand];
        [self bindParamsToStatement:tStatement fromEntity:pEntity];
        tResult =   [self.database executeStatementCommand:tStatement];
        [self.database finalizeStatement:tStatement];
        
        int tLastInsertedId =  (int)sqlite3_last_insert_rowid([self.database getDBInstance]);
        pEntity.id    =   tLastInsertedId;
        tResult =   tLastInsertedId;
    }
    
    return tResult;
}

- (int)update:(UEntity *)pEntity {
    
    return 1;
}

- (int)delete:(UEntity *)pEntity {
    
    return 1;
}

- (UEntity *)findAt:(UEntity *)pEntity entityClass:(Class)pEntityClass {
    return nil;
}

- (void)createTable:(Class)pEntityClass
{
    if (pEntityClass && self.database) {
        [self.database execute:[self getCreateTable:pEntityClass]];
    }
}

#pragma mark - Private method

- (NSString *)getCreateTable:(Class)pEntityClass {
    NSString *commandTable = @"";
    NSString *tableName = @"";
    if ([pEntityClass isSubclassOfClass:[ShopEntity class]]) {
        tableName = @"Shop";
        commandTable = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, numberPhone TEXT, address TEXT, country TEXT, province TEXT, district TEXT, businessMethod TEXT, website TEXT)", tableName];
    }
    
    return commandTable;
}

- (void)bindParamsToStatement:(sqlite3_stmt *)pStatement fromEntity:(UEntity *)pEntity
{
    if ([pEntity isMemberOfClass:[ShopEntity class]]) {
        ShopEntity *sEntity = (ShopEntity *)pEntity;
        
        sqlite3_bind_text(pStatement, 1, [sEntity.name UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(pStatement, 2, [sEntity.numberPhone UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(pStatement, 3, [sEntity.address UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(pStatement, 4, [sEntity.country UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(pStatement, 5, [sEntity.province UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(pStatement, 6, [sEntity.district UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(pStatement, 7, [sEntity.businessMethod UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(pStatement, 8, [sEntity.website UTF8String], -1, SQLITE_TRANSIENT);
    } else {
        NSLog(@"Entity not found!");
    }
}


@end
