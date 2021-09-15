//
//  UIAutoLayout.h
//  UIAutoLayoutFramework_OC
//
//  Created by 林俊男 on 2021/09/14.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, BSAdaptScreenWidthType){
    AdaptScreenWidthTypeNone = 0,
    BSAdaptScreenWidthTypeConstraint = 1<<0, /**< 对约束的constant等比例 */
    BSAdaptScreenWidthTypeFontSize = 1<<1, /**< 对字体等比例 */
    BSAdaptScreenWidthTypeCornerRadius = 1<<2, /**< 对圆角等比例 */
    BSAdaptScreenWidthTypeAll = 1<<3, /**< 对现有支持的属性等比例 */
};

@interface UIView(BSAdaptScreen)

@property(nonatomic,assign) CGFloat x;
@property(nonatomic,assign) CGFloat right;
@property(nonatomic,assign) CGFloat y;
@property(nonatomic,assign) CGFloat bottom;
@property(nonatomic,assign) CGSize size;
@property(nonatomic,assign) CGFloat width;
@property(nonatomic,assign) CGFloat height;
@property(nonatomic,assign) CGFloat centerX;
@property(nonatomic,assign) CGFloat centerY;

/**
 遍历当前view对象的subviews和constraints，对目标进行等比例换算
 
 @param type 想要和基准屏幕等比例换算的属性类型
 @param exceptViews 需要对哪些类进行例外
 */

-(void)adaptScreenWidthType:(BSAdaptScreenWidthType)type exceptViews:(NSArray<Class> *)exceptViews;

@end

@interface UIAutoLayout : NSObject

+ (NSString *)callVersion;

@end

NS_ASSUME_NONNULL_END
