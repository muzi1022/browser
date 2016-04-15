//
//  ViewController.m
//  木子浏览器
//
//  Created by 肖睿 on 16/3/18.
//  Copyright © 2016年 李成. All rights reserved.
//

#import "ViewController.h"
#import "MZWebViewController.h"
#import "UIColor+Extension.h"
#import "mb2ViewAdditions.h"

#define WIDTH self.view.bounds.size.width
#define HEIGHT self.view.frame.size.height

@interface ViewController ()

@property (nonatomic, strong) UIButton              * baiduBtn;         // 百度

@property (nonatomic, strong) UIButton              * maopuBtn;         // 猫扑

@property (nonatomic, strong) UIButton              * csdnBtn;          // CSDN

@property (nonatomic, strong) UIButton              * easyCheck;        // 易查

@property (nonatomic, strong) UIButton              * customBtn;        // 自定义

@property (nonatomic, strong) UIButton              * longteng;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"首页";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor colorWithHexString:@"333333"];
    
    [self.view addSubview:self.baiduBtn];
    [self.view addSubview:self.maopuBtn];
    [self.view addSubview:self.csdnBtn];
    [self.view addSubview:self.easyCheck];
    [self.view addSubview:self.customBtn];
    [self.view addSubview:self.longteng];
    
    // 添加浮动效果
    [self floatingAniamtionLikeGameCenterBubbe:self.baiduBtn];
    [self floatingAniamtionLikeGameCenterBubbe:self.maopuBtn];
    [self floatingAniamtionLikeGameCenterBubbe:self.csdnBtn];
    [self floatingAniamtionLikeGameCenterBubbe:self.easyCheck];
    [self floatingAniamtionLikeGameCenterBubbe:self.customBtn];
    
}

#pragma mark - 动画
- (void)floatingAniamtionLikeGameCenterBubbe:(UIButton *)button {
    CAKeyframeAnimation * pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.repeatCount = INFINITY;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    pathAnimation.duration = 5.0;
    
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGRect circleCintainer = CGRectInset(button.frame, button.width/2 - 3, button.width/2 - 3);
    CGPathAddEllipseInRect(curvedPath, NULL, circleCintainer);
    
    pathAnimation.path = curvedPath;
    CGPathRelease(curvedPath);
    [button.layer addAnimation:pathAnimation forKey:@"mzCircleAnimation"];
    
    CAKeyframeAnimation * scaleX = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
    scaleX.duration = 6.0;
    scaleX.values = @[@1.0,@1.1,@1.2,@1.1,@1.0];
    scaleX.repeatCount = INFINITY;
    scaleX.autoreverses = YES;
    
    scaleX.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [button.layer addAnimation:scaleX forKey:@"scaleXAnimation"];
    
    CAKeyframeAnimation * scaleY = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.y"];
    scaleY.duration = 6.5;
    scaleY.values = @[@1.0,@1.1,@1.2,@1.1,@1.0];
    scaleY.repeatCount = INFINITY;
    scaleY.autoreverses = YES;
    scaleY.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [button.layer addAnimation:scaleY forKey:@"scaleYAnimation"];
    
}

#pragma mark - 按钮点击事件
// 百度
- (void)goBaidu {
    MZWebViewController * wvc = [[MZWebViewController alloc] init];
    wvc.titleVC = @"百度";
    wvc.theURL = @"https://www.baidu.com";
    [self.navigationController pushViewController:wvc animated:YES];
}
// 猫扑
- (void)goMaopu {
    MZWebViewController * wvc = [[MZWebViewController alloc] init];
    wvc.titleVC = @"猫扑";
    wvc.theURL = @"http://www.mop.com";
    [self.navigationController pushViewController:wvc animated:YES];
}
// CSDN
- (void)goCSDN {
    MZWebViewController * wvc = [[MZWebViewController alloc] init];
    wvc.titleVC = @"CSDN";
    wvc.theURL = @"http://www.csdn.net";
    [self.navigationController pushViewController:wvc animated:YES];
    
}
// 易查
- (void)goEasyCheck {
    MZWebViewController * wvc = [[MZWebViewController alloc] init];
    wvc.titleVC = @"易查段子";
    wvc.theURL = @"http://duanzi.yicha.cn/duanzi/i.y";
    [self.navigationController pushViewController:wvc animated:YES];
}
// 自定义
- (void)goCustom {
    MZWebViewController * wvc = [[MZWebViewController alloc] init];
    wvc.titleVC = @"自定义";
    wvc.theURL = @"";
    [self.navigationController pushViewController:wvc animated:YES];
}

- (void)yingyuan {
    MZWebViewController * wvc = [[MZWebViewController alloc] init];
    wvc.titleVC = @"龙腾";
    wvc.theURL = @"";
    [self.navigationController pushViewController:wvc animated:YES];
    
}

#pragma mark - 懒加载
// 百度
- (UIButton *)baiduBtn {
    if (!_baiduBtn) {
        _baiduBtn = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH * 0.133, WIDTH * 0.213, WIDTH * 0.266, WIDTH * 0.266)];
        [_baiduBtn setTitle:@"百度" forState:(UIControlStateNormal)];
        [_baiduBtn setTitleColor:[UIColor colorWithHexString:@"0066cc"] forState:(UIControlStateNormal)];
        _baiduBtn.layer.borderColor = [UIColor colorWithHexString:@"0066cc"].CGColor;
        _baiduBtn.layer.borderWidth = 1.0;
        _baiduBtn.layer.masksToBounds = YES;
        _baiduBtn.layer.speed = 0.3;
        _baiduBtn.layer.cornerRadius = _baiduBtn.width/2;
        _baiduBtn.backgroundColor = [UIColor clearColor];
        [_baiduBtn addTarget:self action:@selector(goBaidu) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _baiduBtn;
}
// 猫扑
- (UIButton *)maopuBtn {
    if (!_maopuBtn) {
        _maopuBtn = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH * 0.423, WIDTH *  0.776, WIDTH * 0.16, WIDTH * 0.16)];
        [_maopuBtn setTitle:@"猫扑" forState:(UIControlStateNormal)];
        [_maopuBtn setTitleColor:[UIColor colorWithHexString:@"FF3399"] forState:(UIControlStateNormal)];
        _maopuBtn.layer.borderColor = [UIColor colorWithHexString:@"FF3399"].CGColor;
        _maopuBtn.layer.borderWidth = 1.0;
        _maopuBtn.layer.masksToBounds = YES;
        _maopuBtn.layer.speed = 0.6;
        _maopuBtn.layer.cornerRadius = _maopuBtn.width/2;
        _maopuBtn.backgroundColor = [UIColor clearColor];
        [_maopuBtn addTarget:self action:@selector(goMaopu) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _maopuBtn;
}
// CSDN
- (UIButton *)csdnBtn {
    if (!_csdnBtn) {
        _csdnBtn = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH * 0.613, HEIGHT * 0.2746, WIDTH * 0.2346, WIDTH * 0.2346)];
        [_csdnBtn setTitle:@"CSDN" forState:(UIControlStateNormal)];
        [_csdnBtn setTitleColor:[UIColor colorWithHexString:@"CC0033"] forState:(UIControlStateNormal)];
        _csdnBtn.layer.borderColor = [UIColor colorWithHexString:@"CC0033"].CGColor;
        _csdnBtn.layer.borderWidth = 1.0;
        _csdnBtn.layer.masksToBounds = YES;
        _csdnBtn.layer.speed = 0.9;
        _csdnBtn.layer.cornerRadius = _csdnBtn.width/2;
        _csdnBtn.backgroundColor = [UIColor clearColor];
        [_csdnBtn addTarget:self action:@selector(goCSDN) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _csdnBtn;
}
// 易查
- (UIButton *)easyCheck {
    if (!_easyCheck) {
        _easyCheck = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH * 0.4906, HEIGHT * 0.6027, WIDTH * 0.266, WIDTH * 0.266)];
        [_easyCheck setTitle:@"易查" forState:(UIControlStateNormal)];
        [_easyCheck setTitleColor:[UIColor colorWithHexString:@"3783dd"] forState:(UIControlStateNormal)];
        _easyCheck.layer.borderColor = [UIColor colorWithHexString:@"3783dd"].CGColor;
        _easyCheck.layer.borderWidth = 1.0;
        _easyCheck.layer.masksToBounds = YES;
        _easyCheck.layer.speed = 1.2;
        _easyCheck.layer.cornerRadius = _easyCheck.width/2;
        _easyCheck.backgroundColor = [UIColor clearColor];
        [_easyCheck addTarget:self action:@selector(goEasyCheck) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _easyCheck;
}
// 自定义
- (UIButton *)customBtn {
    if (!_customBtn) {
        _customBtn = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH * 0.257, HEIGHT * 0.53, WIDTH * 0.25, WIDTH * 0.25)];
        [_customBtn setTitle:@"自定义" forState:(UIControlStateNormal)];
        [_customBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        _customBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        _customBtn.layer.borderWidth = 1.0;
        _customBtn.layer.masksToBounds = YES;
        _customBtn.layer.speed = 1.5;
        _customBtn.layer.cornerRadius = _customBtn.width/2;
        [_customBtn addTarget:self action:@selector(goCustom) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _customBtn;
}

- (UIButton *)longteng {
    if (!_longteng) {
        _longteng = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 80, 80)];
        _longteng.layer.borderColor = [UIColor yellowColor].CGColor;
        _longteng.layer.borderWidth = 1.0;
        _longteng.layer.masksToBounds = YES;
        _longteng.layer.cornerRadius = _longteng.width/2;
        _longteng.layer.speed = 0.2;
        [_longteng addTarget:self action:@selector(yingyuan) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _longteng;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
