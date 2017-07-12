//
//  CategoryService.m
//  TestProject
//
//  Created by Developer on 7/11/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "CategoryService.h"
#import "TransportLayer.h"
#import "Category.h"
#import "CacheManager.h"

@interface CategoryService ()

@property (strong, nonatomic) TransportLayer *transport;

@end

@implementation CategoryService

+ (CategoryService *)sharedInstance {
    static CategoryService *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CategoryService alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.transport = [[TransportLayer alloc] init];
    }
    return self;
}

- (void)getObjectsWithCompletion:(void (^)(NSArray *, NSError *))completion {
    [self.transport getDataWithURL:[NSURL URLWithString:@"http://www.mocky.io/v2/5964f18326000059183d75a7"]
                        completion:^(NSArray *array, NSError *error) {
                            if (error) {
                                completion ? completion(nil, error) : nil;
                            } else {
                                NSMutableArray *items = [NSMutableArray array];
                                for (NSDictionary *item in array) {
                                    Category *category = [[Category alloc] initWithJSON:item];
                                    [items addObject:category];
                                }
                                if (completion) {
                                    completion ? completion(items, nil) : nil;
                                }
                            }
                        }];
}

- (void)getImageWithUrl:(NSURL *)url completion:(void (^)(UIImage *, NSError *))completion {
    if ([CacheManager fileExistsWithName:url.absoluteString]) {
        if (completion) {
            NSData *data = [CacheManager getDataWithName:url.absoluteString];
            UIImage *image = [UIImage imageWithData:data];
            completion ? completion(image, nil) : nil;
        }
    } else {
        __weak typeof(self) weakself = self;
        [self.transport downloadFileWithURL:url completion:^(NSData *fileData, NSError *error) {
            __strong typeof(self) strongSelf = weakself;
            if (strongSelf) {
                if (error) {
                    NSLog(@"%@", error.localizedDescription);
                } else {
                    [CacheManager saveData:fileData withName:url.absoluteString];
                    UIImage *image = [UIImage imageWithData:fileData];
                    completion ? completion(image, nil) : nil;
                }
            }
        }];
    }
}

@end
