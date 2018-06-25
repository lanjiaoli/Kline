//
//  DrawKLineView.h
//  KLineTest
//
//  Created by L on 2018/6/7.
//  Copyright © 2018年 L. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, kLineType) {
    /**
     *  实线
     */
    kLineTypeFullLine = 1,
    /**
     *  虚线
     */
    kLineTypeDottedline = 2,
    
    
};
@interface DrawKLineView : UIView
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, strong) NSArray *colorArray; //颜色数组
@property (nonatomic, strong) NSArray *pointArray;
@end
