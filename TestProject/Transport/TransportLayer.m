//
//  TransportLayer.m
//  TestProject
//
//  Created by Developer on 7/10/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "TransportLayer.h"

@interface TransportLayer ()

@property (strong, nonatomic) NSURLSession *session;

@end

@implementation TransportLayer

- (instancetype)init {
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        configuration.requestCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        self.session = [NSURLSession sessionWithConfiguration:configuration];
    }
    return self;
}

- (void)downloadFileWithURL:(NSURL *)url completion:(void (^)(NSData *, NSError *))completion {
    [self.session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            completion(nil, error);
        } else {
            NSData *data = [NSData dataWithContentsOfURL:location];
            completion(data, error);
        }
    }];
}

@end
