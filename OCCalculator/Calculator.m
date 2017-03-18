//
//  Calculator.m
//  OCCalculator
//
//  Created by 崔健 on 16/4/5.
//  Copyright © 2016年 崔健. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

    //合成属性
@synthesize operand1, operand2, accumulator;

-(id)  init
{
//    自定义初始化属性
    self  =  [super init];
        //初始化分数操作数1，2和结果
    if (self)  {
        operand1 = [ [Fraction  alloc] init];
        operand2 = [ [Fraction alloc] init];
        accumulator = [ [Fraction alloc] init];
    }
    return self;
}

-(void) clear
{
        //清除分数
    accumulator.numerator = 0;
    accumulator.denominator = 0;
}

-(Fraction *)  performOperation: (char) op
{
        //定义用于存储分数返回结果的类对象
    Fraction *result;
    
    switch (op) {
        case '+':
            result = [operand1 add: operand2];
            break;
        case '-':
            result = [operand1 subtract: operand2];
            break;
        case '*':
            result = [operand1 multiply: operand2];
            break;
        case '/':
            result = [operand1 divide: operand2];
            break;
    }
        //将运算后的分子分母赋给分数计算器对象，然后返回
    accumulator.numerator = result.numerator;
    accumulator.denominator = result.denominator;

    return accumulator;
}


@end
