//
//  Calculator.h
//  OCCalculator
//
//  Created by 崔健 on 16/4/5.
//  Copyright © 2016年 崔健. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

@interface Calculator : NSObject

@property  (strong, nonatomic) Fraction *operand1;
@property  (strong, nonatomic) Fraction *operand2;
@property  (strong, nonatomic) Fraction *accumulator;

-(Fraction *) performOperation: (char) op;

-(void) clear;


@end
