//
//  TransparentButton.m
//  TestProject
//
//  Created by Developer on 8/6/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "TransparentButton.h"

@implementation TransparentButton

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    self.alpha = highlighted ? 0.5 : 1.0;
}

@end
