//
//  TransportLayer.h
//  TestProject
//
//  Created by Developer on 7/10/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransportLayer : NSObject

- (void)downloadFileWithURL:(NSURL *)url completion:(void(^)(NSData *fileData, NSError *error))completion;
- (void)getDataWithURL:(NSURL *)url completion:(void (^)(NSData *data, NSError *error))transportCompletion;

@end
