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
- (int)executeRequest:(NSString *)pCommand;
- (void)closeConnection;
@end
