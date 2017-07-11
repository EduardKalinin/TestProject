//
//  Category.m
//  TestProject
//
//  Created by Developer on 7/11/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "Category.h"

@implementation Category

- (instancetype)initWithJSON:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.identifier = [dict[@"catID"] integerValue];
        self.name = [dict[@"catName"] capitalizedString];
        self.url = [NSURL URLWithString:dict[@"carURL"]];
        self.photos = [dict[@"photos"] array];
    }
    return self;}

- (NSDictionary *)dictionaryReprisentation {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"catID"] = @(self.identifier);
    dict[@"catName"] = self.name;
    dict[@"carURL"] = self.url.absoluteString;
    dict[@"photos"] = self.photos;
    
    return dict;
}

@end
