//
//  TimeLineModel.h
//  KLineTest
//
//  Created by L on 2018/6/8.
//  Copyright © 2018年 L. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TimeLineModel : NSObject
@property (nonatomic, copy)    NSString *data_time_stamp;
@property (nonatomic, copy)    NSString *currtTime;
@property (nonatomic, assign)  CGFloat  preClosePx;
@property (nonatomic, assign)  CGFloat  avgPirce;
@property (nonatomic, assign)  CGFloat  lastPirce;
@property (nonatomic, assign)  CGFloat  totalVolume;
@property (nonatomic, assign)  CGFloat  volume;
@property (nonatomic, assign)  CGFloat  trade;
@property (nonatomic, copy)    NSString *rate;
@end
