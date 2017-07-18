//
//  AnimationV2ViewController.m
//  TestProject
//
//  Created by Developer on 7/16/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "AnimationV2ViewController.h"

@interface AnimationV2ViewController ()

@end

@implementation AnimationV2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self animation1];
    [self animation2];
}

- (void)animation1 {
    CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
    replicator.bounds = CGRectMake(0.0, 0.0, 60.0, 60.0);
    replicator.position = self.view.center;
    replicator.instanceCount = 3;
    replicator.instanceTransform = CATransform3DMakeTranslation(20.0, 0.0, 0.0);
    replicator.instanceDelay = 0.33;
    replicator.masksToBounds = YES;
    
    [self.view.layer addSublayer:replicator];
    
    CALayer *bar = [CALayer layer];
    bar.bounds = CGRectMake(0.0, 0.0, 8.0, 40.0);
    bar.position = CGPointMake(10.0, 75.0);
    bar.cornerRadius = 2.0;
    bar.backgroundColor = [UIColor redColor].CGColor;
    
    [replicator addSublayer:bar];
    
    CABasicAnimation *move = [CABasicAnimation animationWithKeyPath:@"position.y"];
    move.toValue = @(bar.position.y - 35.0);
    move.duration = 0.5;
    move.autoreverses = YES;
    move.repeatCount = CGFLOAT_MAX;
    
    [bar addAnimation:move forKey:nil];
}

- (void)animation2 {
    CFTimeInterval duration = 1.5;

    CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
    replicator.bounds = CGRectMake(0.0, 0.0, 200.0, 200.0);
    replicator.cornerRadius = 10.0;
    replicator.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.75].CGColor;
    replicator.position = self.view.center;
    NSInteger count = 15;
    replicator.instanceCount = count;
    CGFloat angle = (2 * M_PI) / count;
    replicator.instanceTransform = CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0);
    replicator.instanceDelay = duration/count;
    
    [self.view.layer addSublayer:replicator];
    
    CALayer *dot = [CALayer layer];
    dot.bounds = CGRectMake(0.0, 0.0, 14.0, 14.0);
    dot.position = CGPointMake(100.0, 40.0);
    dot.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0].CGColor;
    dot.borderColor = [UIColor colorWithWhite:1.0 alpha:1.0].CGColor;
    dot.borderWidth = 1.0;
    dot.cornerRadius = 2.0;
    dot.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
    
    [replicator addSublayer:dot];
    
    
    CABasicAnimation *shrink = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    shrink.fromValue = @(1.0);
    shrink.toValue = @(0.1);
    shrink.duration = duration;
    shrink.repeatCount = CGFLOAT_MAX;
    
    [dot addAnimation:shrink forKey:nil];
}

@end
