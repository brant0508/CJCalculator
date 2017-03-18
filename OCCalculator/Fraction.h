//
//  Fraction.h
//  OCCalculator
//
//  Created by 崔健 on 16/4/5.
//  Copyright © 2016年 崔健. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Fraction : NSObject

@property int  numerator,denominator;

-(void)  print;

//分子分母设置方法
-(void)  setTo:  (int)  n over: (int)  d;

    // 分数计算方法：参数为操作数2
-(Fraction *)  add:  (Fraction *)  f;
-(Fraction *) subtract: (Fraction *) f;
-(Fraction *) multiply: (Fraction *)  f;
-(Fraction *) divide: (Fraction *) f;

    //简化分数方法
-(void) reduce;

    //判断分母是否为零
-(double) converToNum;
-(NSString *)  converToString;

@end
