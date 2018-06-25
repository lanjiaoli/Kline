//
//  ViewController.m
//  KLineTest
//
//  Created by L on 2018/6/7.
//  Copyright © 2018年 L. All rights reserved.
//

#import "ViewController.h"
#import "DrawKLineView.h"
#import "TimeLineModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *datas = [dict objectForKey:@"data3"];
    NSMutableArray *dataArray = [NSMutableArray array];
    
    for (NSDictionary *dic in datas) {
        TimeLineModel *model = [[TimeLineModel alloc]init];
        model.data_time_stamp = dict[@"data_time_stamp"];
        model.currtTime = dic[@"curr_time"];
        model.preClosePx = [dic[@"pre_close_px"] floatValue] ;
        model.avgPirce = [dic[@"avg_pirce"] floatValue];
        model.lastPirce = [dic[@"last_px"]floatValue];
        model.volume = [dic[@"last_volume_trade"]floatValue];
        model.rate = dic[@"rise_and_fall_rate"];
        [dataArray addObject:model];
    }
    
    DrawKLineView *lineView = [[DrawKLineView alloc]init];
    lineView.dataArr = dataArray;
    lineView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 240);
    lineView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:lineView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
