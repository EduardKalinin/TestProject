//
//  PhotosService.h
//  TestProject
//
//  Created by Developer on 7/11/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotosService : NSObject

- (void)getObjectsWithCompletion:(void (^)(NSArray *items, NSError *error))completion;

@end
