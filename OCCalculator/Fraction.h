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
-(void)  setTo:  (int)  n over: (int)  d;

-(Fraction *)  add:  (Fraction *)  f;
-(Fraction *) subtract: (Fraction *) f;
-(Fraction *) multiply: (Fraction *)  f;
-(Fraction *) divide: (Fraction *) f;

-(void) reduce;

-(double) converToNum;
-(NSString *)  converToString;

@end
