//
//  UDatabase.h
//  Food
//
//  Created by Vang Doan on 5/7/15.
//  Copyright (c) 2015 vn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface UDatabase : NSObject

+ (UDatabase *)getInstance;
- (void) openDB:(NSString *) pName;
- (int)execute:(NSString *)pCommand;
- (sqlite3_stmt *)executeSelectCommad:(NSString *)pCommand;
- (int)executeStatementCommand:(sqlite3_stmt *)pStatement;
- (void)finalizeStatement:(sqlite3_stmt *)pStatement;
- (sqlite3 *)getDBInstance;
- (void)closeConnection;
@end
