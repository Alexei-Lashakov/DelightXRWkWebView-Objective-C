#import "ViewController.h"

@interface ViewController () <WKNavigationDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView.navigationDelegate = self;
    
    NSURL *websiteURL = [NSURL URLWithString:@"https://delight-vr.com/documentation/recommendations/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:websiteURL];
    [self.webView loadRequest:request];
}

#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {

    // Set allowsInlineMediaPlayback to prevent the default video player from starting
    self.webView.configuration.allowsInlineMediaPlayback = YES;
    
    // Allow the navigation to continue
    decisionHandler(WKNavigationActionPolicyAllow);
}

@end
