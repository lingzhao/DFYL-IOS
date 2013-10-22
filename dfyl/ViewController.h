//
//  ViewController.h
//  dfyl
//
//  Created by John on 10/21/13.
//  Copyright (c) 2013 jingjing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate>
{
    UIActivityIndicatorView *_progressIndView;
}
@property (weak, nonatomic) IBOutlet UIWebView *webView;

- (IBAction)WebGoForward:(id)sender;
- (IBAction)WebGoBack:(id)sender;
- (IBAction)WebStopLoading:(id)sender;
- (IBAction)WebReflesh:(id)sender;

@end
