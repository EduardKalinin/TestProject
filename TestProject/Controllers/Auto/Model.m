//
//  Model.m
//  TestProject
//
//  Created by Developer on 7/18/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "Model.h"

@implementation Model

static NSString *brand[] = {
    @"BMW", @"Audi", @"Mercedec", @"Honda", @"Volvo"
};

static NSString *modeli[] = {
    @"GOOD", @"Nice", @"Bad", @"So So", @"Very Nice"
};

+ (Model *)randomModel {
    CGFloat red = arc4random_uniform(255) / 255.0;
    CGFloat green = arc4random_uniform(255) / 255.0;
    CGFloat blue = arc4random_uniform(255) / 255.0;
    
    Model *model = [[Model alloc] init];
    model.brand = brand[arc4random_uniform(5)];
    model.model = modeli[arc4random_uniform(5)];
    model.year = [[NSDate date] dateByAddingTimeInterval:-arc4random_uniform(60 * 60 * 24 * 365 * 20)];
    model.color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    return model;
}

@end
