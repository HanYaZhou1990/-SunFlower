//
//  EMBALoginInputView.m
//  Sunflower
//
//  Created by hanyazhou on 14-10-24.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBALoginInputView.h"

@implementation EMBALoginInputView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        view.layer.cornerRadius = 5.0f;
        view.backgroundColor = [UIColor blackColor];
        view.alpha = 0.6;
        [self addSubview:view];
        
        [self createTextFieldWithFram:frame];
    }
    return self;
}

- (void)createTextFieldWithFram:(CGRect)frame{
    _userNameField = [[YZTextField alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height/2)];
    _userNameField.borderStyle = UITextBorderStyleNone;
    _userNameField.placeholder = @"用户名称";
    UIView *leftView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 46, 46)];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user.png"]];
    imageView.frame = CGRectMake(leftView1.frame.size.width/4, leftView1.frame.size.height/4, leftView1.frame.size.width/2, leftView1.frame.size.height/2);
    [leftView1 addSubview:imageView];
    _userNameField.leftView =  leftView1;
    _userNameField.leftViewMode = UITextFieldViewModeAlways;
    [self addSubview:_userNameField];
    
    _userPswField = [[YZTextField alloc]initWithFrame:CGRectMake(0, frame.size.height/2, frame.size.width, frame.size.height/2)];
    _userPswField.borderStyle = UITextBorderStyleNone;
    _userPswField.placeholder = @"密码";
    UIView *leftView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 46, 46)];
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lock.png"]];
    imageView2.frame = CGRectMake(leftView2.frame.size.width/4, leftView2.frame.size.height/4, leftView2.frame.size.width/2, leftView2.frame.size.height/2);
    [leftView2 addSubview:imageView2];
    _userPswField.leftView = leftView2;
    _userPswField.leftViewMode = UITextFieldViewModeAlways;
    [self addSubview:_userPswField];
}

- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();//获得处理上下文
    CGContextSetFillColorWithColor(context, UIColorFromRGB(0x2a2823).CGColor);//设置线条颜色
    
    CGContextMoveToPoint(context, 20, rect.size.height/2);//设置线的坐标点
    CGContextAddLineToPoint(context, rect.size.width-20,rect.size.height/2);//设置线的结束点
    
    CGContextSetLineCap(context, kCGLineCapSquare);//设置线条样式
    CGContextSetLineWidth(context, 0.5);//线的宽度
    CGContextStrokePath(context);//链接上边的坐标点
    [super drawRect:rect];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self endEditing:YES];
}

@end

@implementation YZTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
            // Initialization code
    }
    return self;
}
-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x+50, bounds.origin.y+12, bounds.size.width -10, bounds.size.height);//更好理解些
    return inset;
}
- (void)drawPlaceholderInRect:(CGRect)rect
{
    [[UIColor whiteColor] setFill];
//#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
    [[self placeholder] drawInRect:rect withFont:[UIFont systemFontOfSize:18]];
//#else
//    NSMutableParagraphStyle *paragraphStyle= [[NSMutableParagraphStyle alloc] init];
//    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
//    paragraphStyle.alignment = NSTextAlignmentLeft;
//    [[self placeholder] drawInRect:rect withAttributes:
//     @{[UIFont systemFontOfSize:22]: NSFontAttributeName,
//       paragraphStyle:NSParagraphStyleAttributeName,[UIColor blackColor]:NSForegroundColorAttributeName,[UIColor whiteColor]:NSStrokeColorAttributeName,[NSNumber numberWithFloat:2.0]:NSStrokeWidthAttributeName}];
//    
//    
//#endif
}
@end