//
//  Calculator.h
//  OCCalculator
//
//  Created by 崔健 on 16/4/5.
//  Copyright © 2016年 崔健. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

    //处理分数的类


@interface Calculator : NSObject

    //定义分数操作数1，2， 分数计算结果
@property  (strong, nonatomic) Fraction *operand1;
@property  (strong, nonatomic) Fraction *operand2;
@property  (strong, nonatomic) Fraction *accumulator;

    //分数操作符运算
-(Fraction *) performOperation: (char) op;
    //清除分数
-(void) clear;


@end
