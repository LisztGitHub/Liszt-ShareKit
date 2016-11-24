//
//  LisztShareKit.m
//  LisztShareKitDemo
//
//  Created by Liszt on 16/11/23.
//  Copyright © 2016年 https://github.com/LisztGitHub. All rights reserved.
//

#import "LisztShareKit.h"
#define widthProportion [UIScreen mainScreen].bounds.size.width / 375
#define SRGBA(r,g,b,a) [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a]
#define ShareButtonHeight widthProportion * 80
#define ShareCancelButtonHeight widthProportion * 40
#define CenterSpace widthProportion * 40

static LisztShareKit *kit = nil;
static dispatch_once_t onceToken;

@implementation LisztShareItem
+ (LisztShareItem *)itemShareTitle:(NSString *)title iconName:(NSString *)iconName showModel:(LisztShareItemShowModel)showModel titleColor:(UIColor *)color font:(UIFont *)font{
    LisztShareItem *item = [[self alloc]init];
    item.shareTitle = title;
    item.iconName = iconName;
    item.showModel = showModel;
    item.titleColor = color;
    item.font = font;
    return item;
}
@end

@interface LisztShareKit()
/*分享项*/
@property (strong, nonatomic) NSArray<LisztShareItem *>* shareItems;
/*点击回调Block*/
@property (copy, nonatomic) LisztShareDidSelectBlock shareSelectBlock;
/*列数*/
@property (assign, nonatomic) NSInteger column;
/*显示模式*/
@property (assign, nonatomic) LisztShareKitShowModel sharekitModel;
/*内容视图*/
@property (strong, nonatomic) UIView *contentView;
/*取消按钮*/
@property (strong, nonatomic) UIButton *cancelButton;
@end

@implementation LisztShareKit
+ (instancetype)shareKit{
    dispatch_once(&onceToken, ^{
        kit = [[self alloc] initWithFrame:[[UIApplication sharedApplication] keyWindow].bounds];
    });
    return kit;
}
+ (instancetype)addShareItems:(NSArray<LisztShareItem *> *)shareItems shareKitShowModel:(LisztShareKitShowModel)kitModel columnNumber:(NSInteger)column shareDidSelectBlock:(LisztShareDidSelectBlock)shareDidSelectBlock{
    if(column<2)return nil;
    LisztShareKit *shareKit = [LisztShareKit shareKit];
    shareKit.shareItems = shareItems;
    shareKit.shareSelectBlock = shareDidSelectBlock;
    shareKit.sharekitModel = kitModel;
    shareKit.column = column;
    [shareKit initialization];
    [[UIApplication sharedApplication].keyWindow addSubview:shareKit];
    return shareKit;
}
+ (void)dismissShareKit{
    [[self shareKit] removeFromSuperview];
    kit = nil;
    onceToken = 0;
}

- (void)initialization{
    /*1.添加contentView*/
    [self addSubview:self.contentView];
    
    /*2.计算Frame创建ShareButton*/
    CGFloat start_X = 0.f;
    CGFloat start_Y = 0;
    CGFloat width_Space = 0.f;
    CGFloat height_Space = 0.f;
    CGFloat button_Height = ShareButtonHeight;
    
    CGFloat button_width = self.sharekitModel == ShareKitShowCenter?(self.bounds.size.width - CenterSpace) / self.column: self.bounds.size.width / self.column;
    
    [self.shareItems enumerateObjectsUsingBlock:^(LisztShareItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSInteger index = idx % self.column;
        NSInteger page = idx / self.column;
        
        UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        shareButton.titleLabel.font = obj.font;
        shareButton.tag = idx;
        [shareButton setTitleColor:obj.titleColor forState:UIControlStateNormal];
        [shareButton setBackgroundImage:[self buttonImageFromColor:[UIColor groupTableViewBackgroundColor]] forState:UIControlStateHighlighted];
        [shareButton setBackgroundImage:[self buttonImageFromColor:[UIColor groupTableViewBackgroundColor]] forState:UIControlStateSelected];
        shareButton.frame = CGRectMake(index * (button_width + width_Space) + start_X, page  * (button_Height + height_Space)+start_Y, button_width, button_Height);
        [shareButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        switch (obj.showModel) {
            case ShareItemShowNone:
            {
                [shareButton setTitle:obj.shareTitle forState:UIControlStateNormal];
                [shareButton setImage:[UIImage imageNamed:obj.iconName] forState:UIControlStateNormal];
                [self handleButtonEdgeInsets:shareButton space:5];
            }
                break;
            case ShareItemShowIcon:{
                [shareButton setImage:[UIImage imageNamed:obj.iconName] forState:UIControlStateNormal];
            }
                break;
            case ShareItemShowText:{
                [shareButton setTitle:obj.shareTitle forState:UIControlStateNormal];
            }
                break;
            default:
                break;
        }
        [self.contentView addSubview:shareButton];
    }];
    
    CGRect cancelFrame = CGRectMake(0, [self columnNumWithArray:self.shareItems eachlineNum:(int)self.column] * button_Height, self.sharekitModel==ShareKitShowCenter?self.bounds.size.width - CenterSpace:self.bounds.size.width, ShareCancelButtonHeight);
    self.cancelButton.frame = cancelFrame;
    [self.contentView addSubview:self.cancelButton];
    
    /*根据显示model设置显示的动画*/
    self.backgroundColor = SRGBA(0, 0, 0, 0.0);
    CGFloat contentHeight = [self columnNumWithArray:self.shareItems eachlineNum:(int)self.column] * button_Height + ShareCancelButtonHeight;
    if(self.sharekitModel == ShareKitShowNone||self.sharekitModel == ShareKitShowBottom){
        self.contentView.frame = CGRectMake(0, self.bounds.size.height, self.bounds.size.width, contentHeight);
        /*从底部弹出*/
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        [UIView animateWithDuration:0.2 // 动画时长
                              delay:0   // 动画延迟
             usingSpringWithDamping:0.8 // 类似弹簧振动效果 0~1
              initialSpringVelocity:2   // 初始速度
                            options:UIViewAnimationOptionCurveEaseInOut // 动画过渡效果
                         animations:^{
                             self.backgroundColor = SRGBA(0, 0, 0, 0.3);
                             CGRect frame = self.contentView.frame;
                             frame.origin.y = self.bounds.size.height - [self columnNumWithArray:self.shareItems eachlineNum:(int)self.column] * ShareButtonHeight - ShareCancelButtonHeight;
                             self.contentView.frame = frame;
                         } completion:^(BOOL finished) {}];
    }
    else{
        self.contentView.frame = CGRectMake(CenterSpace / 2, (CGRectGetHeight(self.bounds) - contentHeight)/2, self.bounds.size.width - CenterSpace, contentHeight);
        /*从中间由小变大弹出*/
        self.contentView.transform = CGAffineTransformMakeScale(1/CGRectGetWidth(self.contentView.frame), 1/CGRectGetHeight(self.contentView.frame));
        self.contentView.layer.cornerRadius = 5.f;
        self.contentView.clipsToBounds = YES;
        [UIView animateWithDuration:0.3f animations:^{
            self.contentView.transform = CGAffineTransformMakeScale(1, 1);
            self.backgroundColor = SRGBA(0, 0, 0, 0.3);
        } completion:^(BOOL finished) {
            
        }];
    }
    
}

#pragma mark - Button Action
- (void)buttonAction:(UIButton *)button{
    if(button.tag==998){
        [LisztShareKit dismissShareKit];
        return;
    }
    
    if(self.shareSelectBlock){
        self.shareSelectBlock(self.shareItems[button.tag]);
    }
}

#pragma mark - Utils
- (UIImage *)buttonImageFromColor:(UIColor *)color{
    CGRect rect = CGRectMake(0, 0, 20, 20);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext(); return img;
}

- (NSInteger)columnNumWithArray:(NSArray *)array eachlineNum:(NSInteger)number
{
    NSInteger num = 0;
    if (array.count % number == 0)
    {
        num = array.count / number;
    }
    else
    {
        num = array.count / number + 1;
    }
    return num;
}
- (void)handleButtonEdgeInsets:(UIButton *)button space:(CGFloat)space{
    CGFloat imageInsetsTop = 0.0f;
    CGFloat imageInsetsLeft = 0.0f;
    CGFloat imageInsetsBottom = 0.0f;
    CGFloat imageInsetsRight = 0.0f;
    
    CGFloat titleInsetsTop = 0.0f;
    CGFloat titleInsetsLeft = 0.0f;
    CGFloat titleInsetsBottom = 0.0f;
    CGFloat titleInsetsRight = 0.0f;
    
    CGFloat imageHeight = CGRectGetHeight(button.imageView.frame);
    CGFloat labelHeight = CGRectGetHeight(button.titleLabel.frame);
    CGFloat buttonHeight = CGRectGetHeight(button.frame);
    CGFloat boundsCentery = (imageHeight + space + labelHeight) * 0.5;
    
    CGFloat centerX_button = CGRectGetMidX(button.bounds);
    CGFloat centerX_titleLabel = CGRectGetMidX(button.titleLabel.frame);
    CGFloat centerX_image = CGRectGetMidX(button.imageView.frame);
    
    CGFloat imageTopY = CGRectGetMinY(button.imageView.frame);
    CGFloat titleBottom = CGRectGetMaxY(button.titleLabel.frame);
    
    imageInsetsTop = (buttonHeight * 0.5 - boundsCentery) - imageTopY;
    imageInsetsLeft = centerX_button - centerX_image;
    imageInsetsRight = - imageInsetsLeft;
    imageInsetsBottom = - imageInsetsTop;
    
    titleInsetsTop = buttonHeight - (buttonHeight * 0.5 - boundsCentery) - titleBottom;
    titleInsetsLeft = -(centerX_titleLabel - centerX_button);
    titleInsetsRight = - titleInsetsLeft;
    titleInsetsBottom = - titleInsetsTop;
    
    CGFloat totalHeight = (imageHeight + labelHeight + space);
    button.titleEdgeInsets = UIEdgeInsetsMake(0, - CGRectGetWidth(button.imageView.frame), - (totalHeight - labelHeight), 0);
    button.imageEdgeInsets = UIEdgeInsetsMake(imageInsetsTop, imageInsetsLeft, imageInsetsBottom, imageInsetsRight);
}

#pragma mark - 懒加载
- (UIButton *)cancelButton{
    if(!_cancelButton){
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        _cancelButton.titleLabel.font = [UIFont systemFontOfSize:15.f];
        [_cancelButton setImage:[UIImage imageNamed:@"liszt_share_exit_icon.png"] forState:UIControlStateNormal];
        _cancelButton.tag=998;
        [_cancelButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _cancelButton;
}
- (UIView *)contentView{
    if(!_contentView){
        _contentView = [[UIView alloc]initWithFrame:CGRectZero];
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}

@end
