//
//  ViewController.m
//  dfyl
//
//  Created by John on 10/21/13.
//  Copyright (c) 2013 jingjing. All rights reserved.
//

#import "ViewController.h"

#define kWebURL @"http://www.mit.edu"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    NSURL *url =[NSURL URLWithString:kWebURL];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    
    if (!_progressIndView) {
        _progressIndView = [[UIActivityIndicatorView alloc] init];
        
        [_progressIndView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
        [_progressIndView setFrame:CGRectMake(0, 0, 28 ,28)];
        [_progressIndView setCenter: self.view.center];
        [self.view addSubview:_progressIndView];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark UIWebView delegate


- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
    //[self setupWebToolBar];
    
    [_progressIndView startAnimating];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    if (self.webView == nil) {
        return;     // 为了防止此时已经退出
    }
    
    //[self setupWebToolBar];
    
    [_progressIndView stopAnimating];
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
    if([error code] == NSURLErrorCancelled) return;
    
    UIAlertView *alterview = [[UIAlertView alloc] initWithTitle:@"" message:[error localizedDescription]  delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alterview show];
}


#pragma mark -selectors

- (IBAction)WebGoForward:(id)sender
{
    if ([_webView canGoForward]) {
        [_webView goForward];
    }
    
}

- (IBAction)WebGoBack:(id)sender
{
    if ([_webView canGoBack]) {
        [_webView goBack];
    }
    
}
- (IBAction)WebStopLoading:(id)sender
{
    if (_webView.loading) {
        [_webView stopLoading];
    }
}

- (IBAction)WebReflesh:(id)sender
{
    [_webView reload];
}




@end
