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
    [[self.session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                completion ? completion(nil, error) : nil;
            } else {
                NSData *data = [NSData dataWithContentsOfURL:location];
                completion ? completion(data, error) : nil;
            }
        });
        
    }] resume];
}

- (void)getDataWithURL:(NSURL *)url completion:(void (^)(NSArray*, NSError *))transportCompletion {
    [[self.session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                transportCompletion ? transportCompletion(nil, error) : nil;
            } else {
                NSError *parsingError;
                NSArray* array = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parsingError];
                if (parsingError) {
                    transportCompletion ? transportCompletion(nil, parsingError) : nil;
                } else {
                    transportCompletion ? transportCompletion(array, nil) : nil;
                }
            }
        });
        
    }] resume];
}

@end
