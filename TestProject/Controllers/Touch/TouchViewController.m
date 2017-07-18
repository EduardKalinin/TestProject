//
//  TouchViewController.m
//  TestProject
//
//  Created by Developer on 7/14/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "TouchViewController.h"

@interface TouchViewController ()

@property (weak, nonatomic) IBOutlet UIView *squareView;
@property (weak, nonatomic) IBOutlet UIView *circleView;
@property (weak, nonatomic) IBOutlet UIView *stumpView;
@property (weak, nonatomic) IBOutlet UIView *square1View;
@property (weak, nonatomic) IBOutlet UIView *circle1View;
@property (weak, nonatomic) IBOutlet UIView *stump1View;
@property (weak, nonatomic) IBOutlet UIView *topConteinerView;
@property (weak, nonatomic) IBOutlet UIView *bottomConteinerView;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *viewArray;
@property (strong, nonatomic) UIView *draggingView;

@end

@implementation TouchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureLayout];
}

#pragma mark - Helpers

- (void)configureLayout {
    [self configureView];
}

- (void)configureView {
    self.circleView.layer.cornerRadius = 50.0;
    self.circleView.layer.masksToBounds = true;
    self.circle1View.layer.cornerRadius = 50.0;
    self.circleView.layer.masksToBounds = true;
    self.stumpView.layer.cornerRadius = 15.0;
    self.circleView.layer.masksToBounds = true;
    self.stump1View.layer.cornerRadius = 15.0;
    self.circleView.layer.masksToBounds = true;
}

#pragma mark - Touches

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    if ([self.viewArray containsObject:touch.view]) {
        self.draggingView = touch.view;
        self.draggingView.center = [touch locationInView:self.view.window];
        
        [UIView animateWithDuration:0.3 animations:^{
            self.draggingView.transform = CGAffineTransformMakeScale(1.1, 1.1);
            self.draggingView.alpha = 0.4;
        }];
        
        [self.view addSubview:self.draggingView];
        [self.view bringSubviewToFront:self.draggingView];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.draggingView) {
        UITouch *touch = [touches anyObject];
        self.draggingView.center = [touch locationInView:self.view.window];
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touchEnded:touches];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touchEnded:touches];
}

- (void)touchEnded:(NSSet<UITouch *> *)touches {
    if (self.draggingView) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self.view.window];
        UIView *conteiner;
        
        if (CGRectContainsPoint(self.topConteinerView.frame, point)) {
            conteiner = self.topConteinerView;
        } else if (CGRectContainsPoint(self.bottomConteinerView.frame, point)) {
            conteiner = self.bottomConteinerView;
        }
        
        self.draggingView.center = [self.view.window convertPoint:point toView:conteiner];
        [conteiner addSubview:self.draggingView];
        
        [UIView animateWithDuration:0.3 animations:^{
            self.draggingView.transform = CGAffineTransformIdentity;
            self.draggingView.alpha = 1.0;
        } completion:^(BOOL finished) {
            self.draggingView = nil;
        }];
    }
}

@end
