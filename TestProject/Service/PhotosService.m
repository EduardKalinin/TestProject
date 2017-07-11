//
//  PhotosService.m
//  TestProject
//
//  Created by Developer on 7/11/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "PhotosService.h"
#import "TransportLayer.h"
#import "Photo.h"

@interface PhotosService()

@property (strong, nonatomic) TransportLayer *transport;

@end

@implementation PhotosService

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
                                    Photo *photo = [[Photo alloc] initWithJSON:item];
                                    [items addObject:photo];
                                }
                                if (completion) {
                                    completion(items, error);
                                }
                            }
                        }];
}

@end
