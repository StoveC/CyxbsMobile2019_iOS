//
//  FunctionBtn.m
//  CyxbsMobile2019_iOS
//
//  Created by 阿栋 on 2020/12/24.
//  Copyright © 2020 Redrock. All rights reserved.
//

#import "FunctionBtn.h"

@implementation FunctionBtn

- (instancetype) init {
    if ([super init]) {
        self.backgroundColor = [UIColor clearColor];
        _iconView = [[UIImageView alloc] init];
        [self addSubview:_iconView];
        
        _countLabel = [[UILabel alloc] init];
        if (self.state == YES) {
            if (@available(iOS 11.0, *)) {
                _countLabel.textColor = [UIColor colorNamed:@"FuncBtnColor"];
            } else {
                // Fallback on earlier versions
            }
        }
        _countLabel.font = [UIFont fontWithName:@"Arial" size: 12];
        _countLabel.textAlignment = NSTextAlignmentRight;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(countLabelPlus) name:@"CountLabelPlus" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(countLabelMinus) name:@"CountLabelMinus" object:nil];
        [self addSubview:_countLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.mas_equalTo(self);
        make.width.mas_equalTo(SCREEN_WIDTH * 0.0547);
    }];
    
    [_countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconView.mas_top).mas_offset(SCREEN_HEIGHT * 0.009);
        make.height.mas_equalTo(SCREEN_WIDTH * 0.052 * 8.5/19.5);
        make.right.mas_equalTo(self.mas_right);
        make.left.mas_equalTo(self.iconView.mas_right).mas_offset(SCREEN_WIDTH * 0.0133);
    }];
}

- (void)setIconViewSelectedImage:(UIImage *)selectedImage AndUnSelectedImage:(UIImage *)unSelectedImnage {
    if (self.selected == YES) {
        self.iconView.image = selectedImage;
    }else {
        self.iconView.image = unSelectedImnage;
    }
}

- (void)countLabelPlus {
    NSString *count = _countLabel.text;
    _countLabel.text = [NSString stringWithFormat:@"%d",[count intValue] + 1];
}

- (void)countLabelMinus {
    NSString *count = _countLabel.text;
    _countLabel.text = [NSString stringWithFormat:@"%d",[count intValue] - 1];
}

@end

