//
//  UDatabase.m
//  Food
//
//  Created by Vang Doan on 5/7/15.
//  Copyright (c) 2015 vn. All rights reserved.
//

#import "UDatabase.h"
static UDatabase *instance;

@interface UDatabase()
{
     sqlite3 *db;
}
@end

@implementation UDatabase

+ (UDatabase *)getInstance
{
    if (!instance)
        instance    =   [[[self class] alloc] init];
    
    return instance;
}

#pragma mark - Private methods

- (NSString *)getFilePath:(NSString *)pDatabaseName
{
    NSArray *tPath  =   NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, TRUE);
    
    NSString *tDocumentDir   =   [tPath objectAtIndex:0];
    NSString *tDbName        =  [NSString stringWithFormat:@"%@_database", pDatabaseName];
    tDbName  =   [tDbName stringByAppendingPathExtension:@"sqlite"];
    tDocumentDir =   [tDocumentDir stringByAppendingPathComponent:tDbName];
     NSLog(@"Database was opened : %@",tDocumentDir);
    return tDocumentDir;
}

- (void)openDB:(NSString *)pDatabaseName
{
    NSString *tServerPath =   [self getFilePath:pDatabaseName];
    
    if (sqlite3_open([tServerPath UTF8String], &db) != SQLITE_OK) {
        [self closeConnection];
        NSAssert(0, @"Database failed to open.");
    } else {
        NSLog(@"Database was opened");
    }
}

- (int)execute:(NSString *)pCommand
{
    char *tErrorMessage;
    int tError = sqlite3_exec(db, [pCommand UTF8String], NULL, NULL, &tErrorMessage);
    if (tError != SQLITE_OK) {
        NSLog(@"Error : Cannot execute a command : %@ : %@", [NSString stringWithCString:tErrorMessage encoding:NSUTF8StringEncoding],pCommand);
    }
    
    return tError;
}

- (sqlite3_stmt *)executeSelectCommad:(NSString *)pCommand
{
    return [self exeSelect:pCommand];
}

- (int)executeStatementCommand:(sqlite3_stmt *)pStatement
{
    return sqlite3_step(pStatement);
}


- (void)finalizeStatement:(sqlite3_stmt *)pStatement
{
    sqlite3_finalize(pStatement);
}

- (sqlite3_stmt *)exeSelect:(NSString *)pCommand
{
    sqlite3_stmt *tStatement;
    int i = sqlite3_prepare_v2(db, [pCommand UTF8String], -1, &tStatement, NULL);
    
    if (i != SQLITE_OK)
    {
        tStatement = nil;
        NSLog(@"error command : %s : %@", sqlite3_errmsg(db), pCommand);
    }
    return tStatement;
}

- (sqlite3 *)getDBInstance
{
    return db;
}

- (void)closeConnection
{
    sqlite3_close(db);
    db  =   nil;
}

@end
