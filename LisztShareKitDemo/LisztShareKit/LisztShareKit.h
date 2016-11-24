//
//  LisztShareKit.h
//  LisztShareKitDemo
//
//  Created by Liszt on 16/11/23.
//  Copyright © 2016年 https://github.com/LisztGitHub. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LisztShareItem;
typedef void(^LisztShareDidSelectBlock)(LisztShareItem *shareItem);

typedef NS_ENUM(NSUInteger,LisztShareItemShowModel) {
    /*默认 (不对UI做更改)*/
    ShareItemShowNone,
    /*显示图标*/
    ShareItemShowIcon,
    /*显示文字*/
    ShareItemShowText
};
typedef NS_ENUM(NSUInteger,LisztShareKitShowModel) {
    /*默认*/
    ShareKitShowNone,
    /*中间显示*/
    ShareKitShowCenter,
    /*底部显示*/
    ShareKitShowBottom
};

@interface LisztShareItem : NSObject
+ (LisztShareItem *)itemShareTitle:(NSString *)title iconName:(NSString *)iconName showModel:(LisztShareItemShowModel)showModel titleColor:(UIColor *)color font:(UIFont *)font;
/*标题*/
@property (copy, nonatomic) NSString *shareTitle;
/*图标*/
@property (copy, nonatomic) NSString *iconName;
/*item的显示方式*/
@property (assign, nonatomic) LisztShareItemShowModel showModel;
/*标题颜色*/
@property (strong, nonatomic) UIColor *titleColor;
/*字体*/
@property (strong, nonatomic) UIFont *font;
@end


@interface LisztShareKit : UIView
/**
 *  添加分享组件
 *  @param shareItems 分享组件
 *  @param kitModel 显示模式
 *  @param column 列
 *  @param shareDidSelectBlock 分享项点击后回调Block
 */
+ (instancetype)addShareItems:(NSArray <LisztShareItem *>*)shareItems shareKitShowModel:(LisztShareKitShowModel)kitModel columnNumber:(NSInteger)column shareDidSelectBlock:(LisztShareDidSelectBlock)shareDidSelectBlock;

/**
 *  退出分享组件
 */
+ (void)dismissShareKit;

@end
