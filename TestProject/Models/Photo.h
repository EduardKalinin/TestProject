//
//  Photo.h
//  TestProject
//
//  Created by Developer on 7/11/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelProtocol.h"

@interface Photo : NSObject <ModelProtocol>

@property (assign, nonatomic) NSInteger identifier;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSURL *url;

@end
