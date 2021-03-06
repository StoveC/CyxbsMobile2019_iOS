//
//  BaseTabBarController.m
//  CyxbsMobile2019_iOS
//
//  Created by 方昱恒 on 2020/3/29.
//  Copyright © 2020 Redrock. All rights reserved.
//

#import "ClassTabBarController.h"
#import "ClassTabBar.h"

@interface ClassTabBarController ()

@end

@implementation ClassTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setValue:[[ClassTabBar alloc] init] forKey:@"tabBar"];
    
    [self addObserver:self forKeyPath:@"tabBar.hidden" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"tabBar.hidden" context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([change[NSKeyValueChangeNewKey] boolValue] == YES) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"classTabBarHasHidden" object:nil];
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"classTabBarHasDisplayed" object:nil];
    }
}


@end
