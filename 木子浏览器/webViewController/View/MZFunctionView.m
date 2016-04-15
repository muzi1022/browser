//
//  MZFunctionView.m
//  木子浏览器
//
//  Created by 肖睿 on 16/3/28.
//  Copyright © 2016年 李成. All rights reserved.
//

#import "MZFunctionView.h"
#import "mb2ViewAdditions.h"
#import "UIColor+Extension.h"
#import "UIImage+Tint.h"


@implementation MZFunctionView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.backBtn];
        [self addSubview:self.muenBtn];
        [self addSubview:self.forwardBtn];
        
    }
    return self;
}



#pragma mark - 懒加载
// 左按钮
- (UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.width * 0.1, 0, self.width * 0.2, self.height)];
        [_backBtn setTitle:@" < " forState:(UIControlStateNormal)];
        [_backBtn setTitleColor:[UIColor colorWithHexString:@"9999AA"] forState:(UIControlStateNormal)];
        [_backBtn setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateSelected)];
        _backBtn.titleLabel.font = [UIFont systemFontOfSize:38];
    }
    return _backBtn;
}
// 菜单按钮
- (UIButton *)muenBtn {
    if (!_muenBtn) {
        _muenBtn = [[UIButton alloc] initWithFrame:CGRectMake(_backBtn.right + self.width * 0.1, 0, self.width * 0.1, self.height)];
        [_muenBtn setBackgroundImage:[[UIImage imageNamed:@"list"] imageWithGradientTintColor:[UIColor colorWithHexString:@"9999AA"]] forState:(UIControlStateNormal)];
        [_muenBtn setBackgroundImage:[[UIImage imageNamed:@"list"] imageWithGradientTintColor:[UIColor colorWithHexString:@"000000"]] forState:(UIControlStateSelected)];
    }
    return _muenBtn;
}
// 右按钮
- (UIButton *)forwardBtn {
    if (!_forwardBtn) {
        _forwardBtn = [[UIButton alloc] initWithFrame:CGRectMake(_muenBtn.right + self.width * 0.1, 0, self.width * 0.2, self.height)];
        [_forwardBtn setTitle:@" > " forState:(UIControlStateNormal)];
        [_forwardBtn setTitleColor:[UIColor colorWithHexString:@"9999AA"] forState:(UIControlStateNormal)];
        [_forwardBtn setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateSelected)];
        _forwardBtn.titleLabel.font = [UIFont systemFontOfSize:38];
        
    }
    return _forwardBtn;
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
