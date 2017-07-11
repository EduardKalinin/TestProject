//
//  ModelProtocol.h
//  TestProject
//
//  Created by Developer on 7/11/17.
//  Copyright © 2017 Developer. All rights reserved.
//

@protocol ModelProtocol <NSObject>

- (instancetype)initWithJSON:(NSDictionary *)dict;
- (NSDictionary *)dictionaryReprisentation;

@end
