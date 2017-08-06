//
//  NewTransportLayer.m
//  TestProject
//
//  Created by Developer on 7/30/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "NewTransportLayer.h"
#import <UIKit/UIKit.h>

@interface NewTransportLayer() <NSURLSessionDelegate>

@property (strong, nonatomic) NSURLSession *session;
@property (strong, nonatomic) NSURLSessionDownloadTask *downloadTask;

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
    
    self.downloadTask = [self.session downloadTaskWithURL:url];
    [self.downloadTask resume];
}

- (void)suspendDownload {
    if (self.downloadTask.state == NSURLSessionTaskStateRunning) {
        [self.downloadTask suspend];
    }
}

- (void)resumeDownload {
    if (self.downloadTask.state == NSURLSessionTaskStateSuspended) {
        [self.downloadTask resume];
    }
}

- (void)cancelDownload {
    if (self.downloadTask.state == NSURLSessionTaskStateRunning) {
        [self.downloadTask cancel];
    }
}

#pragma mark - NSURLSessionDelegate

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(nullable NSError *)error {
    __weak NewTransportLayer *weakself = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (weakself.failure && error && error.code != NSURLErrorCancelled) {
            weakself.failure(error);
        }
    });
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
didBecomeDownloadTask:(NSURLSessionDownloadTask *)downloadTask {
    NSLog(@"didBecomeDownloadTask");
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location {
    
    __weak NewTransportLayer *weakself = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (weakself.success) {
            weakself.success();
        }
    });
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    
    __weak NewTransportLayer *weakself = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (weakself.progress && downloadTask.state != NSURLSessionTaskStateCanceling) {
            weakself.progress((CGFloat)totalBytesWritten / (CGFloat)totalBytesExpectedToWrite);
        }
    });
}

@end
