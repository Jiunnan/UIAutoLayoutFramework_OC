//
//  UIAutoLayout.m
//  UIAutoLayoutFramework_OC
//
//  Created by 林俊男 on 2021/09/14.
//

#import "UIAutoLayout.h"
#import "UIAutoLayoutParams.h"

@implementation UIView(BSAdaptScreen)

@dynamic x;
@dynamic right;
@dynamic y;
@dynamic bottom;
@dynamic size;
@dynamic width;
@dynamic height;
@dynamic centerX;
@dynamic centerY;

-(CGFloat)x{
    return self.frame.origin.x;
}

-(void)setX:(CGFloat)x{
    CGRect rect = self.frame;
    rect.origin.x = x;
    [self setFrame:rect];
}

-(CGFloat) right{
    return (self.frame.origin.x+self.frame.size.width);
}

-(void)setRight:(CGFloat)right{
    CGRect rect = self.frame;
    rect.origin.x = right-rect.size.width;
    [self setFrame:rect];
}

-(CGFloat)y{
    return self.frame.origin.y;
}

-(void)setY:(CGFloat)y{
    CGRect rect = self.frame;
    rect.origin.y = y;
    [self setFrame:rect];
}

-(CGFloat)bottom{
    return (self.frame.origin.y+self.height);
}

-(void)setBottom:(CGFloat)bottom{
    CGRect rect = self.frame;
    rect.origin.y = bottom - rect.size.height;
    [self setFrame:rect];
}

-(CGSize)size{
    return self.frame.size;
}

-(void)setSize:(CGSize)size{
    CGRect rect = self.frame;
    rect.size = size;
    [self setFrame:rect];
}

-(CGFloat)width{
    return self.frame.size.width;
}

-(void)setWidth:(CGFloat)width{
    CGRect rect = self.frame;
    rect.size.width = width;
    [self setFrame:rect];
}

-(CGFloat)height{
    return self.frame.size.height;
}

-(void)setHeight:(CGFloat)height{
    CGRect rect = self.frame;
    rect.size.height = height;
    [self setFrame:rect];
}

-(CGFloat)centerX{
    return self.center.x;
}

-(void)setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    [self setCenter:center];
}

-(CGFloat)centerY{
    return self.center.y;
}

-(void)setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    [self setCenter:center];
}

-(void)adaptScreenWidthType:(BSAdaptScreenWidthType)type exceptViews:(NSArray<Class> *)exceptViews{
    if (type == AdaptScreenWidthTypeNone) {
        return;
    }
    
    if (![self isExceptViewClassWithClassArray:exceptViews]) {
        
        //是否要对约束进行等比例
        BOOL adaptConstraint = ((type & BSAdaptScreenWidthTypeConstraint)||(type == BSAdaptScreenWidthTypeAll));
        
        // 是否对字体大小进行等比例
        BOOL adaptFontSize = ((type & BSAdaptScreenWidthTypeFontSize)||(type == BSAdaptScreenWidthTypeAll));
        
        // 是否对圆角大小进行等比例
        BOOL adaptCornerRadius = ((type & BSAdaptScreenWidthTypeCornerRadius)||(type == BSAdaptScreenWidthTypeAll));
        
        //约束
        if (adaptConstraint) {
            [self.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.constant = calValue(obj.constant);
            }];
        }
        
        //字体大小
        if (adaptFontSize) {
            if ([self isKindOfClass:[UILabel class]] && ![self isKindOfClass:NSClassFromString(@"UIButtonLabel")]) {
                UILabel *resLbl = (UILabel *)self;
                resLbl.font = [UIFont fontWithName:resLbl.font.fontName size:calValue(resLbl.font.pointSize)];
            }else if ([self isKindOfClass:[UITextField class]]){
                UITextField *resTxt = (UITextField *)self;
                resTxt.font = [UIFont fontWithName:resTxt.font.fontName size:calValue(resTxt.font.pointSize)];
            }else if ([self isKindOfClass:[UIButton class]]){
                UIButton *resBtn = (UIButton *)self;
                resBtn.titleLabel.font = [UIFont fontWithName:resBtn.titleLabel.font.fontName size:calValue(resBtn.titleLabel.font.pointSize)];
            }else if ([self isKindOfClass:[UITextView class]]){
                UITextView *resTxtView = (UITextView *)self;
                resTxtView.font = [UIFont fontWithName:resTxtView.font.fontName size:calValue(resTxtView.font.pointSize)];
            }
        }
        
        //圆角
        if (adaptCornerRadius) {
            if (self.layer.cornerRadius) {
                self.layer.cornerRadius = calValue(self.layer.cornerRadius);
            }
        }
        
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //继续对子view操作
            [obj adaptScreenWidthType:type exceptViews:exceptViews];
        }];
    }
}

-(BOOL)isExceptViewClassWithClassArray:(NSArray<Class> *)classArray{
    __block BOOL isExcept = NO;
    [classArray enumerateObjectsUsingBlock:^(Class  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([self isKindOfClass:obj]) {
            isExcept = YES;
            *stop = YES;
        }
    }];
    return isExcept;
}

@end

@implementation UIAutoLayout

+ (NSString *)callVersion {
    return FrameworkVersion;
}


@end
