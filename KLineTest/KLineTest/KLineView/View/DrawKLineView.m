//
//  DrawKLineView.m
//  KLineTest
//
//  Created by L on 2018/6/7.
//  Copyright © 2018年 L. All rights reserved.
//

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define kMarginX 10
#define kMarginY 20
#define kViewHeight self.frame.size.height

#import "DrawKLineView.h"
#import "TimeLineModel.h"
#import "TimeLinePointModel.h"
#import "LimeLineTopView.h"

static CGFloat const kLineWidth = 0.5;//线宽
@interface DrawKLineView()
@property (nonatomic,assign) CGFloat maxPrice ;// 最高点
@property (nonatomic,assign) CGFloat minPrice ;// 最低点
@property (nonatomic,assign) CGFloat averPrice ;// 均值点
@property (nonatomic,assign) CGFloat endPrice ;// 收盘点
@end
@implementation DrawKLineView

-(void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, rect);
    //计算坐标点
    [self caculatePosition];
    
    //绘制曲线
    LimeLineTopView *lineTop = [[LimeLineTopView alloc]initWithContext:context];
    [lineTop drawTimeLineTopWithPositionArray:self.pointArray withLineColor:[UIColor redColor] andLineWidth:1.0f];

    [self drawBackgroundLineWithContext:context];
    
    LimeLineTopView *lineTop1 = [[LimeLineTopView alloc]initWithContext:context];
    [lineTop1 drawTimeLineTopWithPositionArray:self.pointArray withLineColor:[UIColor blueColor] andLineWidth:1.0f];
    
    [self drawBackgroundLineWithContext:context];
}
//绘制背景虚线
- (void)drawBackgroundLineWithContext:(CGContextRef)context{
    //绘制整体边框
    CGContextSetLineWidth(context, kLineWidth);
    CGContextSetStrokeColorWithColor(context,[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:0.33f].CGColor);
    CGFloat width =  ScreenWidth - (kMarginX *2);
    CGContextStrokeRect(context, CGRectMake(kMarginX, kMarginY, width, kViewHeight - (kMarginY*2)));
    //设置
//    for (int i = 1; i < 5; i ++) {
////        [self lineType:kLineTypeFullLine drawline:context startPoint:CGPointMake(kMarginX + (width/5 *i), kMarginY) stopPoint:CGPointMake(kMarginX + (width/5 *i), kViewHeight - kMarginY) color:[UIColor blueColor] lineWidth:kLineWidth];
//    }
     for (int i = 1; i < 4; i ++) {
         [self lineType:kLineTypeDottedline drawline:context startPoint:CGPointMake(kMarginX , kMarginY + (kViewHeight/5 *i)) stopPoint:CGPointMake(width+kMarginX,  kMarginY + (kViewHeight/5 *i)) color:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:0.33f] lineWidth:kLineWidth];
     }
}

#pragma mark - **************** 使用CGContextRef绘制中间的虚实线
- (void)lineType:(kLineType)lineType drawline:(CGContextRef)context
      startPoint:(CGPoint)startPoint
       stopPoint:(CGPoint)stopPoint
           color:(UIColor *)color
       lineWidth:(CGFloat)lineWitdth
{
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetLineWidth(context, lineWitdth);
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(context, stopPoint.x, stopPoint.y);
    if (lineType == kLineTypeDottedline) {
        //设置虚线排列的宽度间隔:下面的arr中的数字表示先绘制5个点再绘制1个点
        CGFloat arr[] = {6,1};
        //下面最后一个参数“1”代表排列的个数。
        CGContextSetLineDash(context, 0, arr, 2);
    }
    CGContextStrokePath(context);
}

#pragma mark -  计算坐标点
- (NSArray *)caculatePosition{
    CGFloat minY = kMarginX;
    CGFloat maxY = kViewHeight-kMarginY;
    __block CGFloat offset = CGFLOAT_MIN;
    
    CGFloat width =  ScreenWidth - (kMarginX *2);
    //算Y轴的单元值
    //x轴每一分钟一个点
    //每一个横坐标所占单元
    CGFloat unitX = width/240.f;
    NSMutableArray *pointArr = [NSMutableArray array];
    NSMutableArray *colorArr = [NSMutableArray arrayWithCapacity:1];
    if (self.dataArr.count > 0) {
        for (int i = 0; i < self.dataArr.count; i++) {
            TimeLineModel *lineModel = self.dataArr[i];
            offset = offset >fabs(lineModel.preClosePx-lineModel.lastPirce) ? offset:fabs(lineModel.preClosePx-lineModel.lastPirce);
            
        }
    }
    
    self.maxPrice = ((TimeLineModel *)[_dataArr firstObject]).preClosePx  + offset;
    self.minPrice =((TimeLineModel *)[_dataArr lastObject]).preClosePx  - offset;
    self.averPrice = (self.maxPrice + self.minPrice)/2;
    CGFloat unitY = (self.maxPrice - self.minPrice)/(maxY-minY);

    if (!self.dataArr ||self.dataArr == nil) {
        return nil;
    }else{
        //遍历当前的点坐标放入数组
        [self.dataArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            TimeLineModel *lineModel = (TimeLineModel *)obj;
            CGFloat x =  idx*unitX+kMarginX;
            //y值考虑最大可能超出，加上绘制的线宽和矩形框的线宽
            CGFloat y = maxY-(lineModel.lastPirce - self.minPrice)/unitY+kLineWidth+1.0f;
            TimeLinePointModel *pointModel = [TimeLinePointModel initPositon:x yPosition:y];
            [pointArr addObject:pointModel];
        }];
        self.pointArray = pointArr;
    }
    return self.pointArray;
}















@end
