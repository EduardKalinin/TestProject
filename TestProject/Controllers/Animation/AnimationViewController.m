//
//  AnimationViewController.m
//  TestProject
//
//  Created by Developer on 7/15/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()

@property (weak, nonatomic) IBOutlet UIView *contanerView;
@property (weak, nonatomic) IBOutlet UIView *secondContainerView;

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureLayout];
    [self configureNewView];
//    [self createSquareLoading];
    [self createArcLoading];
    [self configurePalki];
}

#pragma mark - Helpers

- (void)configureLayout {
    [self configureView];
    [self createNewLayer:100.0 y:50.0 delay:0.6];
    [self createFiveLayers];
    [self configureElkiPalki];
}

- (void)configurePalki {
    [self createLayerPalki:220.0 y:50 delay:0.1];
    [self createLayerPalki:230.0 y:50 delay:0.2];
    [self createLayerPalki:240.0 y:50 delay:0.3];
    [self createLayerPalki:250.0 y:50 delay:0.4];
    [self createLayerPalki:260.0 y:50 delay:0.5];
}

- (void)configureElkiPalki {
    [self createLayerPalki:290.0 y:50 delay:0.5];
    [self createLayerPalki:300.0 y:50 delay:0.3];
    [self createLayerPalki:310.0 y:50 delay:0.1];
    [self createLayerPalki:320.0 y:50 delay:0.3];
    [self createLayerPalki:330.0 y:50 delay:0.5];
}

- (void)configureElkiPalki2 {
    [self createLayerPalki:290.0 y:50 delay:0.5];
    [self createLayerPalki:300.0 y:50 delay:0.3];
    [self createLayerPalki:310.0 y:50 delay:0.1];
    [self createLayerPalki:320.0 y:50 delay:0.3];
    [self createLayerPalki:330.0 y:50 delay:0.5];
}

- (void)configureView {
    [self createLayer:30.0 y:50.0 delay:0.0];
    [self createLayer:60.0 y:50.0 delay:0.2];
    [self createLayer:90.0 y:50.0 delay:0.14];
}

- (void)configureNewView {
    [self createLayer:130.0 y:50.0 delay:0.0];
    [self createLayer:160.0 y:50.0 delay:0.2];
    [self createLayer:190.0 y:50.0 delay:0.1];

    [self createLayer:130.0 y:20.0 delay:0.17];
    [self createLayer:160.0 y:20.0 delay:0.1];
    [self createLayer:190.0 y:20.0 delay:0.24];

    [self createLayer:130.0 y:80.0 delay:0.03];
    [self createLayer:160.0 y:80.0 delay:0.29];
    [self createLayer:190.0 y:80.0 delay:0.06];
}

- (void)createArcLoading {
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = CGRectMake(0.0, 0.0, 30.0, 30.0);
    layer.position = self.view.center;
    
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor blackColor].CGColor;
    layer.lineWidth = 5.0;
    layer.lineCap = kCALineCapRound;
    
    layer.backgroundColor = [UIColor clearColor].CGColor;
    
    UIBezierPath *pathArc = [UIBezierPath
                             bezierPathWithArcCenter:CGPointMake(CGRectGetMidX(layer.bounds), CGRectGetMidY(layer.bounds))
                             radius:CGRectGetMidX(layer.bounds)
                             startAngle:(3.0 / 4.0) * M_PI
                             endAngle:M_PI / 4
                             clockwise:YES];
    
    layer.path = pathArc.CGPath;
    
    [self.view.layer addSublayer:layer];
    
    CABasicAnimation *rotate = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotate.fromValue = @(0.0);
    rotate.toValue = @(M_PI * 2);
    rotate.repeatCount = CGFLOAT_MAX;
    rotate.duration = 0.7;
    [layer addAnimation:rotate forKey:nil];
    
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.fromValue = @(1.0);
    scale.toValue = @(0.8);
    scale.repeatCount = CGFLOAT_MAX;
    scale.autoreverses = YES;
    scale.duration = 0.35;
    [layer addAnimation:scale forKey:nil];
    
}

- (void)createSquareLoading {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.secondContainerView.bounds) - 70.0, CGRectGetMidY(self.secondContainerView.bounds) - 25.0, 50.0, 50.0)];
    
    view.backgroundColor = [UIColor grayColor];
    
    CABasicAnimation *rotate = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotate.fromValue = @(0.0);
    rotate.toValue = @(M_PI * 2);
    //    rotate.repeatCount = CGFLOAT_MAX;
    //    rotate.duration = 3.0;
    //    rotate.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //    [view.layer addAnimation:rotate forKey:nil];
    
    CABasicAnimation *rotateX = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotateX.fromValue = @(0.0);
    rotateX.toValue = @(M_PI * 2);
    //    rotateX.repeatCount = CGFLOAT_MAX;
    //    rotateX.duration = 3.0;
    //    rotateX.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //    [view.layer addAnimation:rotateX forKey:nil];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[rotate, rotateX];
    group.repeatCount = CGFLOAT_MAX;
    group.duration = 3.0;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [view.layer addAnimation:group forKey:nil];
    
    [self.secondContainerView addSubview:view];
}

- (void)createLayer:(CGFloat)x y:(CGFloat)y delay:(CFTimeInterval)delay{
    CALayer *circleLayer = [CALayer layer];
    circleLayer.bounds = CGRectMake(0.0, 0.0, 20.0, 20.0);
    circleLayer.position = CGPointMake(x, y);
    circleLayer.cornerRadius = CGRectGetMidX(circleLayer.bounds);
    circleLayer.backgroundColor = [UIColor grayColor].CGColor;
    
    CABasicAnimation *transform = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    transform.fromValue = @(1.0);
    transform.toValue = @(0.2);
    transform.repeatCount = CGFLOAT_MAX;
    transform.autoreverses = YES;
    transform.duration = 0.3;
    transform.beginTime = delay;
    
    [circleLayer addAnimation:transform forKey:nil];
    [self.contanerView.layer addSublayer:circleLayer];
}

- (void)createNewLayer:(CGFloat)x y:(CGFloat)y delay:(CFTimeInterval)delay {
    CALayer *containerLayer = [CALayer layer];
    containerLayer.bounds = CGRectMake(0.0, 0.0, 80.0, 20.0);
    containerLayer.position = CGPointMake(x, y);
    //containerLayer.backgroundColor = [UIColor redColor].CGColor;
    
    CABasicAnimation *transform = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    transform.fromValue = @(1.0);
    transform.toValue = @(0.3);

    CABasicAnimation *rotate = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotate.fromValue = @(0.0);
    rotate.toValue = @(M_PI);
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.autoreverses = YES;
    group.duration = 1.5;
    group.animations = @[transform, rotate];
    group.repeatCount = CGFLOAT_MAX;
    transform.beginTime = delay;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];

    [containerLayer addAnimation:group forKey:@"animation"];

    [containerLayer addSublayer:[self createThreeLayer:10.0 y:10.0 delay:0.0 opacity:0.6]];
    [containerLayer addSublayer:[self createThreeLayer:40.0 y:10.0 delay:0.0 opacity:1.0]];
    [containerLayer addSublayer:[self createThreeLayer:70.0 y:10.0 delay:0.0 opacity:0.6]];

    [self.secondContainerView.layer addSublayer:containerLayer];
}

- (CALayer *)createThreeLayer:(CGFloat)x y:(CGFloat)y delay:(CFTimeInterval)delay opacity:(CGFloat)opacity{
    CALayer *circleLayer = [CALayer layer];
    circleLayer.bounds = CGRectMake(0.0, 0.0, 20.0, 20.0);
    circleLayer.position = CGPointMake(x, y);
    circleLayer.cornerRadius = CGRectGetMidX(circleLayer.bounds);
    circleLayer.backgroundColor = [UIColor grayColor].CGColor;
    circleLayer.opacity = opacity;
    
    return circleLayer;
}

- (void)createFiveLayers {
    CALayer *containerLayer = [CALayer layer];
    containerLayer.bounds = CGRectMake(0.0, 0.0, 100.0, 20.0);
    containerLayer.position = CGPointMake(200.0, 20.0);
    containerLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    CALayer *secondContainerLayer = [CALayer layer];
    secondContainerLayer.bounds = CGRectMake(0.0, 0.0, 100.0, 20.0);
    secondContainerLayer.position = CGPointMake(200.0, 50.0);
    secondContainerLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    [containerLayer addSublayer:[self createThreeLayer:30.0 y:10.0 delay:0.0 opacity:1.0]];
    [containerLayer addSublayer:[self createThreeLayer:70.0 y:10.0 delay:0.0 opacity:1.0]];

    
    [secondContainerLayer addSublayer:[self createThreeLayer:10.0 y:10.0 delay:0.0 opacity:1.0]];
    [secondContainerLayer addSublayer:[self createThreeLayer:50.0 y:10.0 delay:0.0 opacity:1.0]];
    [secondContainerLayer addSublayer:[self createThreeLayer:90.0 y:10.0 delay:0.0 opacity:1.0]];
    
    CABasicAnimation *scaleThreeLayer = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleThreeLayer.fromValue = @(1.0);
    scaleThreeLayer.toValue = @(0.3);
    
    CABasicAnimation *translationThreeLayer = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    translationThreeLayer.fromValue = @(0.0);
    translationThreeLayer.toValue = @(-30.0);
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.autoreverses = YES;
    group.duration = 1.0;
    group.animations = @[translationThreeLayer, scaleThreeLayer];
    group.repeatCount = CGFLOAT_MAX;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [secondContainerLayer addAnimation:group forKey:@"animation"];
    
    CABasicAnimation *scaleTwoLayer = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleTwoLayer.fromValue = @(1.0);
    scaleTwoLayer.toValue = @(0.3);
    
    CABasicAnimation *translationTwoLayer = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    translationTwoLayer.fromValue = @(0.0);
    translationTwoLayer.toValue = @(30.0);
    
    CAAnimationGroup *secondGroup = [CAAnimationGroup animation];
    secondGroup.autoreverses = YES;
    secondGroup.duration = 1.0;
    secondGroup.animations = @[translationTwoLayer, scaleTwoLayer];
    secondGroup.repeatCount = CGFLOAT_MAX;
    secondGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [containerLayer addAnimation:secondGroup forKey:@"animation"];

    [self.secondContainerView.layer addSublayer:containerLayer];
    [self.secondContainerView.layer addSublayer:secondContainerLayer];
}

- (void)createLayerPalki:(CGFloat)x y:(CGFloat)y delay:(CFTimeInterval)delay{
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0.0, 0.0, 5.0, 50.0);
    layer.position = CGPointMake(x, y);
    layer.backgroundColor = [UIColor grayColor].CGColor;
    layer.cornerRadius = 2.5;
    
    CABasicAnimation *transform = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    transform.fromValue = @(1.0);
    transform.toValue = @(0.3);
    transform.repeatCount = CGFLOAT_MAX;
    transform.autoreverses = YES;
    transform.duration = 0.5;
    transform.beginTime = delay;
    
    [layer addAnimation:transform forKey:nil];
    [self.contanerView.layer addSublayer:layer];
}

@end
