//
//  CacheManager.h
//  TestProject
//
//  Created by Developer on 7/12/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheManager : NSObject

+ (BOOL)fileExistsWithName:(NSString *)name;
+ (NSData *)getDataWithName:(NSString *)name;
+ (void)saveData:(NSData *)data withName:(NSString *)name;
+ (void)removeDirectory;

@end
