//
//  TimeLinePointModel.m
//  KLineTest
//
//  Created by L on 2018/6/8.
//  Copyright © 2018年 L. All rights reserved.
//

#import "TimeLinePointModel.h"

@implementation TimeLinePointModel
+(TimeLinePointModel *)initPositon:(CGFloat)xPositon yPosition:(CGFloat)yPosition{
    TimeLinePointModel *pointModel = [TimeLinePointModel new];
    pointModel.xPosition = xPositon;
    pointModel.yPosition = yPosition;
    return pointModel;
}
@end
