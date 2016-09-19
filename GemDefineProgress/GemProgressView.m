//
//  GemProgressView.m
//  GemDefineProgress
//
//  Created by GemShi on 16/8/18.
//  Copyright © 2016年 GemShi. All rights reserved.
//

#import "GemProgressView.h"

@implementation GemProgressView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //画弧/扇形
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, rect.size.width / 2, rect.size.height / 2);
    CGFloat radius = (rect.size.width - 10) / 2;
    CGFloat endAngle = self.progress / 100 * 2 * M_PI - M_PI_4;
    CGContextAddArc(context, rect.size.width / 2, rect.size.height / 2, radius, -M_PI_4, endAngle, 0);
    CGContextFillPath(context);
    
    //画文字
    NSString *text = [NSString stringWithFormat:@"%.2f%%",self.progress];
    [text drawInRect:CGRectMake(rect.size.width / 2 - 30, rect.size.height / 2 - 15, 60, 30) withAttributes:@{NSForegroundColorAttributeName:[UIColor yellowColor],NSFontAttributeName:[UIFont systemFontOfSize:15]}];
}
//重写set方法
-(void)setProgress:(float)progress
{
    /**
     *  1.set方法中不能用点语法，防止循环调用
     *  2.drawRect方法是在一开始显示的时候才调用，因此需要重绘实时改变显示状态
     */
    _progress = progress * 100;
    [self setNeedsDisplay];
}

@end
