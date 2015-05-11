//
//  FactorySQLCommand.h
//  Food
//
//  Created by Vang Doan on 5/11/15.
//  Copyright (c) 2015 vn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FactorySQLCommand : NSObject
+ (FactorySQLCommand *)getInstance;
- (NSString *)getCreateRow:(UEntity *)pEntity;
@end
