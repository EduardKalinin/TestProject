//
//  WebViewController.m
//  TestProject
//
//  Created by Developer on 7/20/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *actionButtonItem;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureURLRequest];
}

#pragma mark - Helpers

- (void)configureURLRequest {
    NSURL *url = [NSURL URLWithString:@"http://apple.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

#pragma mark - IBActions

- (IBAction)actionBackButtonClicked:(UIBarButtonItem *)sender {
    if (self.webView.canGoBack) {
        [self.webView goBack];
    }
}

- (IBAction)actionForwardButtonClicked:(UIBarButtonItem *)sender {
    if (self.webView.canGoForward) {
        [self.webView stopLoading];
        [self.webView goForward];
    }
}

- (IBAction)actionRefreshButtonClicked:(UIBarButtonItem *)sender {
    [self.webView reload];
}

- (IBAction)actionActionButtonClicked:(UIBarButtonItem *)sender {
    
}

- (void)webViewFinishLoad {
    [self.activityIndicator stopAnimating];
    
    self.refreshButtonItem.title = @"refresh";
    
    self.backButtonItem.enabled = self.webView.canGoBack;
    self.forwardButtonItem.enabled = self.webView.canGoForward;
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {

    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.activityIndicator startAnimating];
    
    self.refreshButtonItem.title = @"Stop";
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self webViewFinishLoad];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [self webViewFinishLoad];
}

@end
