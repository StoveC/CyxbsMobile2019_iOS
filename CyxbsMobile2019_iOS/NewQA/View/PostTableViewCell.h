//
//  PostTableViewCell.h
//  CyxbsMobile2019_iOS
//
//  Created by 阿栋 on 2020/12/24.
//  Copyright © 2020 Redrock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FunctionBtn.h"
#import "FuncView.h"
#import "PostItem.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PostTableViewCellDelegate <NSObject>

- (void)ClickedFuncBtn:(UIButton *)sender;
- (void)ClickedStarBtn:(FunctionBtn *)sender;
- (void)ClickedCommentBtn:(FunctionBtn *)sender;
- (void)ClickedShareBtn:(UIButton *)sender;
- (void)ClickedImageView1:(UITapGestureRecognizer *)tap;
- (void)ClickedImageView2:(UITapGestureRecognizer *)tap;
- (void)ClickedImageView3:(UITapGestureRecognizer *)tap;

@end

@interface PostTableViewCell : UITableViewCell
///头像
@property (nonatomic, strong) UIImageView *iconImageView;
///昵称
@property (nonatomic, strong) UILabel *nicknameLabel;
///时间
@property (nonatomic, strong) UILabel *timeLabel;
///举报，屏蔽等多功能按钮
@property (nonatomic, strong) UIButton *funcBtn;
///内容
@property (nonatomic, strong) UILabel *detailLabel;
///三个图片
@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UIImageView *imageView2;
@property (nonatomic, strong) UIImageView *imageView3;
///圈子标签
@property (nonatomic, strong) UIButton *groupLabel;
///点赞
@property (nonatomic, strong) FunctionBtn *starBtn;
///评论
@property (nonatomic, strong) FunctionBtn *commendBtn;
///分享
@property (nonatomic, strong) UIButton *shareBtn;
///圈子标签的背景图片
@property (nonatomic, strong) UIImage *groupImage;

@property (nonatomic, strong) UIView *backView;

@property (nonatomic, strong) PostItem *item;

@property (nonatomic, weak) id <PostTableViewCellDelegate> delegate;

@property (nonatomic, strong) UITapGestureRecognizer *tap1;
@property (nonatomic, strong) UITapGestureRecognizer *tap2;
@property (nonatomic, strong) UITapGestureRecognizer *tap3;

@end

NS_ASSUME_NONNULL_END

