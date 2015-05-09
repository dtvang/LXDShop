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

- (int)executeRequest:(NSString *)pCommand
{
    char *tErrorMessage;
    int tError = sqlite3_exec(db, [pCommand UTF8String], NULL, NULL, &tErrorMessage);
    if (tError != SQLITE_OK) {
        NSLog(@"Error : Cannot execute a command : %@ : %@", [NSString stringWithCString:tErrorMessage encoding:NSUTF8StringEncoding],pCommand);
    }
    
    return tError;
}

- (void)closeConnection
{
    sqlite3_close(db);
    db  =   nil;
}

@end
