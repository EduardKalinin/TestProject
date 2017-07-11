//
//  Photo.m
//  TestProject
//
//  Created by Developer on 7/11/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initWithJSON:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.identifier = [dict[@"photoID"] integerValue];
        self.name = [dict[@"photoName"] capitalizedString];
        self.url = [NSURL URLWithString:dict[@"photoURL"]];
    }
    return self;
}

- (NSDictionary *)dictionaryReprisentation {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"photoID"] = @(self.identifier);
    dict[@"photoName"] = self.name;
    dict[@"photoURL"] = self.url.absoluteString;
    
    return dict;
}

@end
