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
        sqlite3_stmt * tStatement = [self.database createStatementFromCommand:tCommand];
        [self bindParamsToStatement:tStatement fromEntity:pEntity];
        tResult =   [self.database executeStatementCommand:tStatement];
        [self.database finalizeStatement:tStatement];
    }
    
    if (tResult != kUDatabaseRollbackTransactionValue)
    {
        int tLastInsertedId =   sqlite3_last_insert_rowid([database getDBInstance]);
        pEntity.identity    =   [NSString stringWithFormat:@"%d", tLastInsertedId];
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
        [self.database executeRequest:[self getCreateTable:pEntityClass]];
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

@end
