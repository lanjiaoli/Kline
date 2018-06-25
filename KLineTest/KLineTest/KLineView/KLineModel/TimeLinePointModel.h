//
//  TimeLinePointModel.h
//  KLineTest
//
//  Created by L on 2018/6/8.
//  Copyright © 2018年 L. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TimeLinePointModel : NSObject
@property (nonatomic, assign) CGFloat xPosition;
@property (nonatomic, assign) CGFloat yPosition;
+(TimeLinePointModel *)initPositon:(CGFloat)xPositon yPosition:(CGFloat)yPosition;
@end
