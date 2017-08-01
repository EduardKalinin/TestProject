//
//  NewTransportLayer.m
//  TestProject
//
//  Created by Developer on 7/30/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "NewTransportLayer.h"

@interface NewTransportLayer() <NSURLSessionDelegate>

@property (strong, nonatomic) NSURLSession *session;

@property (copy, nonatomic) void (^success)(void);
@property (copy, nonatomic) void (^failure)(NSError *error);
@property (copy, nonatomic) void (^progress)(CGFloat progress);

@end

@implementation NewTransportLayer

- (instancetype)init {
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        configuration.requestCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        self.session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    }
    return self;
}

- (void)downloadFileWithURL:(NSURL *)url success:(void (^)())success failure:(void (^)(NSError *))failure progress:(void (^)(CGFloat))progress {
    self.success = success;
    self.failure = failure;
    self.progress = progress;
    [[self.session downloadTaskWithURL:url] resume];
}

#pragma mark - NSURLSessionDelegate

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(nullable NSError *)error {
    if (self.failure) {
        self.failure(error);
    }
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
didBecomeDownloadTask:(NSURLSessionDownloadTask *)downloadTask {
    NSLog(@"didBecomeDownloadTask");
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location {
    if (self.success) {
        self.success();
    }
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    if (self.progress) {
        self.progress(totalBytesWritten / totalBytesExpectedToWrite);
    }
}

@end
