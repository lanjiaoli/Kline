//
//  LimeLineTopView.h
//  KLineTest
//
//  Created by L on 2018/6/8.
//  Copyright © 2018年 L. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LimeLineTopView : NSObject
/**曲线点位置数据数组*/
@property(nonatomic,strong) NSArray *positionArr;

@property(nonatomic,strong) CAShapeLayer *lineLayer;

-(instancetype)initWithContext:(CGContextRef)context;
-(void)drawTimeLineTopWithPositionArray:(NSArray *)pointArray withLineColor:(UIColor *)lineColor andLineWidth:(CGFloat)lineWidth;
@end
