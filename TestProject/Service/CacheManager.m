//
//  CacheManager.m
//  TestProject
//
//  Created by Developer on 7/12/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "CacheManager.h"

@interface CacheManager()

@end

@implementation CacheManager

+ (BOOL)fileExistsWithName:(NSString *)name {
    NSString *fullPath = [CacheManager getFullPathForFileWithName:name];
    return [[NSFileManager defaultManager] fileExistsAtPath:fullPath];
}

+ (NSData *)getDataWithName:(NSString *)name {
    if ([CacheManager fileExistsWithName:name]) {
        return [[NSFileManager defaultManager] contentsAtPath:[CacheManager getFullPathForFileWithName:name]];
    }
    return nil;
}

+ (void)saveData:(NSData *)data withName:(NSString *)name {
    [CacheManager createDirectory];
    [[NSFileManager defaultManager] createFileAtPath:[CacheManager getFullPathForFileWithName:name] contents:data attributes:nil];
}

+ (NSString *)getHomeDirectory {
    NSString *homeDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    homeDirectory = [homeDirectory stringByAppendingPathComponent:@"cache"];
    homeDirectory = [homeDirectory stringByAppendingPathComponent:@"images"];
    return homeDirectory;
}

+ (void)createDirectory {
    BOOL isDirectory;
    [[NSFileManager defaultManager] fileExistsAtPath:[CacheManager getHomeDirectory] isDirectory:&isDirectory];
    
    if (!isDirectory) {
        NSError *error;
        [[NSFileManager defaultManager] createDirectoryAtPath:[CacheManager getHomeDirectory] withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }
}

+ (NSString *)getFullPathForFileWithName:(NSString *)name {
    NSString *fullPath = [CacheManager getHomeDirectory];
    fullPath = [fullPath stringByAppendingPathComponent:name.lastPathComponent];
    return fullPath;
}

+ (void)removeDirectory {
    NSError *error;
    [[NSFileManager defaultManager] removeItemAtPath:[CacheManager getHomeDirectory] error:&error];
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}

@end
