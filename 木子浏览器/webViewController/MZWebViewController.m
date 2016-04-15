//
//  MZWebViewController.m
//  木子浏览器
//
//  Created by 肖睿 on 16/3/18.
//  Copyright © 2016年 李成. All rights reserved.
//

#import "MZWebViewController.h"
#import "mb2ViewAdditions.h"
#import "UIColor+Extension.h"
#import "MZFunctionView.h"
#import "MZMenuViewController.h"

@interface MZWebViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView         * webView;

@property (nonatomic, strong) MZFunctionView            * bottomView;


@end

@implementation MZWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = self.titleVC;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.webView];
    [self.view addSubview:self.bottomView];

    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.theURL]]];
    
}
#pragma mark - 下方控制区域的点击事件
// 返回点击事件
- (void)clickBack {
    [self.webView goBack];
    
}
// 菜单点击事件
- (void)jumpList {
    MZMenuViewController * mvc = [[MZMenuViewController alloc] init];
    [self.navigationController pushViewController:mvc animated:YES];
    
}
// 前进事件
- (void)clickForward {
    [self.webView goForward];
}



#pragma mark - 懒加载
- (UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - 64 - 40)];
        _webView.delegate = self;
        _webView.scalesPageToFit = YES;
        
    }
    return _webView;
}
// 底部视图
- (MZFunctionView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[MZFunctionView alloc] initWithFrame:CGRectMake(0, _webView.bottom, self.view.width, 40)];
        _bottomView.backBtn.frame = CGRectMake(self.bottomView.width * 0.1, 0, self.bottomView.width * 0.2, self.bottomView.height);
        _bottomView.muenBtn.frame = CGRectMake(self.bottomView.backBtn.right + self.bottomView.width * 0.15, 0, self.bottomView.width * 0.1, self.bottomView.height);
        _bottomView.forwardBtn.frame = CGRectMake(self.bottomView.muenBtn.right + self.bottomView.width * 0.15, 0, self.bottomView.width * 0.2, self.bottomView.height);
        
        _bottomView.backgroundColor = [UIColor colorWithHexString:@"EEEEEE"];
        
        [_bottomView.backBtn addTarget:self action:@selector(clickBack) forControlEvents:(UIControlEventTouchUpInside)];
        [_bottomView.muenBtn addTarget:self action:@selector(jumpList) forControlEvents:(UIControlEventTouchUpInside)];
        [_bottomView.forwardBtn addTarget:self action:@selector(clickForward) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _bottomView;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
