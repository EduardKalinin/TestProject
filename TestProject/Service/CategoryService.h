//
//  CategoryService.h
//  TestProject
//
//  Created by Developer on 7/11/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CategoryService : NSObject

+ (CategoryService *)sharedInstance;

- (void)getObjectsWithCompletion:(void (^)(NSArray *items, NSError *error))completion;
- (void)getImageWithUrl:(NSURL *)url completion:(void (^)(UIImage *image, NSError *error))completion;

@end
