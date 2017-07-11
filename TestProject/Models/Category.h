//
//  Category.h
//  TestProject
//
//  Created by Developer on 7/11/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelProtocol.h"

@interface Category : NSObject <ModelProtocol>

@property (assign, nonatomic) NSInteger identifier;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSURL *url;
@property (strong, nonatomic) NSArray *photos;

@end
