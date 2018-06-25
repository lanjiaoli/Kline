//
//  LimeLineTopView.m
//  KLineTest
//
//  Created by L on 2018/6/8.
//  Copyright © 2018年 L. All rights reserved.
//

#import "LimeLineTopView.h"
#import "TimeLinePointModel.h"
/**
 *  TimeLineTopView的高度
 */
#define kTimeLineTopViewHeight 240.f
#define kHeightMargin 20

@interface LimeLineTopView ()
@property(nonatomic,assign) CGContextRef context;

@end
@implementation LimeLineTopView
-(instancetype)initWithContext:(CGContextRef)context{
    self = [super init];
    if (self) {
        self.context = context;
    }
    return self;
}
-(void)drawTimeLineTopWithPositionArray:(NSArray *)pointArray withLineColor:(UIColor *)lineColor andLineWidth:(CGFloat)lineWidth{
    UIBezierPath *path = [UIBezierPath bezierPath];
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    path.lineWidth = lineWidth;
    [lineColor setStroke];
    for (int i = 0; i < pointArray.count; i++) {
        TimeLinePointModel *pointModel = pointArray[i];
        
        if (i == 0) {
            //移动到当前点
            [path moveToPoint:CGPointMake(pointModel.xPosition, pointModel.yPosition)];
            [path1 moveToPoint:CGPointMake(pointModel.xPosition, pointModel.yPosition)];
        }
        
        if (i+1 < pointArray.count) {
            TimeLinePointModel *nextPositionModel = (TimeLinePointModel *)pointArray[i+1];
            //绘制分时线条
            [path addLineToPoint:CGPointMake(nextPositionModel.xPosition, nextPositionModel.yPosition)];
            [path1 addLineToPoint:CGPointMake(nextPositionModel.xPosition, nextPositionModel.yPosition)];
            NSLog(@"%f,%f",pointModel.xPosition,pointModel.yPosition);
        }
        
    }
    [path stroke];
    //绘制背景
//    TimeLinePointModel *startPointModel = pointArray.firstObject;
//    TimeLinePointModel *endPointModel = pointArray.lastObject;
//    [path1 addLineToPoint:CGPointMake(endPointModel.xPosition, kTimeLineTopViewHeight-kHeightMargin)];
//    [path1 addLineToPoint:CGPointMake(10, kTimeLineTopViewHeight-kHeightMargin)];
//    [path1 addLineToPoint:CGPointMake(10, startPointModel.yPosition)];
//    [[UIColor blackColor]setFill];
//    [path1 fill];
}
@end
