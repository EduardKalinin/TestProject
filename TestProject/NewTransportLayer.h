//
//  NewTransportLayer.h
//  TestProject
//
//  Created by Developer on 7/30/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NewTransportLayer : NSObject

- (void)downloadFileWithURL:(NSURL *)url success:(void(^)())success failure:(void(^)(NSError *error))failure progress:(void(^)(CGFloat))progress;

@end
