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

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];

    // Check if the device orientation has changed
    if (self.traitCollection.verticalSizeClass != previousTraitCollection.verticalSizeClass ||
        self.traitCollection.horizontalSizeClass != previousTraitCollection.horizontalSizeClass) {
        [self updateWebViewConstraints];
    }
}

- (void)updateWebViewConstraints {
    // Remove existing constraints
    [self.view removeConstraints:self.view.constraints];

    // Set up new constraints based on the device orientation
    if (self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
        // Landscape mode: WKWebView fills the width and height of the view
        [self.webView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
        [self.webView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
        [self.webView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
        [self.webView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    } else {
        // Portrait mode: WKWebView fills the width and height of the view
        [self.webView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
        [self.webView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
        [self.webView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
        [self.webView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    }
}

@end
