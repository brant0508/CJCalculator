//
//  Fraction.m
//  OCCalculator
//
//  Created by 崔健 on 16/4/5.
//  Copyright © 2016年 崔健. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

@synthesize numerator,denominator;


    //设置分子和分母
-(void) setTo:(int)n over:(int)d
{
    numerator = n;
    denominator = d;
}

    //打印  分子、分母
-(void)print
{
    NSLog(@"%i/%i",numerator,denominator);
}
//判断分母是否为零，否 返回double型分数
-(double) converToNum
{
    if (denominator != 0)
        return (double) numerator / denominator;
    else
        return NAN;
}
    //将分数转换成字符串表示
-(NSString *)  converToString
{
    if (numerator == denominator)
        if  (numerator == 0)
            return @"0";
    else
        return @"1";
    else if (denominator == 1)
        return [NSString  stringWithFormat: @"%i",numerator];
    else
        return [NSString stringWithFormat: @"%i/%i",
                numerator,denominator];
}

//添加一个分数到消息的接收器

-(Fraction *) add: (Fraction *)  f
{
    //将两个数相加
    // a / b  ＋ c / d = (a * d) =(b * c ) / (b * d)

    //储存相加后的结果

    Fraction *result = [ [Fraction alloc] init];

    result.numerator = numerator * f.denominator +
    denominator * f.numerator;
    result.denominator = denominator * f.denominator;

    [result reduce];
    return  result;
}

-(Fraction *) subtract: (Fraction *)   f
{
    //将两个数相减
    // a / b - c / d = (a * d) -(b * c) / (b * d)
    Fraction  *result = [[Fraction alloc ] init];

    result.numerator = numerator * f.denominator -
        denominator * f.numerator;
    result.denominator = denominator * f.denominator;
    [result reduce];

    return  result;
}

-(Fraction *) multiply: (Fraction *)  f
{
    Fraction *result = [ [Fraction alloc] init];

    result.numerator = numerator * f.numerator;
    result.denominator = denominator * f.denominator;
    [result reduce];

    return  result;
}

-(Fraction *) divide: (Fraction *) f
{
    Fraction *result = [ [Fraction alloc] init];

    result.numerator = numerator * f.denominator;
    result.denominator = denominator * f.numerator;
    [result reduce];

    return  result;
}
    //简化分数
-(void) reduce
{
    int u = numerator;
    int v = denominator;
    int temp;

    if ( u == 0 )
        return;
    else if (u  <  0)
        u = -u;

    while (v != 0) {
        temp  = u % v;
        u = v;
        v = temp;
    }

    numerator /= u;
    denominator /= u;
}


@end








